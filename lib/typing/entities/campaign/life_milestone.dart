import 'package:equatable/equatable.dart';

enum MilestoneCategory { personal, profesional, politico, academico }

class LifeMilestone extends Equatable {
  const LifeMilestone({
    required this.id,
    required this.year,
    required this.title,
    this.description,
    this.imageUrl,
    this.category,
    this.sortOrder = 0,
    this.createdAt,
    this.updatedAt,
  });

  factory LifeMilestone.fromJson(Map<String, dynamic> json) => LifeMilestone(
        id: json['id'] as String,
        year: json['year'] as int,
        title: json['title'] as String,
        description: json['description'] as String?,
        imageUrl: json['image_url'] as String?,
        category: json['category'] != null
            ? MilestoneCategory.values.firstWhere(
                (MilestoneCategory e) =>
                    e.name == (json['category'] as String),
                orElse: () => MilestoneCategory.personal,
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
  final int year;
  final String title;
  final String? description;
  final String? imageUrl;
  final MilestoneCategory? category;
  final int sortOrder;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  String get categoryName {
    switch (category) {
      case MilestoneCategory.personal:
        return 'Personal';
      case MilestoneCategory.profesional:
        return 'Profesional';
      case MilestoneCategory.politico:
        return 'Politico';
      case MilestoneCategory.academico:
        return 'Academico';
      case null:
        return '';
    }
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'year': year,
        'title': title,
        'description': description,
        'image_url': imageUrl,
        'category': category?.name,
        'sort_order': sortOrder,
        'created_at': createdAt?.toIso8601String(),
        'updated_at': updatedAt?.toIso8601String(),
      };

  @override
  List<Object?> get props => <Object?>[
        id,
        year,
        title,
        description,
        imageUrl,
        category,
        sortOrder,
        createdAt,
        updatedAt,
      ];
}
