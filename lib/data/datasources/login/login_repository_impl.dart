import 'package:dio/dio.dart';
import 'package:rx_dart/data/datasources/login/login_repository.dart';

class LoginRepositoryImpl extends LoginRepository {
  final Dio _dio;
  LoginRepositoryImpl(this._dio);

  @override
  Future<String> logIn() async {
    return '';
  }
}
