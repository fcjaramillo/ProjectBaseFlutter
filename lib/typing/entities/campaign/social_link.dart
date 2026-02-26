import 'package:equatable/equatable.dart';

class SocialLink extends Equatable {
  const SocialLink({
    required this.id,
    required this.platform,
    required this.url,
    this.icon,
    this.sortOrder = 0,
    this.isActive = true,
    this.createdAt,
    this.updatedAt,
  });

  factory SocialLink.fromJson(Map<String, dynamic> json) => SocialLink(
        id: json['id'] as String,
        platform: json['platform'] as String,
        url: json['url'] as String,
        icon: json['icon'] as String?,
        sortOrder: json['sort_order'] as int? ?? 0,
        isActive: json['is_active'] as bool? ?? true,
        createdAt: json['created_at'] != null
            ? DateTime.parse(json['created_at'] as String)
            : null,
        updatedAt: json['updated_at'] != null
            ? DateTime.parse(json['updated_at'] as String)
            : null,
      );

  final String id;
  final String platform;
  final String url;
  final String? icon;
  final int sortOrder;
  final bool isActive;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'platform': platform,
        'url': url,
        'icon': icon,
        'sort_order': sortOrder,
        'is_active': isActive,
        'created_at': createdAt?.toIso8601String(),
        'updated_at': updatedAt?.toIso8601String(),
      };

  @override
  List<Object?> get props => <Object?>[
        id,
        platform,
        url,
        icon,
        sortOrder,
        isActive,
        createdAt,
        updatedAt,
      ];
}
