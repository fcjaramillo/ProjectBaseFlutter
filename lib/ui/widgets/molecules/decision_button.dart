part of 'molecules.dart';

class DecisionButton extends StatelessWidget {
  final String primaryText;
  final String secondaryText;
  final VoidCallback? primaryOnPressed;
  final VoidCallback? secondaryOnPressed;
  final bool isVertical;
  final bool isColorReversed;
  final bool collapsed;
  final bool fullWidth;
  final bool? useBusinessButton;
  final Widget? spacing;

  const DecisionButton({
    required this.primaryText,
    required this.secondaryText,
    this.primaryOnPressed,
    this.secondaryOnPressed,
    this.isColorReversed = false,
    this.collapsed = false,
    this.fullWidth = true,
    this.useBusinessButton,
    this.isVertical = false,
    this.spacing,
    super.key,
  });

  const DecisionButton.vertical({
    required this.primaryText,
    required this.secondaryText,
    required this.primaryOnPressed,
    required this.secondaryOnPressed,
    this.collapsed = false,
    this.fullWidth = true,
    this.useBusinessButton,
    this.spacing,
    super.key,
  }) : isVertical = true,
       isColorReversed = false;

  @override
  Widget build(BuildContext context) {
    if (isVertical) {
      return _buildVerticalLayout();
    }
    return _buildHorizontalLayout();
  }

  Widget _buildVerticalLayout() => Column(
    mainAxisSize: MainAxisSize.min,
    children: <Widget>[
      _buildPrimaryButton(),
      spacing ?? Spacing.spacingV24,
      _buildSecondaryButton(),
    ],
  );

  Widget _buildHorizontalLayout() => Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      Expanded(child: _buildPrimaryButton()),
      spacing ?? Spacing.spacingH24,
      Expanded(child: _buildSecondaryButton()),
    ],
  );

  Widget _buildPrimaryButton() {
    if (isColorReversed) {
      return BaseOutlinedButton.typoButton(
        text: primaryText,
        onPressed: primaryOnPressed,
        isCollapsed: collapsed,
        isFullWidth: fullWidth,
      );
    }

    if (useBusinessButton != null) {
      return BaseBusinessButton(
        text: primaryText,
        onPressed: primaryOnPressed,
        isCollapsed: collapsed,
        isFullWidth: fullWidth,
      );
    }
    return BaseFilledButton.typoButton(
      text: primaryText,
      onPressed: primaryOnPressed,
      isCollapsed: collapsed,
      isFullWidth: fullWidth,
    );
  }

  Widget _buildSecondaryButton() {
    if (isColorReversed) {
      if (useBusinessButton != null) {
        return BaseBusinessButton(
          text: secondaryText,
          onPressed: secondaryOnPressed,
          isCollapsed: collapsed,
          isFullWidth: fullWidth,
        );
      }
      return BaseFilledButton.typoButton(
        text: secondaryText,
        onPressed: secondaryOnPressed,
        isCollapsed: collapsed,
        isFullWidth: fullWidth,
      );
    }

    return BaseOutlinedButton.typoButton(
      text: secondaryText,
      onPressed: secondaryOnPressed,
      isCollapsed: collapsed,
      isFullWidth: fullWidth,
    );
  }
}
