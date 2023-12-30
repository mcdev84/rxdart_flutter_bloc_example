import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:rx_dart/blocs/authentication/sigin/authentication_bloc.dart';
import 'package:rx_dart/blocs/authentication/sigup/sign_up_bloc.dart';
import 'package:rx_dart/blocs/products/products_bloc.dart';
import 'package:rx_dart/constants/dio/constants.dart';
import 'package:rx_dart/data/datasources/local/device_infos/device_infos_repository.dart';
import 'package:rx_dart/data/datasources/login/login_repository.dart';
import 'package:rx_dart/data/datasources/login/login_repository_impl.dart';
import 'package:rx_dart/data/datasources/products/products_repository.dart';
import 'package:rx_dart/data/datasources/products/products_repository_impl.dart';
import 'package:rx_dart/presentation/widgets/bottombar/bloc/navigation_bar_bloc.dart';
import 'package:rx_dart/storage/secure_storage.dart';

Future<void> init() async {
  final serviceLocator = GetIt.instance;

  /// DIO ***
  serviceLocator.registerLazySingleton<Dio>(() => _providerDio(),
      instanceName: 'dummy');
  serviceLocator.registerLazySingleton<Dio>(() => _providerDio2(),
      instanceName: 'mongo');

  /// LOCAL STORAGE ENC ***
  serviceLocator
      .registerLazySingleton<AppAttackStorage>(() => AppAttackStorage());

  /// DEVICE INFOS ***
  serviceLocator.registerLazySingleton<DeviceInfosRepository>(
      () => DeviceInfosRepositoryImpl());

  /// BLOCS ***
  ///  Navigation bar [bottom]
  serviceLocator.registerFactory<NavigationBarBloc>(() => NavigationBarBloc());

  /// Products
  serviceLocator
      .registerFactory<ProductsBloc>(() => ProductsBloc(serviceLocator.get()));

  /// Authentication
  serviceLocator.registerFactory<AuthenticationBloc>(
      () => AuthenticationBloc(serviceLocator.get(), serviceLocator.get()));

  /// Sign Up
  serviceLocator.registerFactory<SignUpBloc>(() => SignUpBloc());

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
