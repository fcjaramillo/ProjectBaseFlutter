part of 'templates.dart';

class SuccessAction extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final String buttonText;
  final VoidCallback onTap;
  final List<Widget> aditionals;

  SuccessAction({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.buttonText,
    required this.onTap,
    List<Widget>? aditionals,
    super.key,
  }) : aditionals = aditionals ?? <Widget>[];

  @override
  Widget build(BuildContext context) => Scaffold(
    body: Padding(
      padding: const EdgeInsets.only(
        top: Layout.spaceXXXL,
        left: Layout.spaceL,
        right: Layout.spaceL,
      ),
      child: MessageAction.aditional(
        icon: icon,
        title: title,
        subtitle: subtitle,
        aditionals: aditionals,
      ),
    ),
    bottomNavigationBar: Padding(
      padding: const EdgeInsets.only(
        bottom: Layout.spaceXL,
        left: Layout.spaceL,
        right: Layout.spaceL,
      ),
      child: BaseFilledButton(text: buttonText, onPressed: onTap),
    ),
  );
}
