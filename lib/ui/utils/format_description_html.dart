part of 'utils.dart';

class FormatTextHtml {
  static String formatDescription(String htmlText) {
    RegExp exp = RegExp(r'<[^>]*>');
    String plainText = htmlText.replaceAllMapped(exp, (Match match) {
      if (match.group(0) != '<br>') {
        return ' ';
      } else {
        return '\n\n';
      }
    });
    return plainText;
  }
}
