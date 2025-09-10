part of 'molecules.dart';

class BottomNavigationItem extends StatelessWidget {
  final String? text;
  final IconData icon;
  const BottomNavigationItem({
    required this.icon,
    this.text,
    super.key,
  });

  @override
  Widget build(BuildContext context) => Column(
        children: <Widget>[
          Icon(icon),
          Spacing.spacingV4,
          Visibility(
            visible: text != null,
            child: BaseText(
              text ?? '',
              style: TypoButton.b3,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      );
}
