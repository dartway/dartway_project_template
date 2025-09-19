part of '../ui_kit.dart';

class AppText extends StatelessWidget {
  final String data;
  final _AppTextStyle _textStyle;

  // Общие опции текста
  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? overflow;
  final bool? softWrap;

  // Базовый приватный конструктор — поля одинаковы у всех стилей.
  // Конструкторы-стили остаются const.
  const AppText._(
    this.data, {
    required _AppTextStyle textStyleVariant,
    this.textAlign,
    this.maxLines,
    this.overflow,
    this.softWrap,
    super.key,
  }) : _textStyle = textStyleVariant;

  const AppText.title(
    String data, {
    Key? key,
    TextAlign? textAlign,
    int? maxLines,
    TextOverflow? overflow,
    bool? softWrap,
    Color? color,
    TextDecoration? decoration,
  }) : this._(
          data,
          key: key,
          textStyleVariant: _AppTextStyle.title,
          textAlign: textAlign,
          maxLines: maxLines,
          overflow: overflow,
          softWrap: softWrap,
        );

  const AppText.body(
    String data, {
    Key? key,
    TextAlign? textAlign,
    int? maxLines,
    TextOverflow? overflow,
    bool? softWrap,
    Color? color,
    TextDecoration? decoration,
  }) : this._(
          data,
          key: key,
          textStyleVariant: _AppTextStyle.body,
          textAlign: textAlign,
          maxLines: maxLines,
          overflow: overflow,
          softWrap: softWrap,
        );

  const AppText.caption(
    String data, {
    Key? key,
    TextAlign? textAlign,
    int? maxLines,
    TextOverflow? overflow,
    bool? softWrap,
    Color? color,
    TextDecoration? decoration,
  }) : this._(
          data,
          key: key,
          textStyleVariant: _AppTextStyle.caption,
          textAlign: textAlign,
          maxLines: maxLines,
          overflow: overflow,
          softWrap: softWrap,
        );

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: _textStyle._resolve(context),
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
      softWrap: softWrap,
    );
  }
}
