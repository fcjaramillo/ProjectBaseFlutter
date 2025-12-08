part of 'molecules.dart';

class PrefixTextFields extends StatelessWidget {
  final String labelCode;
  final String labelPhone;
  final TextEditingController codeController;
  final TextEditingController phoneController;
  final VoidCallback? onTapCode;
  final VoidCallback? onTapPhone;
  final void Function(String)? onChangedPhone;

  const PrefixTextFields({
    required this.labelCode,
    required this.labelPhone,
    required this.codeController,
    required this.phoneController,
    this.onTapCode,
    this.onTapPhone,
    this.onChangedPhone,
    super.key,
  });

  @override
  Widget build(BuildContext context) => Row(
    children: <Widget>[
      Expanded(
        child: SizedBox(
          child: TextFieldNotEditable(
            label: labelCode,
            controller: codeController,
            suffixIcon: Iconsax.arrow_down_1,
            isClickable: true,
            onTap: onTapCode,
          ),
        ),
      ),
      Spacing.spacingH12,
      Expanded(
        child: SizedBox(
          child: BaseTextField(
            onTapTextField: onTapPhone,
            label: labelPhone,
            controller: phoneController,
            keyboardType: TextInputType.number,
            onChanged: onChangedPhone,
          ),
        ),
      ),
    ],
  );
}
