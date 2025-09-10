part of 'molecules.dart';

class DecisionButton extends StatelessWidget {
  final String primaryText;
  final String secondaryText;
  final VoidCallback? primaryOnPressed;
  final VoidCallback? secondaryOnPressed;
  final bool isVertical;
  final bool isColorReversed;
  final bool collapsed;
  final bool? businessButtonColor;

  const DecisionButton({
    required this.primaryText,
    required this.secondaryText,
    this.primaryOnPressed,
    this.secondaryOnPressed,
    this.isColorReversed = false,
    this.collapsed = false,
    this.businessButtonColor,
    super.key,
  }) : isVertical = false;

  const DecisionButton.vertical({
    required this.primaryText,
    required this.secondaryText,
    required this.primaryOnPressed,
    required this.secondaryOnPressed,
    this.collapsed = false,
    this.businessButtonColor,
    super.key,
  })  : isVertical = true,
        isColorReversed = false;

  @override
  Widget build(BuildContext context) => Visibility(
        visible: !isVertical,
        replacement: Column(
          children: <Widget>[
            businessButtonColor != null
                ? BaseTertiaryButton(
                    text: primaryText,
                    onPressed: primaryOnPressed,
                    isCollapsed: collapsed,
                  )
                : BasePrimaryButton.typoButton(
                    text: primaryText,
                    onPressed: primaryOnPressed,
                    isCollapsed: collapsed,
                  ),
            Spacing.spacingV24,
            BaseSecondaryButton.typoButton(
              text: secondaryText,
              onPressed: secondaryOnPressed,
              isCollapsed: collapsed,
            ),
          ],
        ),
        child: Visibility(
          visible: isColorReversed,
          replacement: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: businessButtonColor != null
                    ? BaseTertiaryButton(
                        text: primaryText,
                        onPressed: primaryOnPressed,
                        isCollapsed: collapsed,
                      )
                    : BasePrimaryButton.typoButton(
                        text: primaryText,
                        onPressed: primaryOnPressed,
                        isCollapsed: collapsed,
                      ),
              ),
              Spacing.spacingH24,
              Expanded(
                child: BaseSecondaryButton.typoButton(
                  text: secondaryText,
                  onPressed: secondaryOnPressed,
                  isCollapsed: collapsed,
                ),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: BaseSecondaryButton.typoButton(
                  text: primaryText,
                  onPressed: primaryOnPressed,
                  isCollapsed: collapsed,
                ),
              ),
              Spacing.spacingH24,
              Expanded(
                child: businessButtonColor != null
                    ? BaseTertiaryButton(
                        text: secondaryText,
                        onPressed: primaryOnPressed,
                        isCollapsed: collapsed,
                      )
                    : BasePrimaryButton.typoButton(
                        text: secondaryText,
                        onPressed: secondaryOnPressed,
                        isCollapsed: collapsed,
                      ),
              ),
            ],
          ),
        ),
      );
}
