part of 'apis.dart';

const String kAuthorizationHeader = 'Authorization';
const String kBearer = 'Bearer';

enum MethodApi {
  delete,
  get,
  path,
  post,
  put,
}

///Api for make the calla with DIO to the server
class ApiUtils {
  final dio.Dio _client;
  final String _host;
  final String? _token;
  final Future<String> Function()? _tokenAuthorization;

  ApiUtils({
    required dio.Dio client,
    required String host,
    String? token,
    Future<String> Function()? tokenAuthorization,
  })  : _client = client,
        _host = host,
        _token = token,
        _tokenAuthorization = tokenAuthorization;

  //Make a http request
  Future<Result<MapJson, BackError>> makeRequest({
    required String path,
    required MethodApi method,
    dynamic data,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParameters,
  }) async {
    Map<String, dynamic> allHeaders = <String, dynamic>{};

    //Bearer authorization header
    if (_tokenAuthorization != null) {
      allHeaders[kAuthorizationHeader] =
          '$kBearer ${await _tokenAuthorization.call()}';
    }

    if (_token != null) {
      allHeaders[kAuthorizationHeader] = '$kBearer $_token';
    }

    //Additional headers
    allHeaders.addAll(headers ?? <String, dynamic>{});

    Uri uri = Uri.https(_host, path, queryParameters);

    final dio.Response<dynamic> response;

    final dio.Options options = dio.Options(
      headers: allHeaders,
    );

    try {
      switch (method) {
        case MethodApi.delete:
          response = await _client.deleteUri(
            uri,
            options: options,
          );
        case MethodApi.get:
          response = await _client.getUri(
            uri,
            options: options,
          );
        case MethodApi.path:
          response = await _client.patchUri(
            uri,
            data: data,
            options: options,
          );
        case MethodApi.post:
          response = await _client.postUri(
            uri,
            data: data,
            options: options,
          );
        case MethodApi.put:
          response = await _client.putUri(
            uri,
            data: data,
            options: options,
          );
      }
      return Result<MapJson, BackError>.success(
        response.data is Map ? response.data : <String, dynamic>{},
      );
    } on dio.DioException catch (error) {
      switch (error.type) {
        case dio.DioExceptionType.connectionTimeout:
        case dio.DioExceptionType.receiveTimeout:
        case dio.DioExceptionType.sendTimeout:
          return Result<MapJson, BackError>.fail(
            BackError(
              statusCode: 408,
              description: error.error.toString(),
              err: 'TimeOut',
            ),
          );
        default:
          return Result<MapJson, BackError>.fail(
            BackError(
              description: error.message,
              err: error.error.toString(),
              statusCode: error.response?.statusCode ?? -1,
            ),
          );
      }
    }
  }
}
