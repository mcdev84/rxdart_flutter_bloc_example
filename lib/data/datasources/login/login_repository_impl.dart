import 'dart:async';
import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:rx_dart/data/datasources/login/login_repository.dart';
import 'package:rx_dart/domain/entities/user/user_entity.dart';

class LogInRepositoryImpl implements LogInRepository {
  final Dio _dio;

  LogInRepositoryImpl(this._dio);

  @override
  Future<Either<DioException, User>> logIn({
    required String email,
    required String password,
  }) async {
    try {
      final response = await _dio.post('/auth/login',
          data: json.encode({"username": email, "password": password}));
      print('SUCCESS logIn: ${response.data.toString()}');
      return Right(User.fromJson(response.data));
    } on DioException catch (e) {
      final err = e.response!.data!;
      print('ERROR logIn: ${e}');
      return Left(e);
    }
  }
}
