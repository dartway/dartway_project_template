import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:project_name_flutter/common/app_scaffold.dart';
import 'package:project_name_flutter/ui_kit/ui_kit.dart';

class LearningPage extends ConsumerWidget {
  const LearningPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppScaffold.main(
      body: Container(
        color: Colors.amberAccent,
        child: const AppText.title('Функционал в разработке'),
      ),
    );
  }
}
