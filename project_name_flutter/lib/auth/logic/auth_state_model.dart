import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:project_name_flutter/auth/logic/auth_step.dart';

part 'auth_state_model.freezed.dart';

/// Иммутабельная модель состояния без ValueNotifier внутри.
/// Ввод пользователя хранится в простых строках, бизнес-флаги — отдельными полями.
@freezed
class AuthStateModel with _$AuthStateModel {
  const factory AuthStateModel({
    required AuthStep currentStep,

    // Поля ввода
    required String firstName,
    required String phoneRaw,
    required String otpRaw,

    // Согласия
    required bool allDocumentsAccepted,
    required bool marketingAgreed,
  }) = _AuthStateModel;

  const AuthStateModel._();

  /// Нормализованный телефон: только цифры
  String get phoneDigits => phoneRaw.replaceAll(RegExp(r'\D'), '');

  /// Нормализованный код: только цифры
  String get otpDigits => otpRaw.replaceAll(RegExp(r'\D'), '');

  /// Простая проверка телефона (10–15 цифр)
  bool get isPhoneValid => phoneDigits.length >= 10 && phoneDigits.length <= 15;

  /// Требования для запроса кода на шаге регистрации
  bool get registrationPrerequisitesOk =>
      firstName.trim().isNotEmpty && allDocumentsAccepted;

  /// Можно ли запрашивать OTP прямо сейчас
  bool get canRequestOtp {
    if (!isPhoneValid) return false;
    if (currentStep == AuthStep.registration && !registrationPrerequisitesOk) {
      return false;
    }
    return true;
    // !isRequestingOtp && !isVerifyingOtp;
  }

  /// Можно ли подтверждать код
  bool get canVerifyOtp =>
      otpDigits.isNotEmpty; // && !isRequestingOtp && !isVerifyingOtp;
}
