part of 'organisms.dart';

class MessageBottomSheet extends StatelessWidget {
  final Color? background;
  final Color? iconColor;
  final Color? iconBackgroundColor;
  final bool? businessButtonColor;
  final double? iconSize;
  final String title;
  final String subtitle;
  final String? postButton;
  final IconData? icon;
  final String? textPrimary;
  final String? textSecondary;
  final VoidCallback? onTapPrimary;
  final VoidCallback? onTapSecondary;
  final VoidCallback? onTapIcon;
  final bool haveClose;
  final double? closeSize;
  final Widget? extraInfo;
  final TextAlign? titleAligment;
  final CrossAxisAlignment crossAxisAlignment;
  final BorderRadius? borderRadius;
  final TextStyle? titleStyle;
  final bool isV2;
  final String? header;
  final double? width;
  final EdgeInsetsGeometry? padding;
  final bool invertHeaderAndTitle;
  final bool showIcon;

  const MessageBottomSheet({
    required this.title,
    required this.subtitle,
    this.background,
    this.iconColor,
    this.businessButtonColor,
    this.iconBackgroundColor,
    this.iconSize,
    this.icon,
    this.textPrimary,
    this.onTapPrimary,
    this.textSecondary,
    this.onTapSecondary,
    this.onTapIcon,
    this.haveClose = true,
    this.closeSize,
    this.extraInfo,
    this.titleAligment,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.borderRadius,
    this.titleStyle,
    this.postButton,
    this.header,
    this.padding,
    this.width,
    this.invertHeaderAndTitle = false,
    this.showIcon = true,
    super.key,
  }) : isV2 = false;

  const MessageBottomSheet.v2({
    required this.title,
    required this.subtitle,
    this.background,
    this.iconColor,
    this.iconBackgroundColor,
    this.businessButtonColor,
    this.iconSize,
    this.icon,
    this.textPrimary,
    this.onTapPrimary,
    this.textSecondary,
    this.onTapSecondary,
    this.onTapIcon,
    this.haveClose = true,
    this.closeSize,
    this.extraInfo,
    this.titleAligment,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.borderRadius,
    this.titleStyle,
    this.postButton,
    this.header,
    this.padding,
    this.width,
    this.invertHeaderAndTitle = false,
    this.showIcon = true,
    super.key,
  }) : isV2 = true;

  @override
  Widget build(BuildContext context) {
    Widget showedIcon = Visibility(
      visible: icon != null,
      child: GestureDetector(
        onTap: onTapIcon,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: iconBackgroundColor,
            borderRadius: BaseRadius.circular,
          ),
          child: Padding(
            padding: iconBackgroundColor != null
                ? BasePadding.padding_8
                : EdgeInsets.zero,
            child: Icon(
              icon,
              color: iconColor,
              size: iconSize ?? Layout.spaceXXL,
            ),
          ),
        ),
      ),
    );

    return Material(
      borderRadius: borderRadius,
      color: background,
      surfaceTintColor: background,
      child: Padding(
        padding: padding ?? (isV2 ? EdgeInsets.zero : BasePadding.padding_24),
        child: Stack(
          children: <Widget>[
            SizedBox(
              width: width ?? double.maxFinite,
              child: Column(
                crossAxisAlignment: crossAxisAlignment,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Visibility(
                    visible: !isV2,
                    replacement: Column(
                      crossAxisAlignment: crossAxisAlignment,
                      children: <Widget>[
                        ...buildHeaderAndTitle(),
                        Spacing.spacingV12,
                        const BaseDivider(),
                        if (showIcon) ...<Widget>[
                          Spacing.spacingV24,
                          showedIcon,
                        ],
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        showedIcon,
                        Spacing.spacingV16,
                        BaseText(
                          title,
                          style: titleStyle ?? TypoSubtitles.s2,
                          textAlign: titleAligment,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: padding ??
                        (isV2
                            ? const EdgeInsets.only(
                                left: Layout.spaceL,
                                right: Layout.spaceL,
                                bottom: Layout.spaceL,
                              )
                            : EdgeInsets.zero),
                    child: Column(
                      crossAxisAlignment: crossAxisAlignment,
                      children: <Widget>[
                        if (subtitle != kEmptyString) ...<Widget>[
                          Spacing.spacingV16,
                          BaseText.soft(
                            subtitle,
                            textAlign: TextAlign.center,
                            style: TypoBody.b1r.copyWith(
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                        if (extraInfo != null) extraInfo!,
                        Visibility(
                          visible: onTapPrimary != null,
                          child: Column(
                            children: <Widget>[
                              Spacing.spacingV24,
                              Visibility(
                                visible: onTapSecondary != null,
                                replacement: BasePrimaryButton(
                                  isFullWidth: true,
                                  text: textPrimary ?? kEmptyString,
                                  onPressed: onTapPrimary,
                                ),
                                child: DecisionButton(
                                  primaryText: textPrimary ?? kEmptyString,
                                  secondaryText: textSecondary ?? kEmptyString,
                                  primaryOnPressed: onTapPrimary ?? () {},
                                  secondaryOnPressed: onTapSecondary ?? () {},
                                  isColorReversed: true,
                                  businessButtonColor: businessButtonColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (postButton == null) Spacing.spacingV12,
                  if (postButton != null) ...<Widget>[
                    BaseText.soft(
                      postButton!,
                      textAlign: TextAlign.center,
                      style: TypoBody.b1r.copyWith(
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Spacing.spacingV24,
                  ],
                ],
              ),
            ),
            Visibility(
              visible: haveClose,
              child: Positioned(
                top: Layout.spaceXXS,
                right: Layout.spaceXXS,
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Icon(
                    Icons.close,
                    size: closeSize ?? 20,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> buildHeaderAndTitle() {
    final List<Widget> widgets = <Widget>[];

    final bool shouldShowHeaderFirst = header != null && !invertHeaderAndTitle;
    final bool shouldShowHeaderLast = header != null && invertHeaderAndTitle;

    if (shouldShowHeaderFirst) {
      widgets.add(
        BaseText.soft(
          header!,
          style: TypoBody.b2r,
          textAlign: titleAligment,
        ),
      );
    }

    widgets.add(
      BaseText(
        title,
        style: titleStyle ?? TypoSubtitles.s2,
        textAlign: titleAligment,
      ),
    );

    if (shouldShowHeaderLast) {
      widgets.add(
        BaseText.soft(
          header!,
          style: TypoBody.b2r,
          textAlign: titleAligment,
        ),
      );
    }

    return widgets;
  }
}
