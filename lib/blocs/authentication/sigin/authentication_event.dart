part of 'authentication_bloc.dart';

@immutable
sealed class AuthenticationEvent {}

final class AuthenticationEventSignIn implements AuthenticationEvent {
  final String email, password;
  AuthenticationEventSignIn({required this.email, required this.password});
}

final class AuthenticationEventSignOut implements AuthenticationEvent {}

final class AuthenticationEventCheckJwt implements AuthenticationEvent {}
