import 'package:equatable/equatable.dart';

class ContactMessage extends Equatable {
  const ContactMessage({
    required this.name,
    required this.email,
    required this.message,
    this.id,
    this.phone,
    this.subject,
    this.isRead = false,
    this.createdAt,
    this.updatedAt,
  });

  factory ContactMessage.fromJson(Map<String, dynamic> json) => ContactMessage(
        id: json['id'] as String?,
        name: json['name'] as String,
        email: json['email'] as String,
        phone: json['phone'] as String?,
        subject: json['subject'] as String?,
        message: json['message'] as String,
        isRead: json['is_read'] as bool? ?? false,
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
  final String? subject;
  final String message;
  final bool isRead;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  Map<String, dynamic> toJson() => <String, dynamic>{
        if (id != null) 'id': id,
        'name': name,
        'email': email,
        'phone': phone,
        'subject': subject,
        'message': message,
        'is_read': isRead,
        'created_at': createdAt?.toIso8601String(),
        'updated_at': updatedAt?.toIso8601String(),
      };

  Map<String, dynamic> toInsertJson() => <String, dynamic>{
        'name': name,
        'email': email,
        'phone': phone,
        'subject': subject,
        'message': message,
      };

  @override
  List<Object?> get props => <Object?>[
        id,
        name,
        email,
        phone,
        subject,
        message,
        isRead,
        createdAt,
        updatedAt,
      ];
}
