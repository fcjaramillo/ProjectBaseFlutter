part of '../../entities.dart';

class NavigationBarIcon {
  final IconData? icon;
  final String? svg;
  final EdgeInsets offset;

  static const NavigationBarIcon empty = NavigationBarIcon._();

  const NavigationBarIcon.icon({
    required IconData this.icon,
    this.offset = EdgeInsets.zero,
  }) : svg = null;

  const NavigationBarIcon.svg({
    required String this.svg,
    this.offset = EdgeInsets.zero,
  }) : icon = null;

  const NavigationBarIcon._()
      : offset = EdgeInsets.zero,
        svg = null,
        icon = null;
}
