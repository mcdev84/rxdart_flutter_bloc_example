import 'package:flutter/material.dart';

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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
                controller: _email,
                decoration: const InputDecoration(
                  labelText: 'E-mail',
                  hintText: 'Insert email',
                  prefixIcon: Icon(Icons.email),
                  fillColor: Colors.white,
                )),
            TextFormField(
                controller: _password,cursorColor: Colors.white,
                decoration: const InputDecoration( floatingLabelBehavior: FloatingLabelBehavior.auto,
                  labelText: 'Password',
                  hintText: 'Insert password',
                  prefixIcon: Icon(Icons.key),
                  fillColor: Colors.white,
                )),
          ],
        ),
      ));
}
