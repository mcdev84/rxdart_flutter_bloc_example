part of 'sign_up_bloc.dart';

sealed class SignUpEvent {}

final class SingUpNext implements SignUpEvent {
  final int? step;

  const SingUpNext({this.step});
}

final class SingUpPrev implements SignUpEvent {
  final int? step;

  const SingUpPrev({this.step});
}

final class SingUpToggleAcceptance implements SignUpEvent {
  const SingUpToggleAcceptance();
}

final class SingUpSetFields implements SignUpEvent {
  final String? name, lastName, email, password, confirmPassword;

  const SingUpSetFields(
      {this.name,
      this.lastName,
      this.email,
      this.password,
      this.confirmPassword});
}

final class SingUpPost implements SignUpEvent {
  const SingUpPost();
}
