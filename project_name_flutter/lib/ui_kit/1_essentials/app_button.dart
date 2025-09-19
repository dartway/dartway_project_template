part of '../ui_kit.dart';

class AppButton extends StatelessWidget {
  final String label;
  final _AppButtonStyle _variant;
  final DwCallback<dynamic>? dwCallback;
  final Widget? leading;
  final Widget? trailing;
  final bool showProgress;
  final double? width;
  final double? height;
  final bool unfocusOnTap;
  final bool requireValidation;

  const AppButton.primary(
    this.label, {
    required this.dwCallback,
    super.key,
    this.leading,
    this.trailing,
    this.showProgress = true,
    this.width,
    this.height,
    this.unfocusOnTap = true,
    this.requireValidation = false,
  }) : _variant = _AppButtonStyle.primary;

  const AppButton.secondary(
    this.label, {
    required this.dwCallback,
    super.key,
    this.leading,
    this.trailing,
    this.showProgress = false,
    this.width,
    this.height,
    this.unfocusOnTap = true,
    this.requireValidation = false,
  }) : _variant = _AppButtonStyle.secondary;

  const AppButton.text(
    this.label, {
    required this.dwCallback,
    super.key,
    this.leading,
    this.trailing,
    this.showProgress = false,
    this.width,
    this.height,
    this.unfocusOnTap = true,
    this.requireValidation = false,
  }) : _variant = _AppButtonStyle.text;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: _GuardedButton(
        style: _variant.styleOf(context),
        onPressed: dwCallback == null
            ? null
            : () {
                if (unfocusOnTap) {
                  FocusScope.of(context).unfocus();
                }

                if (!requireValidation ||
                    (Form.maybeOf(context)?.validate() ?? false)) {
                  dwCallback!.call(context);
                }
              },
        showProgress: showProgress,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (leading != null) ...[leading!, const SizedBox(width: 8)],
            Text(label),
            if (trailing != null) ...[const SizedBox(width: 8), trailing!],
          ],
        ),
      ),
    );
  }
}
