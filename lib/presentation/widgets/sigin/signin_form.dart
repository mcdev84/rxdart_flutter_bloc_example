import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:rx_dart/blocs/authentication/sigin/authentication_bloc.dart';
import 'package:rx_dart/constants/layout/text_style.dart';
import 'package:rx_dart/ext/context_ext.dart';
import 'package:rx_dart/presentation/home/view/home.dart';
import 'package:rx_dart/presentation/widgets/form_template/form_template.dart';

class SignInForm extends StatelessWidget {
  final GlobalKey<FormState> _signInForm;
  final TextEditingController _email;
  final TextEditingController _password;

  SignInForm({super.key})
      : _signInForm = GlobalKey<FormState>(),
        _email = TextEditingController(),
        _password = TextEditingController();

  @override
  Widget build(BuildContext context) =>
      BlocConsumer<AuthenticationBloc, AuthenticationState>(
          listener: (context, state) {
            if (state.status == AuthenticationStatus.authenticated) context.go(HomePage.routeName);
          },
          builder: (context, state) => SliverToBoxAdapter(
              child: AuthenticationFormTemplate(
                  btnText: 'SIGNIN',
                  onPressed: () => context.authenticationBloc.add(
                      AuthenticationEventSignIn(
                          email: _email.text, password: _password.text)),
                  controller1: _email,
                  controller2: _password,
                  signInForm: _signInForm,
                  hintText1: 'Insert email',
                  hintText2: 'Insert Password',
                  label1: const Text('Email', style: textFormLabelStyle),
                  label2: const Text('Password', style: textFormLabelStyle),
                  widget1: const Text('Forgot password?', style: hintStyle),
                  widget2: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Don t have an account?', style: hintStyle),
                        TextButton(
                            onPressed: () => context.go('/signup'),
                            child: const Text('Sign up', style: signUpStyle))
                      ]))));
}
