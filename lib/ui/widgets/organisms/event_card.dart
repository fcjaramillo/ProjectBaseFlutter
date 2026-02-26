part of 'organisms.dart';

class EventCard extends StatefulWidget {
  const EventCard({
    required this.title,
    required this.date,
    super.key,
    this.time,
    this.location,
    this.imageUrl,
    this.isFeatured = false,
    this.onTap,
  });

  final String title;
  final DateTime date;
  final String? time;
  final String? location;
  final String? imageUrl;
  final bool isFeatured;
  final VoidCallback? onTap;

  @override
  State<EventCard> createState() => _EventCardState();
}

class _EventCardState extends State<EventCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final bool isPast = widget.date.isBefore(DateTime.now());
    final bool isToday = _isToday(widget.date);

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
            border: widget.isFeatured
                ? Border.all(
                    color: Theme.of(context).appColors.primary.strong,
                    width: 2,
                  )
                : null,
            boxShadow: _isHovered
                ? <BoxShadow>[
                    BoxShadow(
                      color: Theme.of(context).appColors.opacity.base,
                      blurRadius: 16,
                      offset: const Offset(0, 8),
                    ),
                  ]
                : null,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // Image or Date header
              if (widget.imageUrl != null)
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(16),
                  ),
                  child: Image.network(
                    widget.imageUrl!,
                    height: 150,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    errorBuilder: (BuildContext context, Object error,
                            StackTrace? stackTrace) =>
                        _buildDateHeader(context, isToday, isPast),
                  ),
                )
              else
                _buildDateHeader(context, isToday, isPast),
              // Content
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    // Title
                    BaseText(
                      widget.title,
                      style: TypoSubtitles.s2.copyWith(
                        fontWeight: FontWeight.bold,
                        color: isPast
                            ? Theme.of(context).appColors.text.scale.soft
                            : null,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 12),
                    // Date and time
                    Row(
                      children: <Widget>[
                        Icon(
                          Iconsax.calendar,
                          size: 16,
                          color: Theme.of(context).appColors.primary.strong,
                        ),
                        const SizedBox(width: 8),
                        BaseText(
                          _formatDate(widget.date),
                          style: TypoSecondary.b3r.copyWith(
                            color: isPast
                                ? Theme.of(context).appColors.text.scale.soft
                                : Theme.of(context).appColors.primary.strong,
                            fontWeight:
                                isToday ? FontWeight.bold : FontWeight.normal,
                          ),
                        ),
                        if (widget.time != null) ...<Widget>[
                          const SizedBox(width: 16),
                          Icon(
                            Iconsax.clock,
                            size: 16,
                            color: Theme.of(context).appColors.neutral.strong,
                          ),
                          const SizedBox(width: 8),
                          BaseText(
                            widget.time!,
                            style: TypoSecondary.b3r,
                          ),
                        ],
                      ],
                    ),
                    if (widget.location != null) ...<Widget>[
                      const SizedBox(height: 8),
                      Row(
                        children: <Widget>[
                          Icon(
                            Iconsax.location,
                            size: 16,
                            color: Theme.of(context).appColors.neutral.strong,
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: BaseText(
                              widget.location!,
                              style: TypoSecondary.b3r,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ],
                    // Status badge
                    if (isToday || isPast) ...<Widget>[
                      const SizedBox(height: 12),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: isToday
                              ? Theme.of(context).appColors.success.strong
                              : Theme.of(context).appColors.neutral.soft,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: BaseText(
                          isToday ? 'HOY' : 'FINALIZADO',
                          style: TypoSecondary.b4r.copyWith(
                            color: isToday
                                ? Theme.of(context)
                                    .appColors
                                    .neutralNoChange
                                    .subtle
                                : Theme.of(context).appColors.text.scale.soft,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDateHeader(BuildContext context, bool isToday, bool isPast) {
    return Container(
      height: 80,
      decoration: BoxDecoration(
        color: isToday
            ? Theme.of(context).appColors.primary.strong
            : isPast
                ? Theme.of(context).appColors.neutral.soft
                : Theme.of(context).appColors.primary.soft,
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(16),
        ),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            BaseText(
              widget.date.day.toString(),
              style: TypoPrimary.h3.copyWith(
                fontWeight: FontWeight.bold,
                color: isToday
                    ? Theme.of(context).appColors.neutralNoChange.subtle
                    : isPast
                        ? Theme.of(context).appColors.text.scale.soft
                        : Theme.of(context).appColors.primary.strong,
              ),
            ),
            BaseText(
              _getMonthName(widget.date.month).toUpperCase(),
              style: TypoSecondary.b3r.copyWith(
                color: isToday
                    ? Theme.of(context).appColors.neutralNoChange.subtle
                    : isPast
                        ? Theme.of(context).appColors.text.scale.soft
                        : Theme.of(context).appColors.primary.strong,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  bool _isToday(DateTime date) {
    final DateTime now = DateTime.now();
    return date.year == now.year &&
        date.month == now.month &&
        date.day == now.day;
  }

  String _formatDate(DateTime date) {
    final List<String> days = <String>[
      'Lun',
      'Mar',
      'Mie',
      'Jue',
      'Vie',
      'Sab',
      'Dom',
    ];
    return '${days[date.weekday - 1]}, ${date.day} ${_getMonthName(date.month)}';
  }

  String _getMonthName(int month) {
    final List<String> months = <String>[
      'Ene',
      'Feb',
      'Mar',
      'Abr',
      'May',
      'Jun',
      'Jul',
      'Ago',
      'Sep',
      'Oct',
      'Nov',
      'Dic',
    ];
    return months[month - 1];
  }
}
