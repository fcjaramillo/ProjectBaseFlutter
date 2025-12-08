part of '../entities.dart';

class StringPopUpMenuItem {
  const StringPopUpMenuItem({
    required this.value,
    required this.text,
    required this.icon,
    this.subtitle,
  });

  final String value;
  final String text;
  final IconData icon;
  final String? subtitle;
}
