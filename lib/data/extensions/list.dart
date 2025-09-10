part of 'extensions.dart';

extension ListExtension<T> on List<T> {
  List<R> modelToEntity<R>(
    R Function() toEntity,
  ) =>
      map((T element) => toEntity()).toList();

  bool equalTo(List<T> other) {
    if (length != other.length) {
      return false;
    }

    for (int i = 0; i < length; i++) {
      T value1 = this[i];
      T value2 = other[i];

      if (value1 is MapJson && value2 is MapJson) {
        if (!value1.equalTo(value2)) {
          return false;
        }
      } else if (value1 is List && value2 is List) {
        if (value1.equalTo(value2)) {
          return false;
        }
      } else if (value1 != value2) {
        return false;
      }
    }

    return true;
  }

  String joinWithEnd(String firstSeparator, String lastSeparator, String end) {
    if (isEmpty) {
      return '';
    }
    if (length == 1) {
      return this[0].toString();
    }
    final String lastValue = last.toString();
    final List<T> start = List<T>.from(this);
    start.removeLast();
    return '${start.join(firstSeparator)} $lastSeparator $lastValue $end'
        .trim();
  }

  T? getRandomElement() {
    if (isEmpty) {
      return null;
    }
    final int randomIndex = Random().nextInt(length);
    return this[randomIndex];
  }
}
