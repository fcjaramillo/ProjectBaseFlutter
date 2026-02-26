import 'package:equatable/equatable.dart';

class CampaignNews extends Equatable {
  const CampaignNews({
    required this.id,
    required this.title,
    this.summary,
    this.content,
    this.imageUrl,
    this.sourceName,
    this.sourceUrl,
    this.publishedDate,
    this.category,
    this.isFeatured = false,
    this.isActive = true,
    this.createdAt,
    this.updatedAt,
  });

  factory CampaignNews.fromJson(Map<String, dynamic> json) => CampaignNews(
        id: json['id'] as String,
        title: json['title'] as String,
        summary: json['summary'] as String?,
        content: json['content'] as String?,
        imageUrl: json['image_url'] as String?,
        sourceName: json['source_name'] as String?,
        sourceUrl: json['source_url'] as String?,
        publishedDate: json['published_date'] != null
            ? DateTime.parse(json['published_date'] as String)
            : null,
        category: json['category'] as String?,
        isFeatured: json['is_featured'] as bool? ?? false,
        isActive: json['is_active'] as bool? ?? true,
        createdAt: json['created_at'] != null
            ? DateTime.parse(json['created_at'] as String)
            : null,
        updatedAt: json['updated_at'] != null
            ? DateTime.parse(json['updated_at'] as String)
            : null,
      );

  final String id;
  final String title;
  final String? summary;
  final String? content;
  final String? imageUrl;
  final String? sourceName;
  final String? sourceUrl;
  final DateTime? publishedDate;
  final String? category;
  final bool isFeatured;
  final bool isActive;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'title': title,
        'summary': summary,
        'content': content,
        'image_url': imageUrl,
        'source_name': sourceName,
        'source_url': sourceUrl,
        'published_date': publishedDate?.toIso8601String().split('T').first,
        'category': category,
        'is_featured': isFeatured,
        'is_active': isActive,
        'created_at': createdAt?.toIso8601String(),
        'updated_at': updatedAt?.toIso8601String(),
      };

  @override
  List<Object?> get props => <Object?>[
        id,
        title,
        summary,
        content,
        imageUrl,
        sourceName,
        sourceUrl,
        publishedDate,
        category,
        isFeatured,
        isActive,
        createdAt,
        updatedAt,
      ];
}
