import 'package:dartway_app/dartway_app.dart';
import 'package:dartway_core_serverpod_flutter/dartway_core_serverpod_flutter.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:project_name_flutter/common/app_scaffold.dart';
import 'package:project_name_flutter/ui_kit/ui_kit.dart';

class ProfilePage extends ConsumerWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppScaffold.main(
      appBar: AppBar(
        title: const AppText.title('Profile'),
      ),
      body: Column(
        children: [
          const AppText.title('Here will be some settings and all that'),
          AppButton.text(
            'Sign out',
            dwCallback: DwCallback.create(
              () => ref.signOut(),
            ),
          )
        ],
      ),
    );
  }
}
