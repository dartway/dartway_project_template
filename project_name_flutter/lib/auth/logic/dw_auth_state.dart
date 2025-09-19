import 'dart:async';

import 'package:dartway_app/dartway_app.dart';
import 'package:dartway_auth_serverpod_client/dartway_auth_serverpod_client.dart';
import 'package:dartway_core_serverpod_flutter/dartway_core_serverpod_flutter.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:project_name_flutter/core/app_core.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:serverpod_auth_client/serverpod_auth_client.dart';

part 'dw_auth_state.freezed.dart';
part 'dw_auth_state.g.dart';

@freezed
abstract class DwAuthStateModel with _$DwAuthStateModel {
  const factory DwAuthStateModel() = _DwAuthStateModel;
}

@Riverpod(keepAlive: true)
class DwAuthState extends _$DwAuthState {
  StreamSubscription? _subscription;
  String? _subscriptionPhone;

  @override
  void build() {
    ref.onDispose(() {
      print("Disposing state");
      _subscription?.cancel();
      _subscription = null;
      _subscriptionPhone = null;
    });
  }

  /// Стартуем процесс верификации:
  /// сервер откроет стрим и одновременно сделает requestVerification.
  Future<void> startVerification({
    required DwPhoneVerificationRequestType requestType,
    required String phoneNumber,
    Map<String, String>? requestExtraData,
    Map<String, String>? verificationExtraParams,
  }) async {
    // если уже слушаем этот же номер — ничего не делаем
    if (_subscription != null && _subscriptionPhone == phoneNumber) return;

    _closeStream();

    final outStream = AppCore
        .serverpodClient.modules.dartway_auth_serverpod.phoneAuth
        .startVerification(
      requestType: requestType,
      phoneNumber: phoneNumber,
      requestExtraData: requestExtraData,
      verificationExtraParams: verificationExtraParams,
    );

    _subscriptionPhone = phoneNumber;

    _subscription = outStream.listen(
      (update) async {
        if (kDebugMode) debugPrint('DwAuthState stream update: $update');

        if (update is AuthenticationResponse) {
          await _processAuthenticationResponse(update);
        } else if (update is DwAppNotification) {
          if (kDebugMode) debugPrint('Notification: ${update.title}');

          dw.notify.info(update.title);
        }
      },
      onError: (e, st) {
        if (kDebugMode) debugPrint('Auth stream error: $e\n$st');
      },
      onDone: () {
        _subscriptionPhone = null;
      },
      cancelOnError: false,
    );
  }

  /// Подтверждение OTP отдельным методом
  Future<AuthenticationResponse> verifyOtp({
    required String phoneNumber,
    required String otpDigits,
  }) async {
    final res = await AppCore
        .serverpodClient.modules.dartway_auth_serverpod.phoneAuth
        .verifyWithOneTimePassword(phoneNumber, otpDigits);

    await _processAuthenticationResponse(res);
    return res;
  }

  void _closeStream() {
    _subscription?.cancel();
    _subscription = null;
    _subscriptionPhone = null;
  }

  Future<void> _processAuthenticationResponse(
    AuthenticationResponse authResponse,
  ) async {
    try {
      if (authResponse.success &&
          authResponse.userInfo != null &&
          authResponse.keyId != null &&
          authResponse.key != null) {
        await DwCore.serverpodSessionManager.registerSignedInUser(
          authResponse.userInfo!,
          authResponse.keyId!,
          authResponse.key!,
        );
        // Можно закрыть стрим после успешного входа
        _closeStream();
      }
    } catch (e, st) {
      if (kDebugMode) debugPrint('processAuth error: $e\n$st');
    }
  }

  Future<bool> userExists({
    required String identifier,
  }) async {
    ref.read(DwRepository.globalRefreshTriggerProvider.notifier).state =
        DateTime.now();

    if (kDebugMode) {
      debugPrint('Searching for user with phone $identifier');
    }

    return null !=
        await ref.readMaybeModelCustom<UserInfo>(
          backendFilter: DwBackendFilter.value(
            type: DwBackendFilterType.equals,
            fieldName: 'userIdentifier',
            fieldValue: identifier,
          ),
        );
  }
}
