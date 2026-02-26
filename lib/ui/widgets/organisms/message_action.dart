part of 'organisms.dart';

class MessageAction extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final List<Widget> aditional;

  MessageAction({
    required this.icon,
    required this.title,
    required this.subtitle,
    super.key,
  }) : aditional = <Widget>[];

  MessageAction.aditional({
    required this.icon,
    required this.title,
    required this.subtitle,
    List<Widget>? aditionals,
    super.key,
  }) : aditional = aditionals ?? <Widget>[];

  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Icon(icon, size: 56),
      Spacing.spacingV24,
      BaseText(title, style: TypoSubtitles.s2),
      Spacing.spacingV12,
      BaseText.soft(subtitle, style: TypoSecondary.b2r),
      ...aditional,
    ],
  );
}
