import 'package:equatable/equatable.dart';

class Proposal extends Equatable {
  const Proposal({
    required this.id,
    required this.title,
    this.axisId,
    this.description,
    this.category,
    this.sortOrder = 0,
    this.createdAt,
    this.updatedAt,
  });

  factory Proposal.fromJson(Map<String, dynamic> json) => Proposal(
        id: json['id'] as String,
        title: json['title'] as String,
        axisId: json['axis_id'] as String?,
        description: json['description'] as String?,
        category: json['category'] as String?,
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
  final String? axisId;
  final String? description;
  final String? category;
  final int sortOrder;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'title': title,
        'axis_id': axisId,
        'description': description,
        'category': category,
        'sort_order': sortOrder,
        'created_at': createdAt?.toIso8601String(),
        'updated_at': updatedAt?.toIso8601String(),
      };

  @override
  List<Object?> get props => <Object?>[
        id,
        title,
        axisId,
        description,
        category,
        sortOrder,
        createdAt,
        updatedAt,
      ];
}
