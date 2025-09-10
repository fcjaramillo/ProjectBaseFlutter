part of 'atoms.dart';

class BaseDropdown extends StatelessWidget {
  const BaseDropdown({
    required this.values,
    this.showIcon = false,
    this.expand = false,
    this.selectedValue,
    this.label,
    this.innerLabel,
    this.onChanged,
    this.verticalLabel,
    this.keepHint,
    this.enabled,
    this.textStyle,
    super.key,
  });

  const BaseDropdown.onSurfaceVariant({
    required this.values,
    this.showIcon = false,
    this.expand = false,
    this.selectedValue,
    this.label,
    this.innerLabel,
    this.onChanged,
    this.verticalLabel,
    this.keepHint,
    this.enabled,
    this.textStyle,
    super.key,
  });

  final List<String> values;
  final String? label;
  final String? innerLabel;
  final String? verticalLabel;
  final bool showIcon;
  final bool expand;
  final String? selectedValue;
  final void Function(String?)? onChanged;
  final bool? keepHint;
  final bool? enabled;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final bool isEnabled = enabled ?? true;
    final bool hasValue = selectedValue != null && selectedValue!.isNotEmpty;

    return Opacity(
      opacity: isEnabled ? 1 : 0.5,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          if (verticalLabel != null) ...<Widget>[
            BaseText(verticalLabel!, style: TypoBody.b3r),
            Spacing.spacingV4,
          ],
          DecoratedBox(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Layout.spaceS),
              border: Border.all(color: colorScheme.surfaceContainerLow),
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                dropdownColor: colorScheme.surface,
                borderRadius: BorderRadius.circular(Layout.spaceS),
                isExpanded: expand,
                hint: (keepHint == null)
                    ? BaseText(
                        label ?? kEmptyString,
                        style: textStyle ?? TypoBody.b1r,
                      )
                    : (keepHint!
                        ? BaseText.subtle(
                            label ?? kEmptyString,
                            style: textStyle ?? TypoBody.b1r,
                          )
                        : BaseText(
                            label ?? kEmptyString,
                            style: textStyle ?? TypoBody.b1r,
                          )),
                selectedItemBuilder: keepHint != null
                    ? (BuildContext ctx) => values.map((String v) {
                          if (v == selectedValue &&
                              label != null &&
                              v.isNotEmpty) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                BaseText.subtle(
                                  label!,
                                  style: TypoCaption.c1.semibold,
                                ),
                                BaseText(v, style: textStyle ?? TypoBody.b1r),
                              ],
                            );
                          } else {
                            return BaseText(
                              v,
                              style: textStyle ?? TypoBody.b1r,
                            );
                          }
                        }).toList()
                    : null,
                icon: !showIcon
                    ? const SizedBox()
                    : Icon(
                        Iconsax.arrow_down_1,
                        size: Layout.spaceL,
                        color: colorScheme.onSurface,
                      ),
                onChanged: isEnabled ? onChanged : null,
                value: hasValue ? selectedValue : null,
                menuMaxHeight: Responsive(context).hp(25),
                padding: (keepHint != null && keepHint!)
                    ? BasePadding.paddingH16V8
                    : BasePadding.paddingH16,
                items: values
                    .map(
                      (String v) => DropdownMenuItem<String>(
                        value: v,
                        child: BaseText(v, style: textStyle ?? TypoBody.b1r),
                      ),
                    )
                    .toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
