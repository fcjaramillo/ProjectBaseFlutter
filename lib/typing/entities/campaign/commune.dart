import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class Commune extends Equatable {
  const Commune({
    required this.id,
    required this.name,
    this.number,
    this.description,
    this.population,
    this.neighborhoods,
    this.svgPath,
    this.color,
    this.latitude,
    this.longitude,
    this.createdAt,
    this.updatedAt,
  });

  factory Commune.fromJson(Map<String, dynamic> json) => Commune(
        id: json['id'] as String,
        name: json['name'] as String,
        number: json['number'] as int?,
        description: json['description'] as String?,
        population: json['population'] as int?,
        neighborhoods: json['neighborhoods'] != null
            ? List<String>.from(json['neighborhoods'] as List<dynamic>)
            : null,
        svgPath: json['svg_path'] as String?,
        color: json['color'] != null
            ? Color(
                int.parse((json['color'] as String).replaceFirst('#', '0xFF')),
              )
            : null,
        latitude: json['latitude'] != null
            ? double.parse(json['latitude'].toString())
            : null,
        longitude: json['longitude'] != null
            ? double.parse(json['longitude'].toString())
            : null,
        createdAt: json['created_at'] != null
            ? DateTime.parse(json['created_at'] as String)
            : null,
        updatedAt: json['updated_at'] != null
            ? DateTime.parse(json['updated_at'] as String)
            : null,
      );

  final String id;
  final String name;
  final int? number;
  final String? description;
  final int? population;
  final List<String>? neighborhoods;
  final String? svgPath;
  final Color? color;
  final double? latitude;
  final double? longitude;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  String get displayName => number != null ? 'Comuna $number - $name' : name;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'name': name,
        'number': number,
        'description': description,
        'population': population,
        'neighborhoods': neighborhoods,
        'svg_path': svgPath,
        'color': color != null
            ? '#${color!.toARGB32().toRadixString(16).substring(2)}'
            : null,
        'latitude': latitude,
        'longitude': longitude,
        'created_at': createdAt?.toIso8601String(),
        'updated_at': updatedAt?.toIso8601String(),
      };

  @override
  List<Object?> get props => <Object?>[
        id,
        name,
        number,
        description,
        population,
        neighborhoods,
        svgPath,
        color,
        latitude,
        longitude,
        createdAt,
        updatedAt,
      ];
}
