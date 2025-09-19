part of '../ui_kit.dart';

enum _AppButtonStyle {
  primary,
  secondary,
  text;

  ButtonStyle styleOf(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    switch (this) {
      case _AppButtonStyle.primary:
        return ElevatedButton.styleFrom(
          backgroundColor: cs.primary,
          foregroundColor: cs.onPrimary,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        );
      case _AppButtonStyle.secondary:
        return OutlinedButton.styleFrom(
          foregroundColor: cs.primary,
          side: BorderSide(color: cs.primary),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        );
      case _AppButtonStyle.text:
        return TextButton.styleFrom(
          foregroundColor: cs.primary,
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        );
    }
  }
}
