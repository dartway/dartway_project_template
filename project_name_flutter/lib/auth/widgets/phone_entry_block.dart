import 'package:dartway_app/dartway_app.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:project_name_flutter/auth/logic/auth_step.dart';
import 'package:project_name_flutter/ui_kit/ui_kit.dart';

import '../logic/auth_state.dart';

class PhoneEntryBlock extends HookConsumerWidget {
  const PhoneEntryBlock({
    super.key,
    // required this.isAdminShadowMode,
  });

  // final bool isAdminShadowMode;

  @override
  Widget build(
    BuildContext context,
    WidgetRef ref,
  ) {
    final state = ref.watch(authStateProvider);

    final isRegistration = switch (state.currentStep) {
      AuthStep.registration => true,
      AuthStep.login => false,
      _ => throw UnimplementedError(),
    };

    print('isRegistration: $isRegistration');

    return Column(
      children: [
        const AppText.title(
          'Укажите ваши данные',
        ),
        const Gap(36),
        if (isRegistration)
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: AppTextFormField(
              labelText: 'Имя',
              value: state.firstName,
              onChanged: (value) =>
                  ref.read(authStateProvider.notifier).update(firstName: value),
              validator: (p0) => p0 == null || p0.isEmpty || p0.length < 3
                  ? 'Обязательное поле'
                  : null,
            ),
          ),
        PhoneTextField(
          value: state.phoneRaw,
          onChanged: (value) =>
              ref.read(authStateProvider.notifier).update(phoneRaw: value),
        ),
        if (isRegistration)
          Padding(
            padding: const EdgeInsets.only(top: 24.0),
            child: CheckboxFormField(
              value: state.allDocumentsAccepted,
              onChanged: (value) =>
                  {}, //ref.read(authStateProvider.notifier).update),

              validator: (value) =>
                  value != true ? 'Необходимо дать согласие' : null,
              titleWidget: MultiLinkText.multi(
                textAlign: TextAlign.start,
                parts: [
                  MultiLinkTextPart(
                    'Я ознакомлен(а) и даю согласие с условиями',
                    'оферты,',
                    wipProgressNotificationCallback,
                  ),
                  MultiLinkTextPart(
                    null,
                    'пользовательского соглашения,',
                    wipProgressNotificationCallback,
                  ),
                  MultiLinkTextPart(
                    'принимаю условия',
                    'политики обработки персональных данных',
                    wipProgressNotificationCallback,
                  ),
                ],
              ),
            ),
          ),
        if (isRegistration)
          Padding(
            padding: const EdgeInsets.only(top: 24.0),
            child: CheckboxFormField(
              value: state.allDocumentsAccepted,
              onChanged: (value) =>
                  {}, //ref.read(authStateProvider.notifier).update),
              titleWidget: MultiLinkText.multi(
                textAlign: TextAlign.start,
                parts: [
                  MultiLinkTextPart(
                    'Я даю',
                    'согласие',
                    wipProgressNotificationCallback,
                  ),
                  MultiLinkTextPart(
                    'на получение информационной и рекламной рассылки, в связи с чем даю',
                    'согласие',
                    wipProgressNotificationCallback,
                  ),
                  MultiLinkTextPart(
                    'на обработку персональных данных в соответствии с',
                    'политикой обработки персональных данных',
                    wipProgressNotificationCallback,
                  ),
                ],
              ),
            ),
          ),
        const Spacer(),
        const SizedBox(height: 20),
        AppButton.primary(
          'Продолжить',
          requireValidation: true,
          dwCallback: DwCallback.create(() async {
            await ref.read(authStateProvider.notifier).requestOtp();
          }),
        ),
        const Gap(24),
        isRegistration
            ? MultiLinkText.single(
                text: 'Уже есть аккаунт? ',
                linkText: 'Войти',
                onLinkTap: DwCallback.create(
                  () =>
                      ref.read(authStateProvider.notifier).goTo(AuthStep.login),
                ),
              )
            : MultiLinkText.single(
                text: 'Еще нет аккаунта? ',
                linkText: 'Регистрация',
                onLinkTap: DwCallback.create(
                  () => ref
                      .read(authStateProvider.notifier)
                      .goTo(AuthStep.registration),
                ),
              ),
      ],
    );
  }
}
