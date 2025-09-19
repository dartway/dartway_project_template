part of '../ui_kit.dart';

class AppCheckbox extends StatelessWidget {
  const AppCheckbox({
    super.key,
    required this.valueNotifier,
    this.checkboxSize = 24,
    this.iconSize = 16,
    this.enabled = true,
  });

  final ValueNotifier<bool> valueNotifier;
  final double checkboxSize;
  final double? iconSize;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: valueNotifier,
      builder: (context, isChecked, child) => Checkbox(
        value: isChecked,
        onChanged: (value) => valueNotifier.value = value!,
      ),
    );

    //    InkWell(
    //     borderRadius: BorderRadius.circular(
    //       checkboxSize,
    //     ),
    //     onTap: enabled
    //         ? () {
    //             valueNotifier.value = !isChecked;
    //           }
    //         : null,
    //     child: SizedBox.square(
    //       dimension: checkboxSize,
    //       child: DecoratedBox(
    //         decoration: BoxDecoration(
    //           shape: BoxShape.circle,
    //           border: Border.all(
    //             color: isChecked
    //                 ? (enabled
    //                     ? context.colorScheme.primary
    //                     : Colors.transparent)
    //                 : context.colorScheme.outlineVariant,
    //             width: 1.5,
    //           ),
    //           color: isChecked
    //               ? (enabled
    //                   ? context.colorScheme.primary
    //                   : context.colorScheme.primary.withAlpha(100))
    //               : Colors.transparent,
    //         ),
    //         child: Padding(
    //           padding: const EdgeInsets.all(4),
    //           child:
    //               isChecked ? const Icon(Icons.check) : const SizedBox.shrink(),
    //         ),
    //       ),
    //     ),
    //   ),
    // );
  }
}

//     this.scale = 1.4,
//     this.onChanged,
//     this.selectedBorderColor,
//     this.selectedCheckColor,
//     this.selectedFillColor,
//   });

//   final double scale;
//   final bool? value;
//   final Color? selectedFillColor;
//   final Color? selectedBorderColor;
//   final Color? selectedCheckColor;
//   final void Function(bool? value)? onChanged;

//   @override
//   State<AppCheckbox> createState() => _AppCheckboxState();
// }

// class _AppCheckboxState extends State<AppCheckbox> {
//   @override
//   Widget build(BuildContext context) {
//     final colorScheme = context.colorScheme;

//     return Transform.scale(
//       scale: widget.scale,
//       child: Checkbox(
//         shape: const CircleBorder(),
//         splashRadius: 15,
//         fillColor: WidgetStateColor.resolveWith(
//           (states) {
//             if (states.contains(WidgetState.selected) && states.contains(WidgetState.disabled)) {
//               return (widget.selectedFillColor ?? colorScheme.primary).withAlpha(100);
//             }

//             if (states.contains(WidgetState.selected)) {
//               return widget.selectedFillColor ?? colorScheme.primary;
//             }
//             return colorScheme.onPrimary;
//           },
//         ),
//         side: WidgetStateBorderSide.resolveWith((states) {
//           if (states.contains(WidgetState.selected) && states.contains(WidgetState.disabled)) {
//             return const BorderSide(
//               color: Colors.transparent,
//               width: 1.1,
//             );
//           }

//           if (states.contains(WidgetState.selected)) {
//             return BorderSide(
//               color: widget.selectedBorderColor ?? colorScheme.primary,
//               width: 1.1,
//             );
//           }
//           return BorderSide(
//             color: colorScheme.outlineVariant,
//             width: 1.1,
//           );
//         }),
//         checkColor: widget.selectedCheckColor ?? colorScheme.onPrimary,
//         visualDensity: const VisualDensity(
//           horizontal: -4,
//           vertical: -4,
//         ),
//         value: widget.value ?? false,
//         onChanged: widget.onChanged,
//       ),
//     );
//   }
// }
