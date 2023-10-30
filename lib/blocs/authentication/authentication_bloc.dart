import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:rx_dart/data/datasources/login/login_repository.dart';
import 'package:rx_dart/domain/entities/user/user_entity.dart';
import 'package:rxdart/rxdart.dart';

part 'authentication_event.dart';

part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final LogInRepository _logInRepository;
  final BehaviorSubject<AuthenticationState> _authenticationSubject;

  AuthenticationBloc(this._logInRepository)
      : _authenticationSubject = BehaviorSubject<AuthenticationState>.seeded(
            const AuthenticationState.unAuthenticated()),
        super(const AuthenticationState.unAuthenticated()) {
    on<SignIn>((event, emit) async {
      final _login = await _logInRepository.logIn(
          email: event.email, password: event.password);
      _login.isRight()
          ? _authenticationSubject
              .add(const AuthenticationState.authenticated(User.empty))
          : _authenticationSubject
              .add(const AuthenticationState.unAuthenticated());

      /* TODO:
      * Save token to localStorage
      * */
    });
    on<SignOut>((event, emit) {
      _authenticationSubject.add(const AuthenticationState.unAuthenticated());
    });
  }

  BehaviorSubject<AuthenticationState> get authenticationSubject =>
      _authenticationSubject;
}
