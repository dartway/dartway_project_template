import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nit_router/nit_router.dart';
import 'package:project_name_flutter/app/ai_assistant_page.dart';
import 'package:project_name_flutter/app/home/home_page.dart';
import 'package:project_name_flutter/app/learning_page.dart';
import 'package:project_name_flutter/app/profile/profile_page.dart';
import 'package:project_name_flutter/auth/auth_page.dart';

part 'navigation_zones/app_navigation_zone.dart';
part 'navigation_zones/auth_navigation_zone.dart';

// enum AppNavigationParams<T> with NavigationParamsMixin<T> {
// }

final appRouterProvider = nitRouterStateProvider(
  navigationZones: [
    AuthNavigationZone.values,
    AppNavigationZone.values,
  ],
  redirectsProvider: Provider<RedirectsStateModel>(
    (ref) {
      debugPrint("rebuilding redirects");

      return RedirectsStateModel(
        redirects: Map.fromEntries(
          <NavigationZoneRoute>[
            ...AppNavigationZone.values,
          ].map(
            (e) => MapEntry(
              e,
              AuthNavigationZone.auth,
            ),
          ),
        ),
      );
    },
  ),
);
