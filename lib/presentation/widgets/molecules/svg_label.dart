part of 'molecules.dart';

class SvgLabel extends StatelessWidget {
  const SvgLabel({
    required this.svg,
    required this.text,
    this.height,
    this.flex = 1,
    super.key,
  });

  final String svg;
  final String text;
  final double? height;
  final int flex;
  @override
  Widget build(BuildContext context) => Row(
        children: <Widget>[
          SvgPicture.asset(
            svg,
            width: Layout.spaceML,
            height: height ?? Layout.spaceML,
            colorFilter: ColorFilter.mode(
              Theme.of(context).colorScheme.surfaceContainerHigh,
              BlendMode.srcIn,
            ),
          ),
          Spacing.spacingH8,
          Expanded(
            flex: flex,
            child: BaseText.soft(
              text,
              style: TypoBody.b2r,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      );
}
