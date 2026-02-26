part of 'organisms.dart';

class StrategicAxisCard extends StatefulWidget {
  const StrategicAxisCard({
    required this.title,
    required this.description,
    super.key,
    this.icon,
    this.color,
    this.onTap,
  });

  final String title;
  final String description;
  final IconData? icon;
  final Color? color;
  final VoidCallback? onTap;

  @override
  State<StrategicAxisCard> createState() => _StrategicAxisCardState();
}

class _StrategicAxisCardState extends State<StrategicAxisCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final Color cardColor =
        widget.color ?? Theme.of(context).appColors.primary.strong;

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: _isHovered
                ? cardColor.withValues(alpha: 0.1)
                : Theme.of(context).appColors.neutral.subtle,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: _isHovered
                  ? cardColor
                  : Theme.of(context).appColors.neutral.soft,
              width: _isHovered ? 2 : 1,
            ),
            boxShadow: _isHovered
                ? <BoxShadow>[
                    BoxShadow(
                      color: cardColor.withValues(alpha: 0.2),
                      blurRadius: 16,
                      offset: const Offset(0, 8),
                    ),
                  ]
                : null,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // Icon
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: cardColor.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  widget.icon ?? Iconsax.star,
                  color: cardColor,
                  size: 28,
                ),
              ),
              const SizedBox(height: 16),
              // Title
              BaseText(
                widget.title,
                style: TypoSubtitles.s1.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              // Description
              BaseText(
                widget.description,
                style: TypoSecondary.b3r.copyWith(
                  color: Theme.of(context).appColors.text.scale.soft,
                ),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 16),
              // Arrow indicator
              if (widget.onTap != null)
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Icon(
                      Iconsax.arrow_right_1,
                      color: _isHovered
                          ? cardColor
                          : Theme.of(context).appColors.neutral.strong,
                      size: 20,
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
