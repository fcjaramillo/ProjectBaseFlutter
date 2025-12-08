part of 'extensions.dart';

extension StringExtension on String {
  String capitalize() {
    if (isNotEmpty) {
      return '${this[0].toUpperCase()}${substring(1).toLowerCase()}';
    } else {
      return '';
    }
  }

  String normalize() => replaceAll('_', ' ').capitalize();

  String capitalizeWords() =>
      split(' ').map((String s) => s.capitalize()).join(' ');

  String formatDate() {
    if (isNotEmpty) {
      List<String> date = split(' ');
      String splittedDate = date.first.split('-').first;
      return splittedDate;
    } else {
      return '';
    }
  }

  String formatCurrentDate() {
    if (isNotEmpty) {
      List<String> date = split(' ');
      final List<String> splittedDate = date.first.split('-');
      String formattedDate =
          '${splittedDate.last}/${splittedDate[1]}/${splittedDate.first}';
      return formattedDate;
    } else {
      return '';
    }
  }

  String removeSpaces() => replaceAll(RegExp(r'\s+'), '');
}
