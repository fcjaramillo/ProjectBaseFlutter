import 'package:equatable/equatable.dart';

enum MediaType { image, video, document }

class MediaItem extends Equatable {
  const MediaItem({
    required this.id,
    required this.url,
    this.title,
    this.type,
    this.thumbnailUrl,
    this.description,
    this.mediaDate,
    this.category,
    this.isFeatured = false,
    this.sortOrder = 0,
    this.createdAt,
    this.updatedAt,
  });

  factory MediaItem.fromJson(Map<String, dynamic> json) => MediaItem(
        id: json['id'] as String,
        url: json['url'] as String,
        title: json['title'] as String?,
        type: json['type'] != null
            ? MediaType.values.firstWhere(
                (MediaType e) => e.name == (json['type'] as String),
                orElse: () => MediaType.image,
              )
            : null,
        thumbnailUrl: json['thumbnail_url'] as String?,
        description: json['description'] as String?,
        mediaDate: json['media_date'] != null
            ? DateTime.parse(json['media_date'] as String)
            : null,
        category: json['category'] as String?,
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
  final String url;
  final String? title;
  final MediaType? type;
  final String? thumbnailUrl;
  final String? description;
  final DateTime? mediaDate;
  final String? category;
  final bool isFeatured;
  final int sortOrder;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  bool get isImage => type == MediaType.image;
  bool get isVideo => type == MediaType.video;
  bool get isDocument => type == MediaType.document;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'url': url,
        'title': title,
        'type': type?.name,
        'thumbnail_url': thumbnailUrl,
        'description': description,
        'media_date': mediaDate?.toIso8601String().split('T').first,
        'category': category,
        'is_featured': isFeatured,
        'sort_order': sortOrder,
        'created_at': createdAt?.toIso8601String(),
        'updated_at': updatedAt?.toIso8601String(),
      };

  @override
  List<Object?> get props => <Object?>[
        id,
        url,
        title,
        type,
        thumbnailUrl,
        description,
        mediaDate,
        category,
        isFeatured,
        sortOrder,
        createdAt,
        updatedAt,
      ];
}
