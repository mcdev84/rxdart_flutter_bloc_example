part of 'authentication_bloc.dart';

@immutable
sealed class AuthenticationEvent {}

final class SignIn implements AuthenticationEvent {}

final class SignOut implements AuthenticationEvent {}
