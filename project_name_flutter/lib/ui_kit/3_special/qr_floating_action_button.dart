part of '../ui_kit.dart';

class AiFloatingActionButton extends StatelessWidget {
  const AiFloatingActionButton({
    super.key,
    required this.label,
    required this.onPressed,
  });

  final String label;
  final DwCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onPressed.call(context),
      child: Container(
        padding: const EdgeInsets.all(2),
        width: 64,
        height: 64,
        decoration: BoxDecoration(
          color: context.colorScheme.primary,
          shape: BoxShape.circle,
        ),
        child: AppText.title(
          label,
          color: context.colorScheme.primary,
        ),
      ),
    );
  }
}
