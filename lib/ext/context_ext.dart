import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rx_dart/blocs/authentication/authentication_bloc.dart';

extension BuildContextExtension on BuildContext {
  AuthenticationBloc get authenticationBloc => read<AuthenticationBloc>();
}
