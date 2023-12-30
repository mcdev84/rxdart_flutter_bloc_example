part of 'authentication_bloc.dart';

enum AuthenticationStatus { authenticated, error, loading, unauthenticated }

final class AuthenticationState {
  AuthenticationStatus status;
  User user;
  String? successText;
  DioException? errorMsg;

  AuthenticationState._()
      : status = AuthenticationStatus.unauthenticated,
        user = User.empty,
        successText = null,
        errorMsg = null;

  AuthenticationState.authenticated_({required User loggedUser})
      : status = AuthenticationStatus.authenticated,
        user = loggedUser,
        successText = 'Benvenuto ${loggedUser.username}',
        errorMsg = null;

  AuthenticationState.unAuthenticated_({DioException? error})
      : status = AuthenticationStatus.unauthenticated,
        user = User.empty,
        successText = null,
        errorMsg = error;
}
