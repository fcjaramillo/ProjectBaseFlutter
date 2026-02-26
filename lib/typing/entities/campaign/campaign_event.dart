import 'package:equatable/equatable.dart';

class CampaignEvent extends Equatable {
  const CampaignEvent({
    required this.id,
    required this.title,
    required this.eventDate,
    this.description,
    this.eventTime,
    this.location,
    this.address,
    this.latitude,
    this.longitude,
    this.livestreamUrl,
    this.imageUrl,
    this.isFeatured = false,
    this.isActive = true,
    this.createdAt,
    this.updatedAt,
  });

  factory CampaignEvent.fromJson(Map<String, dynamic> json) => CampaignEvent(
        id: json['id'] as String,
        title: json['title'] as String,
        eventDate: DateTime.parse(json['event_date'] as String),
        description: json['description'] as String?,
        eventTime: json['event_time'] as String?,
        location: json['location'] as String?,
        address: json['address'] as String?,
        latitude: json['latitude'] != null
            ? double.parse(json['latitude'].toString())
            : null,
        longitude: json['longitude'] != null
            ? double.parse(json['longitude'].toString())
            : null,
        livestreamUrl: json['livestream_url'] as String?,
        imageUrl: json['image_url'] as String?,
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
  final DateTime eventDate;
  final String? description;
  final String? eventTime;
  final String? location;
  final String? address;
  final double? latitude;
  final double? longitude;
  final String? livestreamUrl;
  final String? imageUrl;
  final bool isFeatured;
  final bool isActive;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  bool get hasCoordinates => latitude != null && longitude != null;
  bool get hasLivestream => livestreamUrl != null && livestreamUrl!.isNotEmpty;
  bool get isPast => eventDate.isBefore(DateTime.now());
  bool get isToday {
    final DateTime now = DateTime.now();
    return eventDate.year == now.year &&
        eventDate.month == now.month &&
        eventDate.day == now.day;
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'title': title,
        'event_date': eventDate.toIso8601String().split('T').first,
        'description': description,
        'event_time': eventTime,
        'location': location,
        'address': address,
        'latitude': latitude,
        'longitude': longitude,
        'livestream_url': livestreamUrl,
        'image_url': imageUrl,
        'is_featured': isFeatured,
        'is_active': isActive,
        'created_at': createdAt?.toIso8601String(),
        'updated_at': updatedAt?.toIso8601String(),
      };

  @override
  List<Object?> get props => <Object?>[
        id,
        title,
        eventDate,
        description,
        eventTime,
        location,
        address,
        latitude,
        longitude,
        livestreamUrl,
        imageUrl,
        isFeatured,
        isActive,
        createdAt,
        updatedAt,
      ];
}
