part of '../router.dart';

enum AppNavigationZone implements NavigationZoneRoute {
  home(
    SimpleNavigationRouteDescriptor(
      page: HomePage(),
    ),
  ),
  learning(
    SimpleNavigationRouteDescriptor(
      page: LearningPage(),
    ),
  ),
  aiAssistant(
    SimpleNavigationRouteDescriptor(
      page: AiAssistantPage(),
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
