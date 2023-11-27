import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:rx_dart/blocs/authentication/authentication_bloc.dart';
import 'package:rx_dart/blocs/products/products_bloc.dart';
import 'package:rx_dart/constants/dio/constants.dart';
import 'package:rx_dart/data/datasources/login/login_repository.dart';
import 'package:rx_dart/data/datasources/login/login_repository_impl.dart';
import 'package:rx_dart/data/datasources/products/products_repository.dart';
import 'package:rx_dart/data/datasources/products/products_repository_impl.dart';

Future<void> init() async {
  final serviceLocator = GetIt.instance;

  /// DIO ***
  serviceLocator.registerLazySingleton<Dio>(() => _providerDio(),
      instanceName: 'dummy');
  serviceLocator.registerLazySingleton<Dio>(() => _providerDio2(),
      instanceName: 'mongo');

  /// BLOCS ***
  /// Products
  serviceLocator
      .registerFactory<ProductsBloc>(() => ProductsBloc(serviceLocator.get()));

  /// Authentication
  serviceLocator.registerFactory<AuthenticationBloc>(
      () => AuthenticationBloc(serviceLocator.get()));

  /// REPOSITORIES ***
  /// Products
  serviceLocator.registerLazySingleton<ProductsRepository>(
      () => ProductsRepositoryImpl(serviceLocator.get(instanceName: 'dummy')));

  /// User
  serviceLocator.registerLazySingleton<LogInRepository>(
      () => LogInRepositoryImpl(serviceLocator.get(instanceName: 'dummy')));
}

_providerDio() {
  final dioDummy = Dio(baseOptions);
  dioDummy.interceptors.add(interceptors(dioDummy));
  return dioDummy;
}

_providerDio2() {
  final dioMongo = Dio(BaseOptions(
      baseUrl: 'http://10.0.2.2:8080',
      headers: headers,
      connectTimeout: timeout,
      receiveTimeout: timeout));

  dioMongo.interceptors.add(interceptors(dioMongo));
  return dioMongo;
}
