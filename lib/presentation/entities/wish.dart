part of 'entities.dart';

class Wish extends Equatable {
  final String? id;
  final String? image;
  final String? name;
  final List<Object>? wishes;

  const Wish({
    this.id,
    this.image,
    this.name,
    this.wishes,
  });

  Wish copyWith({
    String? id,
    String? image,
    String? name,
    List<Object>? wishes,
  }) =>
      Wish(
        id: id ?? this.id,
        name: name ?? this.name,
        image: image ?? this.image,
        wishes: wishes ?? this.wishes,
      );

  @override
  List<Object?> get props => <Object?>[];
}
