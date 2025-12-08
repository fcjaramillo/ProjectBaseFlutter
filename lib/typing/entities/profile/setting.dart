part of '../entities.dart';

class Setting {
  final int id;
  final IconData icon;
  final String description;
  final String key;
  final bool visible;
  final int order;

  const Setting({
    required this.icon,
    required this.description,
    required this.key,
    this.visible = true,
    this.order = 0,
    this.id = 0,
  });

  Setting copyWith({
    int? id,
    IconData? icon,
    String? description,
    bool? visible,
    int? order,
  }) => Setting(
    id: id ?? this.id,
    icon: icon ?? this.icon,
    description: description ?? this.description,
    visible: visible ?? this.visible,
    order: order ?? this.order,
    key: key,
  );
}
