part of 'sign_up_bloc.dart';

class SignUpState extends Equatable {
  late String name,
      lastName,
      email,
      password,
      confirmPassword,
      title,
      subTitle1,
      subTitle2;
  late int step, totalSteps;
  final bool newsLetterAcceptance;

  SignUpState(
      {required this.step,
      this.title = 'SIGN UP',
      this.name = '',
      this.lastName = '',
      this.email = '',
      this.password = '',
      this.confirmPassword = '',
      this.newsLetterAcceptance = false})
      : totalSteps = 3,
        subTitle1 = switch (step) {
          1 => 'Tell me',
          2 => 'And',
          3 => 'User?', //TODO: change this to user name
          int() => '',
        },
        subTitle2 = switch (step) {
          1 => 'What is your name?',
          2 => 'Your email address',
          3 => 'Your password',
          int() => '',
        };

  SignUpState copyWith(
          {int? newStep,
          bool? newAcceptance,
          String? newTitle,
          newSubTitle1,
          newSubTitle2,
          newName,
          newLastName,
          newEmail,
          newPassword,
          newConfirmPassword}) =>
      SignUpState(
          step: newStep ?? step,
          title: newTitle ?? title,
          confirmPassword: newConfirmPassword ?? confirmPassword,
          email: newEmail ?? email,
          lastName: newLastName ?? lastName,
          name: newName ?? name,
          password: newPassword ?? password,
          newsLetterAcceptance: newAcceptance ?? newsLetterAcceptance);

  @override
  List<Object> get props => [
        step,
        newsLetterAcceptance,
        name,
        lastName,
        email,
        password,
        confirmPassword
      ];
}
