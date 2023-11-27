import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

final headers = {"Content-Type": "application/json"};
const timeout = Duration(seconds: 10);
final baseOptions = BaseOptions(
    baseUrl:  dotenv.get("BASE_URL"),
    headers: headers,
    connectTimeout: timeout,
    receiveTimeout: timeout);

interceptors(Dio dio) =>
    InterceptorsWrapper(onRequest: (options, handler) async {
// Add the access token to the request header
      options.headers['Authorization'] = 'Bearer your_access_token';
      return handler.next(options);
    }, onError: (DioException e, handler) async {
      if (e.response?.statusCode == 401) {
// If a 401 response is received, refresh the access token
        String newAccessToken = 'await LogInRepositoryImpl(dio).refreshToken()';

// Update the request header with the new access token
        e.requestOptions.headers['Authorization'] = 'Bearer $newAccessToken';

// Repeat the request with the updated header
        return handler.resolve(await dio.fetch(e.requestOptions));
      }
      return handler.next(e);
    });
