import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nit_router/nit_router.dart';
import 'package:project_name_flutter/build_info.dart';
import 'package:project_name_flutter/core/router/router.dart';
import 'package:project_name_flutter/ui_kit/ui_kit.dart';

class AppScaffold extends ConsumerWidget {
  const AppScaffold.main({
    super.key,
    required this.body,
    this.appBar,
    this.bodyInsets = const EdgeInsets.all(16),
  }) : showBottomNavigationBar = true;

  const AppScaffold.inner({
    super.key,
    required this.body,
    this.appBar,
    this.bodyInsets = const EdgeInsets.all(16),
  }) : showBottomNavigationBar = false;

  final PreferredSizeWidget? appBar;
  final Widget body;
  final EdgeInsets bodyInsets;

  final bool showBottomNavigationBar;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return NitDeviceFrame(
      body: Scaffold(
        appBar: appBar,
        body: Stack(
          children: [
            // твой контент
            Padding(
              padding: bodyInsets,
              child: SizedBox.expand(
                child: body,
              ),
            ),
            // if (kDebugMode)
            const Positioned(
              right: 4,
              bottom: 4,
              child: Text(
                BuildInfo.version,
                style: TextStyle(fontSize: 8, color: Colors.blueGrey),
              ),
            ),
          ],
        ),
        bottomNavigationBar: showBottomNavigationBar
            ? const NitBottomNavigationBar(
                bottomNavigationBarTheme: BottomNavigationBarThemeData(
                  selectedItemColor: Colors.blue,
                  unselectedItemColor: Colors.lightBlueAccent,
                  showUnselectedLabels: true,
                ),
                menuItems: [
                  NitMenuItem.icon(
                      route: AppNavigationZone.home,
                      displayTitle: 'Домой',
                      iconData: Icons.home),
                  NitMenuItem.icon(
                    route: AppNavigationZone.learning,
                    displayTitle: 'Обучение',
                    iconData: Icons.book,
                  ),
                  NitMenuItem.icon(
                    route: AppNavigationZone.aiAssistant,
                    displayTitle: 'Ассистент',
                    iconData: Icons.person_add_alt_1,
                  ),
                  NitMenuItem.icon(
                    route: AppNavigationZone.profile,
                    displayTitle: 'Профиль',
                    iconData: Icons.settings,
                  ),
                ],
              )
            : null,
      ),
    );
  }
}
