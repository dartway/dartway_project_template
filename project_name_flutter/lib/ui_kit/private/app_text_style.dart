part of '../ui_kit.dart';

enum _AppTextStyle {
  title,
  body,
  caption;

  TextStyle _resolve(BuildContext context) {
    final theme = Theme.of(context);
    final tt = theme.textTheme;
    final cs = theme.colorScheme;

    switch (this) {
      case _AppTextStyle.title:
        return (tt.titleLarge ??
                const TextStyle(fontSize: 20, fontWeight: FontWeight.w600))
            .copyWith(color: cs.onSurface);
      case _AppTextStyle.body:
        return (tt.bodyMedium ?? const TextStyle(fontSize: 16))
            .copyWith(color: cs.onSurface);
      case _AppTextStyle.caption:
        return (tt.labelSmall ?? const TextStyle(fontSize: 12))
            .copyWith(color: cs.onSurface.withValues(alpha: 0.7));
    }
  }
}
