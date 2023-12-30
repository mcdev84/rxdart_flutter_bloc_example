import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:rx_dart/data/datasources/login/login_repository.dart';
import 'package:rx_dart/domain/entities/user/user_entity.dart';
import 'package:rx_dart/storage/secure_storage.dart';

part 'authentication_event.dart';

part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final AppAttackStorage _appAttackStorage;
  final LogInRepository _logInRepository;

  AuthenticationBloc(this._logInRepository, this._appAttackStorage)
      : super(AuthenticationState.unAuthenticated_(error: null)) {
    on<AuthenticationEventCheckJwt>((event, emit) async {
      final _userLogged =
          await _appAttackStorage.read(key: 'userLogged').then((user) {
        return user.isNotEmpty ? User.fromJson(jsonDecode(user)) : '';
      });
      print('userLogged => ${_userLogged}');
      if (_userLogged is User) {
        emit(AuthenticationState.authenticated_(loggedUser: _userLogged));
      } else {
        emit(AuthenticationState.unAuthenticated_(error: null));
      }
    });
    on<AuthenticationEventSignIn>((event, emit) async {
      final _login = await _logInRepository.logIn(
          email: event.email, password: event.password);
      _login.fold((l) {
        emit(AuthenticationState.unAuthenticated_(error: l));
      }, (r) {
        /// Write secure storage
        (() async => await _appAttackStorage.write(
            key: 'userLogged', value: jsonEncode(r)))();
        emit(AuthenticationState.authenticated_(loggedUser: r));
      });
    });
    on<AuthenticationEventSignOut>((event, emit) {
      (() async => await _appAttackStorage.del(key: 'userLogged'))();
      emit(AuthenticationState.unAuthenticated_(error: null));
    });
  }
}
