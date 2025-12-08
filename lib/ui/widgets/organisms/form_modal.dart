part of 'organisms.dart';

class FormModal extends StatefulWidget {
  const FormModal({
    required this.title,
    required this.children,
    required this.onTapPrimary,
    required this.onTapSecondary,
    required this.primaryText,
    required this.secondaryText,
    this.verticalButtons = false,
    this.subtitle,
    super.key,
  });

  final String title;
  final String? subtitle;
  final List<FormItem> children;
  final String primaryText;
  final String secondaryText;
  final VoidCallback onTapPrimary;
  final VoidCallback onTapSecondary;
  final bool verticalButtons;

  @override
  State<FormModal> createState() => _FormModalState();
}

class _FormModalState extends State<FormModal> {
  late List<TextEditingController> controllers;
  late List<String> initialValues;
  late List<bool> validationErrors;

  @override
  void initState() {
    super.initState();
    controllers = widget.children
        .map((FormItem child) => TextEditingController())
        .toList();
    for (int i = 0; i < controllers.length; i++) {
      controllers[i].text = widget.children[i].value;
    }
    initialValues = widget.children
        .map((FormItem child) => child.value)
        .toList();
    validationErrors = List<bool>.filled(widget.children.length, false);
  }

  @override
  void dispose() {
    super.dispose();
    for (final TextEditingController controller in controllers) {
      controller.dispose();
    }
  }

  bool get hasFormChanged {
    for (int i = 0; i < controllers.length; i++) {
      if (controllers[i].text != initialValues[i]) {
        return true;
      }
    }
    return false;
  }

  bool get activePrimaryButton =>
      hasFormChanged && !validationErrors.any((bool hasError) => hasError);

  void _updateValidationState(int index, String value) {
    final FormItem formItem = widget.children[index];
    if (formItem.validator != null) {
      final String? error = formItem.validator!(value);
      setState(() {
        validationErrors[index] = error != null;
      });
    }
  }

  @override
  Widget build(BuildContext context) => SizedBox(
    height: MediaQuery.of(context).size.height * .75,
    child: Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            BaseText(
              widget.title,
              style: TypoSubtitles.s2,
              textAlign: TextAlign.center,
            ),
            if (widget.subtitle != null)
              BaseText.base(
                widget.subtitle!,
                style: TypoBody.b2r,
                textAlign: TextAlign.center,
              ),
            Spacing.spacingV12,
            const BaseDivider(),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Spacing.spacingV12,
                    ...widget.children.asMap().entries.map(
                      (MapEntry<int, FormItem> e) => Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          ...<Widget>[
                            BaseLabeledTextField(
                              header: e.value.label,
                              label: e.value.value,
                              controller: controllers[e.key],
                              onChanged: (String value) {
                                setState(() {
                                  controllers[e.key].text = value;
                                });
                                _updateValidationState(e.key, value);
                              },
                              enabled: e.value.enabled,
                              validator: e.value.validator,
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                            ),
                            if (e.key != widget.children.length - 1)
                              Spacing.spacingV12,
                          ],
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Spacing.spacingV12,
            DecisionButton(
              primaryText: widget.primaryText,
              primaryOnPressed: activePrimaryButton
                  ? widget.onTapPrimary
                  : null,
              secondaryText: widget.secondaryText,
              secondaryOnPressed: widget.onTapSecondary,
              isVertical: widget.verticalButtons,
              isColorReversed: !widget.verticalButtons,
              spacing: widget.verticalButtons ? Spacing.spacingV12 : null,
            ),
            Spacing.spacingV12,
          ],
        ),
      ),
    ),
  );
}
