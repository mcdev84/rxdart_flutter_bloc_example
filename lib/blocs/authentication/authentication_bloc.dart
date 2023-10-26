import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:rx_dart/domain/entities/product/product_entity.dart';
import 'package:rxdart/rxdart.dart';

part 'authentication_event.dart';

part 'authentication_state.dart';

 class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final BehaviorSubject<List<ProductEntity>> _authenticationSubject;

  AuthenticationBloc()
      : _authenticationSubject = BehaviorSubject<List<ProductEntity>>(),
        super(const AuthenticationState.unAuthenticated()) {
    on<SignIn>((event, emit) {
      emit(state.copyWith(newStatus: AuthenticationStatus.authenticated));
    });
    on<SignOut>((event, emit) {
      emit(state.copyWith(newStatus: AuthenticationStatus.unauthenticated));
    });
  }
}
