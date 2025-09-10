part of 'extensions.dart';

extension MapExtension on Map<String, dynamic> {
  String getString(
    String key, {
    String defaultValue = '',
    bool alert = false,
  }) {
    if (alert) {
      _customAssert(
        !containsKey(key),
        "The key $key, doesn't exist",
      );

      _customAssert(
        containsKey(key) && this[key] is! String,
        "The key $key isn't a String",
      );
    }
    return this[key] is String ? this[key] : defaultValue;
  }

  int getInt(
    String key, {
    int defaultValue = 0,
    bool alert = false,
  }) {
    if (alert) {
      _customAssert(
        !containsKey(key),
        "The key $key, doesn't exist",
      );

      _customAssert(
        containsKey(key) && this[key] is! int,
        "The key $key isn't an int",
      );
    }
    return this[key] is int ? this[key] : defaultValue;
  }

  num getNum(
    String key, {
    num defaultValue = 0,
    bool alert = false,
  }) {
    if (alert) {
      _customAssert(
        !containsKey(key),
        "The key $key, doesn't exist",
      );

      _customAssert(
        containsKey(key) && this[key] is! num,
        "The key $key isn't a num",
      );
    }
    return this[key] is num ? this[key] : defaultValue;
  }

  double getDouble(
    String key, {
    double defaultValue = 0.0,
    bool alert = false,
  }) {
    if (alert) {
      _customAssert(
        !containsKey(key),
        "The key $key, doesn't exist",
      );

      _customAssert(
        containsKey(key) && this[key] is! double,
        "The key $key isn't a double",
      );
    }
    return this[key] is double
        ? this[key]
        : this[key] is int
            ? double.parse(this[key].toString())
            : defaultValue;
  }

  bool getBool(
    String key, {
    bool defaultValue = false,
    bool alert = false,
  }) {
    if (alert) {
      _customAssert(
        !containsKey(key),
        "The key $key, doesn't exist",
      );

      _customAssert(
        containsKey(key) && this[key] is! bool,
        "The key $key isn't a bool",
      );
    }
    return this[key] is bool ? this[key] : defaultValue;
  }

  List<T> getList<T>(
    String key, {
    List<T> defaultValue = const <Never>[],
    bool alert = false,
  }) {
    if (alert) {
      _customAssert(
        !containsKey(key),
        "The key $key, doesn't exist",
      );

      _customAssert(
        containsKey(key) && this[key] is! List<T>,
        "The key $key isn't a List<$T>",
      );
    }
    return this[key] is List
        ? (this[key] as List<dynamic>).whereType<T>().toList()
        : defaultValue;
  }

  Map<String, dynamic> getMap(
    String key, {
    Map<String, dynamic> defaultValue = const <String, dynamic>{},
    bool alert = false,
  }) {
    if (alert) {
      _customAssert(
        !containsKey(key),
        "The key $key, doesn't exist",
      );

      _customAssert(
        containsKey(key) && this[key] is! Map<String, dynamic>,
        "The key $key isn't a Map<String, dynamic>",
      );
    }
    return this[key] is Map<String, dynamic> ? this[key] : defaultValue;
  }

  String? getStringOr(String key, {bool alert = false}) {
    if (alert) {
      _customAssert(
        !containsKey(key),
        "The key $key, doesn't exist",
      );

      _customAssert(
        containsKey(key) && this[key] is! String,
        "The key $key isn't a String",
      );
    }
    return this[key] is String ? this[key] : null;
  }

  int? getIntOr(String key, {bool alert = false}) {
    if (alert) {
      _customAssert(
        !containsKey(key),
        "The key $key, doesn't exist",
      );

      _customAssert(
        containsKey(key) && this[key] is! int,
        "The key $key isn't an int",
      );
    }
    return this[key] is int ? this[key] : null;
  }

  num? getNumOr(String key, {bool alert = false}) {
    if (alert) {
      _customAssert(
        !containsKey(key),
        "The key $key, doesn't exist",
      );

      _customAssert(
        containsKey(key) && this[key] is! num,
        "The key $key isn't a num",
      );
    }
    return this[key] is num ? this[key] : null;
  }

  double? getDoubleOr(String key, {bool alert = false}) {
    if (alert) {
      _customAssert(
        !containsKey(key),
        "The key $key, doesn't exist",
      );

      _customAssert(
        containsKey(key) && this[key] is! double,
        "The key $key isn't a double",
      );
    }

    if (this[key] is int) {
      return (this[key] as int).toDouble();
    } else if (this[key] is String) {
      final double? result = double.tryParse(this[key] as String);
      if (result != null) {
        return result;
      }
    }

    return this[key] is double ? this[key] : null;
  }

  bool? getBoolOr(
    String key, {
    bool alert = false,
  }) {
    if (alert) {
      _customAssert(
        !containsKey(key),
        "The key $key, doesn't exist",
      );

      _customAssert(
        containsKey(key) && this[key] is! bool,
        "The key $key isn't a bool",
      );
    }
    return this[key] is bool ? this[key] : null;
  }

  List<T>? getListOr<T>(
    String key, {
    bool alert = false,
  }) {
    if (alert) {
      _customAssert(
        !containsKey(key),
        "The key $key, doesn't exist",
      );

      _customAssert(
        containsKey(key) && this[key] is! List<T>,
        "The key $key isn't a List<$T>",
      );
    }
    return this[key] is List<T> ? this[key] : null;
  }

  Map<String, dynamic>? getMapOr(
    String key, {
    bool alert = false,
  }) {
    if (alert) {
      _customAssert(
        !containsKey(key),
        "The key $key, doesn't exist",
      );

      _customAssert(
        containsKey(key) && this[key] is! Map<String, dynamic>,
        "The key $key isn't a Map<String, dynamic>",
      );
    }
    return this[key] is Map<String, dynamic> ? this[key] : null;
  }

  List<T> getModelList<T>(
    String value,
    T Function(Map<String, dynamic> json) parser, {
    bool alert = false,
  }) {
    if (alert) {
      _customAssert(
        !containsKey(value),
        "The key $value, doesn't exist",
      );

      _customAssert(
        containsKey(value) && this[value] is! List,
        "The key $value isn't a List<Map<String, dynamic>>",
      );
    }
    return this[value] is List
        ? (this[value] as List<dynamic>)
            .whereType<MapJson>()
            .map(
              parser,
            )
            .toList()
        : <T>[];
  }

  List<T>? getModelListOr<T>(
    String value,
    T Function(Map<String, dynamic> json) parser, {
    bool alert = false,
  }) {
    if (alert) {
      _customAssert(
        !containsKey(value),
        "The key $value, doesn't exist",
      );

      _customAssert(
        containsKey(value) && this[value] is! List,
        "The key $value isn't a List<Map<String, dynamic>>",
      );
    }
    return this[value] is List
        ? (this[value] as List<dynamic>)
            .whereType<MapJson>()
            .map(
              parser,
            )
            .toList()
        : null;
  }

  T getModel<T>(
    String value,
    T Function(Map<String, dynamic> json) parser, {
    bool alert = false,
  }) {
    if (alert) {
      _customAssert(
        !containsKey(value),
        "The key $value, doesn't exist",
      );

      _customAssert(
        containsKey(value) && this[value] is! MapJson,
        "The key $value isn't a Map<String, dynamic>",
      );
    }
    return parser(getMap(value));
  }

  T? getModelOr<T>(
    String value,
    T Function(Map<String, dynamic> json) parser, {
    bool alert = false,
  }) {
    if (alert) {
      _customAssert(
        !containsKey(value),
        "The key $value, doesn't exist",
      );

      _customAssert(
        containsKey(value) && this[value] is! MapJson,
        "The key $value isn't a Map<String, dynamic>",
      );
    }
    return this[value] is MapJson ? parser(getMap(value)) : null;
  }

  void _customAssert(bool assertion, String message) {
    if (assertion) {
      debugPrint(
        '***********************************\n'
        '************* WARNING *************\n'
        '***********************************\n\n'
        '$message\n\n',
      );
    }
  }

  bool equalTo(MapJson other) {
    if (length != other.length) {
      return false;
    }

    for (final String key in keys) {
      if (!other.containsKey(key)) {
        return false;
      }

      dynamic value1 = this[key];
      dynamic value2 = other[key];

      if (value1 is Map<String, dynamic> && value2 is Map<String, dynamic>) {
        if (!value1.equalTo(value2)) {
          return false;
        }
      } else if (value1 is List && value2 is List) {
        if (!value1.equalTo(value2)) {
          return false;
        }
      } else if (value1 != value2) {
        return false;
      }
    }

    return true;
  }
}
