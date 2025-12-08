part of 'extensions.dart';

extension ColorExtension on Color {
  String get hex => '#${toARGB32().toRadixString(16).padLeft(8, '0')}';
}
