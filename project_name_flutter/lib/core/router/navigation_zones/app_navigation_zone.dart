part of '../router.dart';

enum AppNavigationZone implements NavigationZoneRoute {
  home(
    SimpleNavigationRouteDescriptor(
      page: HomePage(),
    ),
  ),

  profile(
    SimpleNavigationRouteDescriptor(
      page: ProfilePage(),
    ),
  ),
  ;

  const AppNavigationZone(this.descriptor);

  @override
  final NavigationRouteDescriptor descriptor;

  @override
  String get root => '';
}
