part of 'authentication_bloc.dart';

enum AuthenticationStatus { authenticated, unauthenticated }


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

  set setStatus(AuthenticationStatus newStatus) =>
      AuthenticationState._().status = newStatus;

  AuthenticationState.authenticated({required User? loggedUser})
      : status = AuthenticationStatus.authenticated,
        user = loggedUser,
        successText = null,
        errorMsg = null;

  AuthenticationState.unAuthenticated({required DioException? error})
      : status = AuthenticationStatus.unauthenticated,
        user = User.empty,
        successText = null,
        errorMsg = error;

  AuthenticationState copyWith(
      {AuthenticationStatus? newStatus,
      User? newUser,
      String? success,
      DioException? error}) {
    final AuthenticationState newState = AuthenticationState._();
    newState.status = newStatus ?? status;
    newState.user = newUser ?? user;
    newState.successText = success ?? successText;
    newState.errorMsg = error ?? errorMsg;
    return newState;
  }
}
