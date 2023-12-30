import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  // final SignUpRepository _signUpRepository;
  SignUpBloc() : super(  SignUpState(step: 1)) {
    on<SingUpNext>(
        (event, emit) => emit(state.copyWith(newStep: event.step ?? 1)));
    on<SingUpPrev>(
        (event, emit) => emit(state.copyWith(newStep: event.step ?? 1)));
    on<SingUpToggleAcceptance>((event, emit) {
      emit(state.copyWith(newAcceptance: !state.newsLetterAcceptance));
      on<SingUpSetFields>((event, emit) => emit(state.copyWith(
          newName: event.name,
          newLastName: event.lastName,
          newEmail: event.email,
          newPassword: event.password,
          newConfirmPassword: event.confirmPassword)));

      on<SingUpPost>((event, emit) async {
        //      final response=await _signUpRepository.signUp();
      });
    });
  }
}
