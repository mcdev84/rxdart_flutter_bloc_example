import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:rx_dart/data/datasources/login/login_repository.dart';
import 'package:rx_dart/domain/entities/user/user_entity.dart';
import 'package:rxdart/rxdart.dart';

part 'authentication_event.dart';

part 'authentication_state.dart';

class AuthenticationBloc
    extends  Bloc<AuthenticationEvent, AuthenticationState> {
  final LogInRepository _logInRepository;
  final BehaviorSubject<AuthenticationState> _authenticationSubject;

  AuthenticationBloc(this._logInRepository)
      : _authenticationSubject = BehaviorSubject<AuthenticationState>.seeded(
            AuthenticationState.unAuthenticated(error: null)),
        super(AuthenticationState.unAuthenticated(error: null)) {
    on<SignIn>((event, emit) async {
      final _login = await _logInRepository.logIn(
          email: event.email, password: event.password);
      _login.fold((l) {
        _authenticationSubject
            .add(AuthenticationState.unAuthenticated(error: l));
        emit(AuthenticationState.unAuthenticated(error: l));
      }, (r) {
        _authenticationSubject
            .add(AuthenticationState.authenticated(loggedUser: r));
        emit(AuthenticationState.authenticated(loggedUser: r));
      });

      /* TODO:
      * Save token to localStorage
      * */
    });
    on<SignOut>((event, emit) {
      _authenticationSubject
          .add(AuthenticationState.unAuthenticated(error: null));
    });
  }

  BehaviorSubject<AuthenticationState> get authenticationSubject =>
      _authenticationSubject;

  @override
  AuthenticationState? fromJson(Map<String, dynamic> json) {
    // TODO: implement fromJson
    throw UnimplementedError();
  }

  @override
  Map<String, dynamic>? toJson(AuthenticationState state) {
    // TODO: implement toJson
    throw UnimplementedError();
  }
}
