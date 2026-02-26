import 'package:equatable/equatable.dart';

class CityVision extends Equatable {
  const CityVision({
    required this.id,
    required this.mainMessage,
    this.principles,
    this.imageUrl,
    this.videoUrl,
    this.createdAt,
    this.updatedAt,
  });

  factory CityVision.fromJson(Map<String, dynamic> json) => CityVision(
        id: json['id'] as String,
        mainMessage: json['main_message'] as String,
        principles: json['principles'] != null
            ? List<String>.from(json['principles'] as List<dynamic>)
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
  final String mainMessage;
  final List<String>? principles;
  final String? imageUrl;
  final String? videoUrl;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'main_message': mainMessage,
        'principles': principles,
        'image_url': imageUrl,
        'video_url': videoUrl,
        'created_at': createdAt?.toIso8601String(),
        'updated_at': updatedAt?.toIso8601String(),
      };

  @override
  List<Object?> get props => <Object?>[
        id,
        mainMessage,
        principles,
        imageUrl,
        videoUrl,
        createdAt,
        updatedAt,
      ];
}
