import 'package:dartway_app/dartway_app.dart';
import 'package:dartway_auth_serverpod_client/dartway_auth_serverpod_client.dart';
import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'auth_state_model.dart';
import 'auth_step.dart';
import 'dw_auth_state.dart';

part 'auth_state.g.dart';

@riverpod
class AuthState extends _$AuthState {
  @override
  AuthStateModel build() {
    return const AuthStateModel(
      currentStep: AuthStep.greeting,
      firstName: '',
      phoneRaw: kDebugMode ? '+7 (995) 900-29-01' : '',
      otpRaw: '',
      allDocumentsAccepted: false,
      marketingAgreed: false,
    );
  }

  void goTo(AuthStep step) {
    state = state.copyWith(currentStep: step);
  }

  void update({
    String? firstName,
    String? phoneRaw,
    String? otpRaw,
    bool? allDocumentsAccepted,
    bool? marketingAgreed,
  }) {
    state = state.copyWith(
      firstName: firstName ?? state.firstName,
      phoneRaw: phoneRaw ?? state.phoneRaw,
      otpRaw: otpRaw ?? state.otpRaw,
      allDocumentsAccepted: allDocumentsAccepted ?? state.allDocumentsAccepted,
      marketingAgreed: marketingAgreed ?? state.marketingAgreed,
    );
  }

  /// Отправка кода
  Future<void> requestOtp() async {
    final userExists = await ref
        .read(dwAuthStateProvider.notifier)
        .userExists(identifier: state.phoneDigits);

    if (state.currentStep == AuthStep.login && !userExists) {
      dw.notify.error(
          'Учетная запись не найдена, укажите имя и примите условия пользовательского соглашения для продолжения');
      goTo(AuthStep.registration);
      return;
    } else if (state.currentStep == AuthStep.registration && userExists) {
      dw.notify.warning('Учетная уже существует, выполняем вход');
    }

    await ref.read(dwAuthStateProvider.notifier).startVerification(
          requestType: userExists
              ? DwPhoneVerificationRequestType.signIn
              : DwPhoneVerificationRequestType.registration,
          phoneNumber: state.phoneDigits,
          requestExtraData: !userExists
              ? {
                  'firstName': state.firstName,
                  'agreedForMarketingCommunications':
                      state.marketingAgreed.toString(),
                }
              : null,
        );

    // локальный шаг — только проект решает
    state = state.copyWith(currentStep: state.currentStep.requestOtpNextStep);
  }

  /// Подтверждение кода
  Future<bool> verifyOtp() async {
    final response = await ref.read(dwAuthStateProvider.notifier).verifyOtp(
          phoneNumber: state.phoneDigits,
          otpDigits: state.otpDigits,
        );

    // if (!response.success) {
    //   state = state.copyWith(lastError: 'Неверный или просроченный код');
    // }

    return response.success;
  }
}
