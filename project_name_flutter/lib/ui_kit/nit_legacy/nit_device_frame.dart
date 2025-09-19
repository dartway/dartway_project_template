part of '../ui_kit.dart';

class NitDeviceFrame extends StatelessWidget {
  const NitDeviceFrame({
    super.key,
    required this.body,
    this.customWrapCondition,
    this.leftSidePanel = const SizedBox.shrink(),
    this.leftSidePanelFlex = 1,
    this.rightSidePanel = const SizedBox.shrink(),
    this.rightSidePanelFlex = 1,
  });

  final Widget body;
  final bool Function(BuildContext context)? customWrapCondition;
  final Widget leftSidePanel;
  final int leftSidePanelFlex;
  final Widget rightSidePanel;
  final int rightSidePanelFlex;

  @override
  Widget build(BuildContext context) {
    return ConditionalParentWidget(
      condition: customWrapCondition != null
          ? customWrapCondition!(context)
          : !context.isMobile,
      parentBuilder: (child) => Scaffold(
        body: Row(
          children: [
            Expanded(
              flex: leftSidePanelFlex,
              child: leftSidePanel,
            ),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: DeviceFrame(
                device: Devices.ios.iPhone13ProMax,
                isFrameVisible: true,
                orientation: Orientation.portrait,
                screen: SafeArea(
                  child: child,
                ),
              ),
            ),
            Expanded(
              flex: rightSidePanelFlex,
              child: rightSidePanel,
            ),
          ],
        ),
      ),
      child: body,
    );
  }
}
