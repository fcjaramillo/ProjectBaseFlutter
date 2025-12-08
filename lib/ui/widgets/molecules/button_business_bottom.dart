part of 'molecules.dart';

class ButtonBusinessBottom extends StatelessWidget {
  final double height;
  final String title;
  final VoidCallback? onPressed;

  const ButtonBusinessBottom({
    required this.height,
    required this.title,
    this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) => SizedBox(
    height: height,
    width: Responsive.of(context).width,
    child: Column(
      children: <Widget>[
        Divider(color: Theme.of(context).colorScheme.surfaceContainerLow),
        Padding(
          padding: BasePadding.paddingH24V16,
          child: BaseBusinessButton(
            text: title,
            isFullWidth: true,
            onPressed: onPressed,
          ),
        ),
      ],
    ),
  );
}
