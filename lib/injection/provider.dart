import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:rx_dart/blocs/authentication/authentication_bloc.dart';
import 'package:rx_dart/data/datasources/products/products_repository.dart';
import 'package:rx_dart/data/datasources/products/products_repository_impl.dart';
import 'package:rx_dart/presentation/widgets/products/products_bloc.dart';

Future<void> init() async {
  final serviceLocator = GetIt.instance;

  /// DIO ***
  serviceLocator.registerLazySingleton<Dio>(() => _providerDio());

  /// BLOCS ***

  /// Products
  serviceLocator
      .registerFactory<ProductsBloc>(() => ProductsBloc(serviceLocator.get()));

  /// Authentication
  serviceLocator
      .registerFactory<AuthenticationBloc>(() => AuthenticationBloc());

  /// REPOSITORIES ***
  serviceLocator.registerLazySingleton<ProductsRepository>(
      () => ProductsRepositoryImpl(serviceLocator.get()));
}

_providerDio() {
  final dio = Dio(
    BaseOptions(
        baseUrl: dotenv.get("BASE_URL"),
        headers: {"Content-Type": "application/json"},
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10)),
  );
  dio.interceptors.add(InterceptorsWrapper(onRequest: (options, handler) async {
// Add the access token to the request header
    options.headers['Authorization'] = 'Bearer your_access_token';
    return handler.next(options);
  }, onError: (DioException e, handler) async {
    if (e.response?.statusCode == 401) {
// If a 401 response is received, refresh the access token
      String newAccessToken = ' await LogInRepositoryImpl(dio).refreshToken()';

// Update the request header with the new access token
      e.requestOptions.headers['Authorization'] = 'Bearer $newAccessToken';

// Repeat the request with the updated header
      return handler.resolve(await dio.fetch(e.requestOptions));
    }
    return handler.next(e);
  }));
  return dio;
}
