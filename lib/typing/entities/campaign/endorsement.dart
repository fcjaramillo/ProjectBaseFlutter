import 'package:equatable/equatable.dart';

enum EndorsementType { personal, organizacion, politico, empresarial }

class Endorsement extends Equatable {
  const Endorsement({
    required this.id,
    required this.name,
    this.title,
    this.quote,
    this.imageUrl,
    this.organization,
    this.type,
    this.isFeatured = false,
    this.sortOrder = 0,
    this.createdAt,
    this.updatedAt,
  });

  factory Endorsement.fromJson(Map<String, dynamic> json) => Endorsement(
        id: json['id'] as String,
        name: json['name'] as String,
        title: json['title'] as String?,
        quote: json['quote'] as String?,
        imageUrl: json['image_url'] as String?,
        organization: json['organization'] as String?,
        type: json['type'] != null
            ? EndorsementType.values.firstWhere(
                (EndorsementType e) => e.name == (json['type'] as String),
                orElse: () => EndorsementType.personal,
              )
            : null,
        isFeatured: json['is_featured'] as bool? ?? false,
        sortOrder: json['sort_order'] as int? ?? 0,
        createdAt: json['created_at'] != null
            ? DateTime.parse(json['created_at'] as String)
            : null,
        updatedAt: json['updated_at'] != null
            ? DateTime.parse(json['updated_at'] as String)
            : null,
      );

  final String id;
  final String name;
  final String? title;
  final String? quote;
  final String? imageUrl;
  final String? organization;
  final EndorsementType? type;
  final bool isFeatured;
  final int sortOrder;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'name': name,
        'title': title,
        'quote': quote,
        'image_url': imageUrl,
        'organization': organization,
        'type': type?.name,
        'is_featured': isFeatured,
        'sort_order': sortOrder,
        'created_at': createdAt?.toIso8601String(),
        'updated_at': updatedAt?.toIso8601String(),
      };

  @override
  List<Object?> get props => <Object?>[
        id,
        name,
        title,
        quote,
        imageUrl,
        organization,
        type,
        isFeatured,
        sortOrder,
        createdAt,
        updatedAt,
      ];
}
