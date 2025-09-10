part of 'extensions.dart';

//TypeDefinitions
typedef MapJson = Map<String, dynamic>;
typedef ResultDef<T> = Result<T, BackError>;
typedef SuccessDef<T> = Success<T, BackError>;
typedef FutureResult<T> = Future<ResultDef<T>>;
typedef FutureResultList<T> = Future<ResultDef<List<T>>>;

/// Result class that handle the errores and result in
/// one simple and powerful handler
///
/// Use [failRes] and [successRes] only if the previous
/// validations was made. With the function [when] easily
/// you can handle the result and error and make custom logic.
/// If need make some validations about the data of the
/// result use [isFail] or [isSuccess]
abstract class Result<T, E> {
  Result();

  bool get isFail;

  bool get isSuccess;

  E? get failRes;

  T? get successRes;

  factory Result.fail(E e) = Fail<T, E>;

  factory Result.success(T t) = Success<T, E>;

  R when<R>({
    required R Function(E) fail,
    required R Function(T) success,
  });

  void then({
    required void Function(E) fail,
    required void Function(T) success,
  });
}

class Success<T, E> extends Result<T, E> {
  final T _success;

  Success(T v) : _success = v;

  @override
  R when<R>({
    required R Function(E) fail,
    required R Function(T) success,
  }) =>
      success(_success);

  @override
  bool get isFail => false;

  @override
  bool get isSuccess => true;

  @override
  E? get failRes => null;

  @override
  T get successRes => _success;

  @override
  void then({
    required void Function(E) fail,
    required void Function(T) success,
  }) =>
      success(_success);
}

/// Fail result implementation class
class Fail<T, E> extends Result<T, E> {
  final E _fail;

  Fail(E e) : _fail = e;

  @override
  R when<R>({
    required R Function(E) fail,
    required R Function(T) success,
  }) =>
      fail(_fail);

  @override
  bool get isFail => true;

  @override
  bool get isSuccess => false;

  @override
  E? get failRes => _fail;

  @override
  T? get successRes => null;

  @override
  void then({
    required void Function(E) fail,
    required void Function(T) success,
  }) =>
      fail(_fail);
}

/// This class create the base to handle the errors.
abstract class Error extends Equatable {
  final String? description;
  final String? err;
  final Map<String, dynamic>? data;

  const Error({
    required this.description,
    required this.err,
    this.data,
  });
}

/// Error handler for the backend responde errors
class BackError extends Error {
  final int statusCode;

  const BackError({
    required this.statusCode,
    super.data,
    super.description,
    super.err,
  });

  BackError copyWith({
    Map<String, dynamic>? data,
    String? description,
    String? err,
    int? statusCode,
  }) =>
      BackError(
        data: data ?? this.data,
        description: description ?? this.description,
        err: err ?? this.err,
        statusCode: statusCode ?? this.statusCode,
      );

  @override
  List<Object?> get props => <Object?>[
        data,
        description,
        err,
        statusCode,
      ];
}
