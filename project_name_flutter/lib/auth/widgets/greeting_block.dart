import 'package:dartway_app/dartway_app.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:project_name_flutter/auth/logic/auth_state.dart';
import 'package:project_name_flutter/auth/logic/auth_step.dart';
import 'package:project_name_flutter/ui_kit/ui_kit.dart';

class GreetingBlock extends ConsumerWidget {
  const GreetingBlock({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Spacer(
          flex: 2,
        ),
        const AppText.title('Next Level'),
        const Gap(12),
        const AppText.body(
            'Выполните вход или зарегистрируйтесь, чтобы продолжить'),
        const Spacer(
          flex: 1,
        ),
        AppButton.primary(
          'Регистрация',
          height: 40,
          width: 250,
          dwCallback: DwCallback.create(
            () => ref
                .read(authStateProvider.notifier)
                .goTo(AuthStep.registration),
          ),
        ),
        const Gap(20),
        AppButton.secondary(
          'Вход',
          height: 40,
          width: 250,
          dwCallback: DwCallback.create(
            () => ref.read(authStateProvider.notifier).goTo(AuthStep.login),
          ),
        ),
        const Spacer(
          flex: 3,
        ),
      ],
    );
  }
}
