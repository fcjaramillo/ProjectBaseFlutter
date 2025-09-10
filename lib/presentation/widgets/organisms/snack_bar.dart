part of 'organisms.dart';

class SnackBarBody extends StatelessWidget {
  final String message;
  final IconData icon;
  final Color iconColor;
  final String? image;
  final bool? showButton;

  const SnackBarBody({
    required this.message,
    required this.icon,
    required this.iconColor,
    this.image,
    this.showButton = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) => Row(
        children: <Widget>[
          image == null || image != ''
              ? Icon(
                  icon,
                  color: iconColor,
                  size: Layout.spaceL,
                )
              : BaseImage(
                  url: image!,
                  height: 34.8,
                  width: 32.41,
                  fit: BoxFit.fitHeight,
                  radius: 5,
                ),
          Spacing.spacingH24,
          Expanded(
            child: BaseText.noChangeStrong(
              message,
              overflow: TextOverflow.visible,
              maxLines: 4,
              style: TypoButton.b2,
            ),
          ),
        ],
      );
}
