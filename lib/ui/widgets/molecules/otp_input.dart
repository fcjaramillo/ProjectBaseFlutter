part of 'molecules.dart';

class OtpInput extends StatefulWidget {
  final void Function(String) onCompleted;

  const OtpInput({required this.onCompleted, super.key});

  @override
  State<OtpInput> createState() => _OtpInputState();
}

class _OtpInputState extends State<OtpInput> {
  final int length = 6;
  final List<FocusNode> _focusNodes = <FocusNode>[];
  final List<TextEditingController> _controllers = <TextEditingController>[];

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < length; i++) {
      _focusNodes.add(FocusNode());
      _controllers.add(TextEditingController());
    }
  }

  @override
  void dispose() {
    for (final TextEditingController controller in _controllers) {
      controller.dispose();
    }
    for (final FocusNode node in _focusNodes) {
      node.dispose();
    }
    super.dispose();
  }

  void _onChanged(String value, int index) {
    if (value.isNotEmpty && index < length - 1) {
      _focusNodes[index + 1].requestFocus();
    }
    if (value.isEmpty && index > 0) {
      _focusNodes[index - 1].requestFocus();
    }

    final String code = _controllers
        .map((TextEditingController c) => c.text)
        .join();
    if (code.length == length &&
        !_controllers.any((TextEditingController c) => c.text.isEmpty)) {
      widget.onCompleted(code);
    }
  }

  @override
  Widget build(BuildContext context) => Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    spacing: Layout.spaceML,
    children: List<Widget>.generate(
      length,
      (int index) => Expanded(
        child: BaseTextField(
          controller: _controllers[index],
          focusNode: _focusNodes[index],
          keyboardType: TextInputType.number,
          textAlign: TextAlign.center,
          maxLength: 1,
          onChanged: (String value) => _onChanged(value, index),
        ),
      ),
    ),
  );
}
