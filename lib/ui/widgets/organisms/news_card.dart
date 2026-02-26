part of 'organisms.dart';

class NewsCard extends StatefulWidget {
  const NewsCard({
    required this.title,
    super.key,
    this.summary,
    this.imageUrl,
    this.date,
    this.source,
    this.category,
    this.isFeatured = false,
    this.onTap,
  });

  final String title;
  final String? summary;
  final String? imageUrl;
  final DateTime? date;
  final String? source;
  final String? category;
  final bool isFeatured;
  final VoidCallback? onTap;

  @override
  State<NewsCard> createState() => _NewsCardState();
}

class _NewsCardState extends State<NewsCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          decoration: BoxDecoration(
            color: Theme.of(context).appColors.neutral.subtle,
            borderRadius: BorderRadius.circular(16),
            boxShadow: _isHovered
                ? <BoxShadow>[
                    BoxShadow(
                      color: Theme.of(context).appColors.opacity.base,
                      blurRadius: 16,
                      offset: const Offset(0, 8),
                    ),
                  ]
                : <BoxShadow>[
                    BoxShadow(
                      color: Theme.of(context)
                          .appColors
                          .opacity
                          .base
                          .withValues(alpha: 0.5),
                      blurRadius: 4,
                      offset: const Offset(0, 2),
                    ),
                  ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // Image
              if (widget.imageUrl != null)
                Stack(
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(16),
                      ),
                      child: Image.network(
                        widget.imageUrl!,
                        height: 180,
                        width: double.infinity,
                        fit: BoxFit.cover,
                        errorBuilder: (BuildContext context, Object error,
                                StackTrace? stackTrace) =>
                            Container(
                          height: 180,
                          decoration: BoxDecoration(
                            color: Theme.of(context).appColors.primary.soft,
                            borderRadius: const BorderRadius.vertical(
                              top: Radius.circular(16),
                            ),
                          ),
                          child: Center(
                            child: Icon(
                              Iconsax.image,
                              size: 48,
                              color: Theme.of(context).appColors.primary.strong,
                            ),
                          ),
                        ),
                      ),
                    ),
                    // Category badge
                    if (widget.category != null)
                      Positioned(
                        top: 12,
                        left: 12,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            color: Theme.of(context).appColors.primary.strong,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: BaseText(
                            widget.category!.toUpperCase(),
                            style: TypoSecondary.b4r.copyWith(
                              color: Theme.of(context)
                                  .appColors
                                  .neutralNoChange
                                  .subtle,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              // Content
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    // Date
                    if (widget.date != null)
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: BaseText(
                          _formatDate(widget.date!),
                          style: TypoSecondary.b4r.copyWith(
                            color: Theme.of(context).appColors.text.scale.soft,
                          ),
                        ),
                      ),
                    // Title
                    BaseText(
                      widget.title,
                      style: TypoSubtitles.s2.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    // Summary
                    if (widget.summary != null) ...<Widget>[
                      const SizedBox(height: 8),
                      BaseText(
                        widget.summary!,
                        style: TypoSecondary.b3r.copyWith(
                          color: Theme.of(context).appColors.text.scale.soft,
                        ),
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                    const SizedBox(height: 12),
                    // Footer
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        if (widget.source != null)
                          Row(
                            children: <Widget>[
                              Icon(
                                Iconsax.link,
                                size: 14,
                                color: Theme.of(context)
                                    .appColors
                                    .neutral
                                    .strong,
                              ),
                              const SizedBox(width: 4),
                              BaseText(
                                widget.source!,
                                style: TypoSecondary.b4r.copyWith(
                                  color: Theme.of(context)
                                      .appColors
                                      .text
                                      .scale
                                      .soft,
                                ),
                              ),
                            ],
                          )
                        else
                          const SizedBox.shrink(),
                        Row(
                          children: <Widget>[
                            BaseText(
                              'Leer mas',
                              style: TypoSecondary.b3r.copyWith(
                                color: Theme.of(context)
                                    .appColors
                                    .primary
                                    .strong,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(width: 4),
                            Icon(
                              Iconsax.arrow_right_1,
                              size: 16,
                              color:
                                  Theme.of(context).appColors.primary.strong,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _formatDate(DateTime date) {
    final List<String> months = <String>[
      'Enero',
      'Febrero',
      'Marzo',
      'Abril',
      'Mayo',
      'Junio',
      'Julio',
      'Agosto',
      'Septiembre',
      'Octubre',
      'Noviembre',
      'Diciembre',
    ];
    return '${date.day} de ${months[date.month - 1]}, ${date.year}';
  }
}
