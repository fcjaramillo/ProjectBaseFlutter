import 'package:equatable/equatable.dart';

class CandidateInfo extends Equatable {
  const CandidateInfo({
    required this.id,
    required this.name,
    this.slogan,
    this.biography,
    this.values,
    this.imageUrl,
    this.videoUrl,
    this.createdAt,
    this.updatedAt,
  });

  factory CandidateInfo.fromJson(Map<String, dynamic> json) => CandidateInfo(
        id: json['id'] as String,
        name: json['name'] as String,
        slogan: json['slogan'] as String?,
        biography: json['biography'] as String?,
        values: json['values'] != null
            ? List<String>.from(json['values'] as List<dynamic>)
            : null,
        imageUrl: json['image_url'] as String?,
        videoUrl: json['video_url'] as String?,
        createdAt: json['created_at'] != null
            ? DateTime.parse(json['created_at'] as String)
            : null,
        updatedAt: json['updated_at'] != null
            ? DateTime.parse(json['updated_at'] as String)
            : null,
      );

  final String id;
  final String name;
  final String? slogan;
  final String? biography;
  final List<String>? values;
  final String? imageUrl;
  final String? videoUrl;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'name': name,
        'slogan': slogan,
        'biography': biography,
        'values': values,
        'image_url': imageUrl,
        'video_url': videoUrl,
        'created_at': createdAt?.toIso8601String(),
        'updated_at': updatedAt?.toIso8601String(),
      };

  @override
  List<Object?> get props => <Object?>[
        id,
        name,
        slogan,
        biography,
        values,
        imageUrl,
        videoUrl,
        createdAt,
        updatedAt,
      ];
}
