part of 'organisms.dart';

class TestimonialCard extends StatelessWidget {
  const TestimonialCard({
    required this.name,
    required this.quote,
    super.key,
    this.title,
    this.imageUrl,
    this.organization,
  });

  final String name;
  final String quote;
  final String? title;
  final String? imageUrl;
  final String? organization;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Theme.of(context).appColors.neutral.subtle,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Theme.of(context).appColors.neutral.soft,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // Quote icon
          Icon(
            Iconsax.quote_up,
            size: 32,
            color: Theme.of(context).appColors.primary.soft,
          ),
          const SizedBox(height: 16),
          // Quote text
          BaseText(
            '"$quote"',
            style: TypoSecondary.b2r.copyWith(
              fontStyle: FontStyle.italic,
              height: 1.6,
            ),
          ),
          const SizedBox(height: 24),
          // Author info
          Row(
            children: <Widget>[
              // Avatar
              if (imageUrl != null)
                ClipRRect(
                  borderRadius: BorderRadius.circular(25),
                  child: Image.network(
                    imageUrl!,
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                    errorBuilder: (BuildContext context, Object error,
                            StackTrace? stackTrace) =>
                        _buildDefaultAvatar(context),
                  ),
                )
              else
                _buildDefaultAvatar(context),
              const SizedBox(width: 12),
              // Name and title
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    BaseText(
                      name,
                      style: TypoSubtitles.s2.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    if (title != null || organization != null)
                      BaseText(
                        <String>[
                          if (title != null) title!,
                          if (organization != null) organization!,
                        ].join(' - '),
                        style: TypoSecondary.b3r.copyWith(
                          color: Theme.of(context).appColors.text.scale.soft,
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDefaultAvatar(BuildContext context) {
    final String initials = name
        .split(' ')
        .take(2)
        .map((String s) => s.isNotEmpty ? s[0].toUpperCase() : '')
        .join();

    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        color: Theme.of(context).appColors.primary.soft,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Center(
        child: BaseText(
          initials,
          style: TypoSubtitles.s2.copyWith(
            fontWeight: FontWeight.bold,
            color: Theme.of(context).appColors.primary.strong,
          ),
        ),
      ),
    );
  }
}
