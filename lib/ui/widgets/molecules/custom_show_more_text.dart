part of 'molecules.dart';

class CustomShowMoreText extends StatefulWidget {
  const CustomShowMoreText({
    required this.formatDescription,
    required this.description,
    this.maxLines = 5,
    super.key,
  });

  final String Function(String p1)? formatDescription;
  final String description;
  final int maxLines;

  @override
  State<CustomShowMoreText> createState() => _CustomShowMoreTextState();
}

class _CustomShowMoreTextState extends State<CustomShowMoreText> {
  bool isExpanded = false;
  bool isOverflowing = false;
  final GlobalKey _textKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _checkOverflow();
    });
  }

  @override
  void didUpdateWidget(CustomShowMoreText oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.description != widget.description ||
        oldWidget.maxLines != widget.maxLines ||
        oldWidget.formatDescription != widget.formatDescription) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _checkOverflow();
      });
    }
  }

  void _checkOverflow() {
    if (!mounted) {
      return;
    }

    final RenderBox? renderBox =
        _textKey.currentContext?.findRenderObject() as RenderBox?;
    if (renderBox == null) {
      return;
    }

    final String displayText =
        widget.formatDescription?.call(widget.description) ??
        widget.description;

    final TextSpan textSpan = TextSpan(
      text: displayText,
      style: TypoSecondary.b2r,
    );

    final TextPainter textPainter = TextPainter(
      text: textSpan,
      textDirection: TextDirection.ltr,
      maxLines: widget.maxLines,
    );

    textPainter.layout(maxWidth: renderBox.size.width);

    if (mounted) {
      setState(() {
        isOverflowing = textPainter.didExceedMaxLines;
      });
    }
  }

  void _toggleExpanded() {
    setState(() {
      isExpanded = !isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    final int maxLines = widget.maxLines > 0 ? widget.maxLines : 5;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        BaseText(
          key: _textKey,
          widget.formatDescription?.call(widget.description) ??
              widget.description,
          maxLines: isExpanded ? null : maxLines,
          overflow: isExpanded ? TextOverflow.visible : TextOverflow.ellipsis,
          style: TypoSecondary.b2r,
          maxFontSize: TypoSecondary.b2r.fontSize,
          minFontSize: TypoSecondary.b2r.fontSize,
        ),
        if (isOverflowing) ...<Widget>[
          Spacing.spacingV8,
          GestureDetector(
            onTap: _toggleExpanded,
            child: BaseText(
              isExpanded
                  ? L10n.of(context).gShowLess
                  : L10n.of(context).gShowMore,
              style: TypoLink.m.copyWith(decoration: TextDecoration.underline),
            ),
          ),
        ],
      ],
    );
  }
}
