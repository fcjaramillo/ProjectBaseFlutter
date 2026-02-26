import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class StrategicAxis extends Equatable {
  const StrategicAxis({
    required this.id,
    required this.title,
    this.description,
    this.icon,
    this.color,
    this.sortOrder = 0,
    this.createdAt,
    this.updatedAt,
  });

  factory StrategicAxis.fromJson(Map<String, dynamic> json) => StrategicAxis(
        id: json['id'] as String,
        title: json['title'] as String,
        description: json['description'] as String?,
        icon: json['icon'] as String?,
        color: json['color'] != null
            ? Color(
                int.parse((json['color'] as String).replaceFirst('#', '0xFF')),
              )
            : null,
        sortOrder: json['sort_order'] as int? ?? 0,
        createdAt: json['created_at'] != null
            ? DateTime.parse(json['created_at'] as String)
            : null,
        updatedAt: json['updated_at'] != null
            ? DateTime.parse(json['updated_at'] as String)
            : null,
      );

  final String id;
  final String title;
  final String? description;
  final String? icon;
  final Color? color;
  final int sortOrder;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'title': title,
        'description': description,
        'icon': icon,
        'color': color != null
            ? '#${color!.toARGB32().toRadixString(16).substring(2)}'
            : null,
        'sort_order': sortOrder,
        'created_at': createdAt?.toIso8601String(),
        'updated_at': updatedAt?.toIso8601String(),
      };

  @override
  List<Object?> get props => <Object?>[
        id,
        title,
        description,
        icon,
        color,
        sortOrder,
        createdAt,
        updatedAt,
      ];
}
