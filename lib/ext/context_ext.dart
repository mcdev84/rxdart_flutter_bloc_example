import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rx_dart/blocs/authentication/sigin/authentication_bloc.dart';
import 'package:rx_dart/blocs/authentication/sigup/sign_up_bloc.dart';

extension BuildContextExtension on BuildContext {
  AuthenticationBloc get authenticationBloc => read<AuthenticationBloc>();

  SignUpBloc get signUpBloc => read<SignUpBloc>();
}
