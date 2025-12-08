part of 'atoms.dart';

class PageButton extends StatelessWidget {
  final String pageNumber;
  final bool isCurrent;
  final VoidCallback onTap;

  const PageButton({
    required this.pageNumber,
    required this.isCurrent,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) => Padding(
    padding: BasePadding.paddingH4,
    child: SizedBox(
      width: Layout.spaceXL,
      height: Layout.spaceXL,
      child: isCurrent
          ? BaseFilledButton(
              text: pageNumber,
              isCollapsed: true,
              onPressed: onTap,
              buttonTextPadding: EdgeInsets.zero,
            )
          : BaseOutlinedButton(
              text: pageNumber,
              isCollapsed: true,
              buttonTextPadding: EdgeInsets.zero,
              onPressed: onTap,
            ),
    ),
  );
}
