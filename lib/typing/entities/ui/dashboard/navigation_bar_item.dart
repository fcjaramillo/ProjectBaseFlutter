part of '../../entities.dart';

class NavigationBarUiItem {
  final NavigationBarIcon icon;
  final String label;
  final DashboardSection section;
  final int notifications;

  static const NavigationBarUiItem empty = NavigationBarUiItem(
    icon: NavigationBarIcon.empty,
    label: '',
    section: DashboardSection.unknown,
  );

  const NavigationBarUiItem({
    required this.icon,
    required this.label,
    required this.section,
    this.notifications = 0,
  });

  bool get isNotEmpty => label != '' && section != DashboardSection.unknown;

  NavigationBarUiItem copyWith({
    int? notifications,
  }) =>
      NavigationBarUiItem(
        icon: icon,
        label: label,
        section: section,
        notifications: notifications ?? this.notifications,
      );
}
