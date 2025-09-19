part of '../ui_kit.dart';

class MultiLinkTextPart {
  MultiLinkTextPart(
    this.text,
    this.linkText,
    this.onLinkTap,
  );

  final String? text;
  final String? linkText;
  final DwCallback? onLinkTap;
}

class MultiLinkText extends StatefulWidget {
  MultiLinkText.single({
    super.key,
    String? text,
    String? linkText,
    DwCallback? onLinkTap,
    this.textAlign,
  }) : parts = [MultiLinkTextPart(text, linkText, onLinkTap)];

  const MultiLinkText.multi({
    super.key,
    required this.parts,
    this.textAlign,
  });

  final TextAlign? textAlign;

  final List<MultiLinkTextPart> parts;

  @override
  State<MultiLinkText> createState() => _MultiLinkTextState();
}

class _MultiLinkTextState extends State<MultiLinkText> {
  List<TapGestureRecognizer?>? _recognizers;

  // @override
  // void initState() {
  //   super.initState();

  //   for (var e in widget.parts) {
  //     final t = e.linkText != null && e.onLinkTap != null
  //         ? TapGestureRecognizer()
  //         : null;
  //     if (t != null) {
  //       t.onTap = () => e.onLinkTap!.call(context);
  //     }

  //     _recognizers.add(t);
  //   }
  // }

  @override
  void dispose() {
    _recognizers?.forEach((r) => r?.dispose());

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _recognizers = widget.parts.map((e) {
      if (e.linkText != null && e.onLinkTap != null) {
        final recognizer = TapGestureRecognizer()
          ..onTap = () => e.onLinkTap!.call(context);
        return recognizer;
      }
      return null;
    }).toList();

    return RichText(
      textAlign: widget.textAlign ?? TextAlign.center,
      text: TextSpan(
        style: _AppTextStyle.body._resolve(context),
        children: [
          ...widget.parts
              .mapIndexed(
                (i, e) => <InlineSpan>[
                  if (i != 0) const TextSpan(text: ' '),
                  if (e.text != null) TextSpan(text: '${e.text}'),
                  if (e.text != null && e.linkText != null)
                    const TextSpan(text: ' '),
                  if (e.linkText != null)
                    TextSpan(
                      text: e.linkText,
                      style: _AppTextStyle.body._resolve(context).copyWith(
                            color: context.colorScheme.secondary,
                          ),
                      recognizer: _recognizers![i],
                    ),
                ],
              )
              .expand((sublist) => sublist)
        ],
      ),
    );
  }
}
