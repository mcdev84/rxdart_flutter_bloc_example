part of 'authentication_bloc.dart';

@immutable
sealed class AuthenticationEvent {}

final class SignIn implements AuthenticationEvent {
  final String email, password;

  SignIn({required this.email, required this.password});
}

final class SignOut implements AuthenticationEvent {}
