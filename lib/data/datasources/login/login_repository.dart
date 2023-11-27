import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:rx_dart/domain/entities/user/user_entity.dart';

abstract class LogInRepository {
  Future<Either<DioException, User>> logIn({
    required String email,
    required String password,
  });

}
