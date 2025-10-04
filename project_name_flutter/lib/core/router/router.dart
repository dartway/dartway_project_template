import 'package:dartway_core_serverpod_flutter/dartway_core_serverpod_flutter.dart';
import 'package:dartway_router/dartway_router.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:project_name_flutter/app/home/home_page/home_page.dart';
import 'package:project_name_flutter/app/profile/profile_page/profile_page.dart';
import 'package:project_name_flutter/auth/auth_page.dart';

part 'navigation_zones/app_navigation_zone.dart';
part 'navigation_zones/auth_navigation_zone.dart';

enum AppNavigationParams<T> with NavigationParamsMixin<T> {
  userId<int>(),
  postId<int>(),
  chatId<int>(),
}

final appRouterProvider = dwRouterStateProvider(
  DwRouter.config().addNavigationZones([
    AuthNavigationZone.values,
    AppNavigationZone.values,
  ]).setRedirectsProvider(
    Provider<RedirectsStateModel>(
      (ref) {
        debugPrint("rebuilding redirects");

        if (ref.signedIn) {
          return RedirectsStateModel(
            redirects: Map.fromEntries(
              <NavigationZoneRoute>[
                ...AuthNavigationZone.values,
              ].map(
                (e) => MapEntry(
                  e,
                  AppNavigationZone.home,
                ),
              ),
            ),
          );
        } else {
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
        }
      },
    ),
  ),
);
