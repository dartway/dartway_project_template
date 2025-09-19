part of '../ui_kit.dart';

/// Кнопка с анти-дребезгом и индикатором загрузки
class _GuardedButton extends StatefulWidget {
  final Widget child;
  final ButtonStyle style;
  final FutureOr<void> Function()? onPressed;
  final bool showProgress;

  const _GuardedButton({
    required this.child,
    required this.style,
    this.onPressed,
    this.showProgress = false,
  });

  @override
  State<_GuardedButton> createState() => _GuardedButtonState();
}

class _GuardedButtonState extends State<_GuardedButton> {
  bool _busy = false;

  Future<void> _handle() async {
    if (_busy || widget.onPressed == null) return;
    setState(() => _busy = true);
    try {
      await widget.onPressed!.call();
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final showSpinner = widget.showProgress && _busy;

    return ElevatedButton(
      style: widget.style,
      onPressed: widget.onPressed != null ? _handle : null,
      child: showSpinner
          ? const SizedBox(
              height: 20,
              width: 20,
              child: CircularProgressIndicator(strokeWidth: 2),
            )
          : widget.child,
    );
  }
}
