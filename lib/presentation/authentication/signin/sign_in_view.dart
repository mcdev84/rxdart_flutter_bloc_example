import 'package:flutter/material.dart';
import 'package:rx_dart/presentation/authentication/template/authentication_template.dart';
import 'package:rx_dart/presentation/authentication/widgets/appbar_autnentication.dart';
import 'package:rx_dart/presentation/widgets/sigin/signin_form.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  static const routeName = '/signin';
  static const name = 'signin';

  @override
  Widget build(BuildContext context) => AuthenticationPageTemplate(
      appBar: const AppBarAuthentication(
          title: 'SIGN IN', subTitle1: 'Hi,', subTitle2: 'Sign in to continue'),
      form: SignInForm());
}
