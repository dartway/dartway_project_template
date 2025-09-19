import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:project_name_flutter/common/app_scaffold.dart';
import 'package:project_name_flutter/core/user_profile_getters.dart';
import 'package:project_name_flutter/ui_kit/ui_kit.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppScaffold.main(
      appBar: AppBar(
        title: AppText.title('Привет, ${ref.watchUserProfile!.firstName}'),
        actions: const [
          // GetcourseButton()
        ],
      ),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            // Container(
            //   height: 120,
            //   color: const Color.fromARGB(255, 180, 174, 156),
            //   child: const AppText.title(
            //       'Блок Персонализация - приглашение к анкете / информация о профиле (если анкета пройдена)'),
            // ),
            // const Gap(20),
            // Container(
            //   height: 150,
            //   color: Colors.limeAccent,
            //   child: const AppText.title(
            //     'Блок Вовлечение - трекинг целей / упражнений / актуальное задание',
            //   ),
            // ),
            Gap(20),
            Gap(20),
          ],
        ),
      ),
    );
  }
}
