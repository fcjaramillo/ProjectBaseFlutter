part of 'extensions.dart';

class DateInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final String oldText = oldValue.text;
    final String newText = newValue.text;
    final int newSelectionIndex = newValue.selection.baseOffset;

    final String digitsOnly = newText.replaceAll(RegExp(r'[^0-9]'), '');
    final int digitsLength = digitsOnly.length;

    String formatted = '';

    for (int i = 0; i < digitsLength && i < 8; i++) {
      if (i == 2 || i == 4) {
        formatted += '/';
      }
      formatted += digitsOnly[i];
    }

    int cursorPosition = formatted.length;

    if (oldText.length > newText.length) {
      cursorPosition = newSelectionIndex;
    }

    return TextEditingValue(
      text: formatted,
      selection: TextSelection.collapsed(
        offset: cursorPosition.clamp(0, formatted.length),
      ),
    );
  }
}
