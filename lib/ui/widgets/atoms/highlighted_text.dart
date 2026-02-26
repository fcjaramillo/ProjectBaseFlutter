part of 'atoms.dart';

class HighlightedText extends StatelessWidget {
  final String text;
  final String highlight;
  final TextStyle? style;
  final TextStyle? highlightStyle;
  final TextAlign textAlign;
  final double? minFontSize;
  final int? maxLines;
  final TextOverflow? overflow;

  const HighlightedText({
    required this.text,
    required this.highlight,
    this.style,
    this.highlightStyle,
    this.textAlign = TextAlign.start,
    this.minFontSize,
    this.maxLines,
    this.overflow,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final TextStyle defaultStyle =
        style?.copyWith(
          color: Theme.of(context).colorScheme.onSurface,
          fontSize: minFontSize,
        ) ??
        TypoPrimary.h3.copyWith(
          color: Theme.of(context).colorScheme.onSurface,
          fontSize: minFontSize,
        );
    final TextStyle highlightTextStyle =
        highlightStyle ??
        defaultStyle.copyWith(
          color: Theme.of(context).colorScheme.primary,
          fontSize: minFontSize,
        );

    final List<String> parts = text.split(highlight);

    if (parts.length == 1) {
      return Text(text, style: defaultStyle, textAlign: textAlign);
    }

    return RichText(
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow ?? TextOverflow.clip,
      text: TextSpan(
        style: defaultStyle,
        children: <InlineSpan>[
          TextSpan(text: parts.first, style: defaultStyle),
          TextSpan(text: highlight, style: highlightTextStyle),
          TextSpan(
            text: parts.length > 1 ? parts.last : kEmptyString,
            style: defaultStyle,
          ),
        ],
      ),
    );
  }
}
