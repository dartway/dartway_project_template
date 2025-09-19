import 'package:dartway_auth_serverpod_client/dartway_auth_serverpod_client.dart';

enum AuthStep {
  greeting(
    title: 'Добро пожаловать!',
    previousStep: null,
  ),
  registration(
    title: 'Шаг 1 из 3',
    previousStep: greeting,
  ),
  login(
    title: 'Шаг 1 из 2',
    previousStep: greeting,
  ),
  registrationConfirmation(
    title: 'Шаг 2 из 3',
    previousStep: registration,
  ),
  loginConfirmation(
    title: 'Шаг 2 из 2',
    previousStep: login,
  );

  final String? title;
  final AuthStep? previousStep;

  const AuthStep({
    required this.title,
    required this.previousStep,
  });

  AuthStep get requestOtpNextStep => switch (this) {
        AuthStep.registration => AuthStep.registrationConfirmation,
        AuthStep.login => AuthStep.loginConfirmation,
        _ => throw StateError(
            'Incorrect AuthStep $this while requestOtp is called'),
      };

  DwPhoneVerificationRequestType get requestOtpVerificationRequestType =>
      switch (this) {
        AuthStep.registration => DwPhoneVerificationRequestType.registration,
        AuthStep.login => DwPhoneVerificationRequestType.signIn,
        _ => throw StateError(
            'Incorrect AuthStep $this while requestOtp is called'),
      };
}
