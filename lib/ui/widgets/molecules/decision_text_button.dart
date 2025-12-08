part of 'molecules.dart';

class DecisionTextButton extends StatelessWidget {
  final VoidCallback onTapText;
  final String textOne;
  final String texTwo;
  final VoidCallback? onTapButton;
  final double? buttonRadius;
  final Widget? buttonLeading;
  final IconData? buttonTrailing;
  final EdgeInsetsGeometry? buttonTextPadding;
  final bool isCollapsed;
  final bool expanded;
  final Widget _buttonWidget;

  const DecisionTextButton._({
    required this.onTapText,
    required this.textOne,
    required this.texTwo,
    required Widget buttonWidget,
    this.onTapButton,
    this.buttonRadius,
    this.buttonLeading,
    this.buttonTrailing,
    this.buttonTextPadding,
    this.isCollapsed = false,
    this.expanded = false,
    super.key,
  }) : _buttonWidget = buttonWidget;

  factory DecisionTextButton.primary({
    required VoidCallback onTapText,
    required String textOne,
    required String texTwo,
    VoidCallback? onTapButton,
    double? buttonRadius,
    Widget? buttonLeading,
    IconData? buttonTrailing,
    EdgeInsetsGeometry? buttonTextPadding,
    bool isCollapsed = false,
    bool expanded = false,
    Key? key,
  }) => DecisionTextButton._(
    onTapText: onTapText,
    textOne: textOne,
    texTwo: texTwo,
    onTapButton: onTapButton,
    buttonRadius: buttonRadius,
    buttonLeading: buttonLeading,
    buttonTrailing: buttonTrailing,
    buttonTextPadding: buttonTextPadding,
    isCollapsed: isCollapsed,
    expanded: expanded,
    key: key,
    buttonWidget: BaseFilledButton(
      radius: buttonRadius ?? 10,
      text: texTwo,
      onPressed: onTapButton,
      leading: buttonLeading,
      trailing: buttonTrailing,
      buttonTextPadding: buttonTextPadding,
      isCollapsed: isCollapsed,
    ),
  );

  factory DecisionTextButton.outlined({
    required VoidCallback onTapText,
    required String textOne,
    required String texTwo,
    VoidCallback? onTapButton,
    double? buttonRadius,
    Widget? buttonLeading,
    IconData? buttonTrailing,
    EdgeInsetsGeometry? buttonTextPadding,
    bool isCollapsed = false,
    bool expanded = false,
    Key? key,
  }) => DecisionTextButton._(
    onTapText: onTapText,
    textOne: textOne,
    texTwo: texTwo,
    onTapButton: onTapButton,
    buttonRadius: buttonRadius,
    buttonLeading: buttonLeading,
    buttonTrailing: buttonTrailing,
    buttonTextPadding: buttonTextPadding,
    isCollapsed: isCollapsed,
    expanded: expanded,
    key: key,
    buttonWidget: BaseOutlinedButton(
      radius: buttonRadius ?? 10,
      text: texTwo,
      onPressed: onTapButton,
      leading: buttonLeading,
      trailing: buttonTrailing,
      buttonTextPadding: buttonTextPadding,
      isCollapsed: isCollapsed,
    ),
  );

  factory DecisionTextButton.business({
    required VoidCallback onTapText,
    required String textOne,
    required String texTwo,
    VoidCallback? onTapButton,
    double? buttonRadius,
    Widget? buttonLeading,
    IconData? buttonTrailing,
    EdgeInsetsGeometry? buttonTextPadding,
    bool isCollapsed = false,
    bool expanded = false,
    Key? key,
  }) => DecisionTextButton._(
    onTapText: onTapText,
    textOne: textOne,
    texTwo: texTwo,
    onTapButton: onTapButton,
    buttonRadius: buttonRadius,
    buttonLeading: buttonLeading,
    buttonTrailing: buttonTrailing,
    buttonTextPadding: buttonTextPadding,
    isCollapsed: isCollapsed,
    expanded: expanded,
    key: key,
    buttonWidget: BaseBusinessButton.fontSmall(
      radius: buttonRadius ?? 10,
      text: texTwo,
      onPressed: onTapButton,
      leading: buttonLeading,
      trailing: buttonTrailing,
      buttonTextPadding: buttonTextPadding,
      isCollapsed: isCollapsed,
    ),
  );

  @override
  Widget build(BuildContext context) => Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: <Widget>[
      Expanded(
        flex: expanded ? 1 : 0,
        child: GestureDetector(
          onTap: onTapText,
          child: BaseText(
            textOne,
            style: TypoLink.m.copyWith(
              decoration: TextDecoration.underline,
              fontWeight: FontWeight.w600,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
      Spacing.spacingH16,
      Expanded(flex: expanded ? 1 : 0, child: _buttonWidget),
    ],
  );
}
