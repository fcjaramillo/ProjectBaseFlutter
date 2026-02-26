part of 'entities.dart';

class News {
  final String title;
  final String description;
  final String image;
  final String source;
  final String url;
  final bool fake;

  const News({
    required this.title,
    required this.description,
    required this.image,
    required this.source,
    required this.url,
    required this.fake,
  });

  News copyWith({
    String? title,
    String? description,
    String? image,
    String? source,
    String? url,
    bool? fake,
  }) => News(
    title: title ?? this.title,
    description: description ?? this.description,
    image: image ?? this.image,
    source: source ?? this.source,
    url: url ?? this.url,
    fake: fake ?? this.fake,
  );
}
