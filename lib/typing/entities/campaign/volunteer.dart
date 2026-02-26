import 'package:equatable/equatable.dart';

class Volunteer extends Equatable {
  const Volunteer({
    required this.name,
    required this.email,
    this.id,
    this.phone,
    this.commune,
    this.neighborhood,
    this.skills,
    this.availability,
    this.message,
    this.isContacted = false,
    this.createdAt,
    this.updatedAt,
  });

  factory Volunteer.fromJson(Map<String, dynamic> json) => Volunteer(
        id: json['id'] as String?,
        name: json['name'] as String,
        email: json['email'] as String,
        phone: json['phone'] as String?,
        commune: json['commune'] as String?,
        neighborhood: json['neighborhood'] as String?,
        skills: json['skills'] != null
            ? List<String>.from(json['skills'] as List<dynamic>)
            : null,
        availability: json['availability'] as String?,
        message: json['message'] as String?,
        isContacted: json['is_contacted'] as bool? ?? false,
        createdAt: json['created_at'] != null
            ? DateTime.parse(json['created_at'] as String)
            : null,
        updatedAt: json['updated_at'] != null
            ? DateTime.parse(json['updated_at'] as String)
            : null,
      );

  final String? id;
  final String name;
  final String email;
  final String? phone;
  final String? commune;
  final String? neighborhood;
  final List<String>? skills;
  final String? availability;
  final String? message;
  final bool isContacted;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  Map<String, dynamic> toJson() => <String, dynamic>{
        if (id != null) 'id': id,
        'name': name,
        'email': email,
        'phone': phone,
        'commune': commune,
        'neighborhood': neighborhood,
        'skills': skills,
        'availability': availability,
        'message': message,
        'is_contacted': isContacted,
        'created_at': createdAt?.toIso8601String(),
        'updated_at': updatedAt?.toIso8601String(),
      };

  Map<String, dynamic> toInsertJson() => <String, dynamic>{
        'name': name,
        'email': email,
        'phone': phone,
        'commune': commune,
        'neighborhood': neighborhood,
        'skills': skills,
        'availability': availability,
        'message': message,
      };

  @override
  List<Object?> get props => <Object?>[
        id,
        name,
        email,
        phone,
        commune,
        neighborhood,
        skills,
        availability,
        message,
        isContacted,
        createdAt,
        updatedAt,
      ];
}
