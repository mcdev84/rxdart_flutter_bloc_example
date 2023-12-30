import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rx_dart/blocs/authentication/sigup/sign_up_bloc.dart';
import 'package:rx_dart/presentation/authentication/template/authentication_template.dart';
import 'package:rx_dart/presentation/authentication/widgets/StepsIndicator.dart';
import 'package:rx_dart/presentation/authentication/widgets/appbar_autnentication.dart';
import 'package:rx_dart/presentation/widgets/signup/signup_form.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  static const name = 'SignUpPage';
  static const routeName = '/signup';

  @override
  Widget build(BuildContext context) => BlocConsumer<SignUpBloc, SignUpState>(
        listener: (context, state) {},
        builder: (context, state) => AuthenticationPageTemplate(
            appBar: AppBarAuthentication(
                title: state.title,
                subTitle1: state.subTitle1,
                subTitle2: state.subTitle2,
                stepsIndicator: const StepsIndicator()),
            form: const SignUpForm()),
      );
}
