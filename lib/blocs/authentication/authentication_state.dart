part of 'authentication_bloc.dart';

enum AuthenticationStatus { authenticated, unauthenticated ,error,loading}


final class AuthenticationState {
  AuthenticationStatus status;
  User? user;
  String? successText;
  DioException? errorMsg;

  AuthenticationState._()
      : status = AuthenticationStatus.unauthenticated,
        user = User.empty,
        successText = null,
        errorMsg = null;


  AuthenticationState.authenticated({required User loggedUser})
      : status = AuthenticationStatus.authenticated,
        user = loggedUser,
        successText = 'Benvenuto ${loggedUser.username}',
        errorMsg = null;

  AuthenticationState.unAuthenticated({required DioException? error})
      : status = AuthenticationStatus.unauthenticated,
        user = User.empty,
        successText = null,
        errorMsg = error;

}
