part of 'authentication_bloc.dart';

enum AuthenticationStatus { authenticated, unauthenticated }

@immutable
final class AuthenticationState {
  final AuthenticationStatus status;
  final User _user;

  const AuthenticationState({required this.status}) : _user = User.empty;

  const AuthenticationState.authenticated(User user)
      : status = AuthenticationStatus.authenticated,
        _user = user;

  const AuthenticationState.unAuthenticated()
      : status = AuthenticationStatus.unauthenticated,
        _user = User.empty;

  AuthenticationState copyWith({AuthenticationStatus? newStatus}) =>
      AuthenticationState(status: newStatus ?? status);
}
