// part of '../ui_kit.dart';

// class AppText extends StatelessWidget {
//   final String data;
//   final AppTextStyle _textStyle;

//   // Common text options
//   final TextAlign? textAlign;
//   final int? maxLines;
//   final TextOverflow? overflow;
//   final bool? softWrap;

//   // Base private constructor — fields are the same for all styles.
//   // Style constructors remain const.
//   const AppText(
//     this.data, {
//     required AppTextStyle textStyleVariant,
//     this.textAlign,
//     this.maxLines,
//     this.overflow,
//     this.softWrap,
//     super.key,
//   }) : _textStyle = textStyleVariant;

//   const AppText.title(
//     String data, {
//     Key? key,
//     TextAlign? textAlign,
//     int? maxLines,
//     TextOverflow? overflow,
//     bool? softWrap,
//     Color? color,
//     TextDecoration? decoration,
//   }) : this(
//           data,
//           key: key,
//           textStyleVariant: AppTextStyle.title,
//           textAlign: textAlign,
//           maxLines: maxLines,
//           overflow: overflow,
//           softWrap: softWrap,
//         );

//   const AppText.body(
//     String data, {
//     Key? key,
//     TextAlign? textAlign,
//     int? maxLines,
//     TextOverflow? overflow,
//     bool? softWrap,
//     Color? color,
//     TextDecoration? decoration,
//   }) : this(
//           data,
//           key: key,
//           textStyleVariant: AppTextStyle.body,
//           textAlign: textAlign,
//           maxLines: maxLines,
//           overflow: overflow,
//           softWrap: softWrap,
//         );

//   const AppText.caption(
//     String data, {
//     Key? key,
//     TextAlign? textAlign,
//     int? maxLines,
//     TextOverflow? overflow,
//     bool? softWrap,
//     Color? color,
//     TextDecoration? decoration,
//   }) : this(
//           data,
//           key: key,
//           textStyleVariant: AppTextStyle.caption,
//           textAlign: textAlign,
//           maxLines: maxLines,
//           overflow: overflow,
//           softWrap: softWrap,
//         );

//   @override
//   Widget build(BuildContext context) {
//     return Text(
//       data,
//       style: _textStyle.resolveStyle(context),
//       textAlign: textAlign,
//       maxLines: maxLines,
//       overflow: overflow,
//       softWrap: softWrap,
//     );
//   }
// }
