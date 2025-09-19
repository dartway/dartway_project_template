part of '../ui_kit.dart';

extension NitBuildContextExtension on BuildContext {
  ThemeData get theme => Theme.of(this);

  TextTheme get textTheme => Theme.of(this).textTheme;

  ColorScheme get colorScheme => Theme.of(this).colorScheme;

  popOnTrue(bool value) => mounted && value ? pop() : {};
  popIfNotNull(dynamic value) => mounted && value != null ? pop() : {};

  // mountedAction(BuildContext context, ())
  mountedPushNamed(String name) => mounted ? pushNamed(name) : {};
  mountedGoNamed(String name) => mounted ? goNamed(name) : {};

  static final maxMobileScreenWidth =
      (defaultTargetPlatform == TargetPlatform.android ||
              defaultTargetPlatform == TargetPlatform.iOS)
          ? AdaptiveWindowType.medium.widthRangeValues.end
          : AdaptiveWindowType.small.widthRangeValues.end;

  bool get isMobile => MediaQuery.sizeOf(this).width <= maxMobileScreenWidth;

  // Future<T?> showBottomSheetOrDialog<T>(
  //   Widget child,
  // ) =>
  //     isMobile ? showForceBottomSheetDialog(child) : showForceDialog(child);
}
