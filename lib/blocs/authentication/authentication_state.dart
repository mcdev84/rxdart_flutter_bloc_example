part of 'authentication_bloc.dart';

enum AuthenticationStatus { authenticated, unauthenticated }

@immutable
final class AuthenticationState {
  final AuthenticationStatus status;

  const AuthenticationState({required this.status});

  const AuthenticationState.authenticated()
      : status = AuthenticationStatus.authenticated;

  const AuthenticationState.unAuthenticated()
      : status = AuthenticationStatus.unauthenticated;

  AuthenticationState copyWith({AuthenticationStatus? newStatus}) =>
      AuthenticationState(status: newStatus ?? status);
}
