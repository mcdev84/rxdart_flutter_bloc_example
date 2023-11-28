import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:rx_dart/blocs/authentication/authentication_bloc.dart';
import 'package:rx_dart/constants/layout/text_style.dart';
import 'package:rx_dart/constants/theme/color/colors.dart';
import 'package:rx_dart/presentation/home/view/home.dart';

class SignInPage extends StatelessWidget {
  final GlobalKey<FormState> _signInForm;
  final TextEditingController _email;
  final TextEditingController _password;

  SignInPage({super.key})
      : _signInForm = GlobalKey<FormState>(),
        _email = TextEditingController(),
        _password = TextEditingController();

  static const routeName = '/signin';
  static const name = 'signin';

  @override
  Widget build(BuildContext context) => SliverFillRemaining(
      child: Form(
          key: _signInForm,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextFormField(
                    controller: _email,
                    style: noUnderlineText,
                    decoration: const InputDecoration(
                      labelText: 'E-mail',
                      hintText: 'Insert email',
                      prefixIcon: Icon(Icons.email),
                    )),
                TextFormField(
                    style: noUnderlineText,
                    controller: _password,
                    decoration: const InputDecoration(
                        labelText: 'Password',
                        hintText: 'Insert password',
                        prefixIcon: Icon(Icons.key))),
                BlocConsumer<AuthenticationBloc, AuthenticationState>(
                    listener: (context, state) {
                      final _snackBarMsg =
                          state.status == AuthenticationStatus.authenticated
                              ? state!.successText!
                              : state.errorMsg!.message!;
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text(_snackBarMsg),
                          backgroundColor: happyBrown,
                          showCloseIcon: true,
                          duration: const Duration(milliseconds: 750),
                          behavior: SnackBarBehavior.floating));

                      if (state.status == AuthenticationStatus.authenticated) context.go(HomePage.routeName);
                    },
                    builder: (context, state) => ElevatedButton(
                        onPressed: () => context.read<AuthenticationBloc>().add(
                            SignIn(
                                email: _email.text, password: _password.text)),
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.resolveWith(
                                (states) => happyYellow)),
                        child: const Text('Log in')))
              ])));
}
