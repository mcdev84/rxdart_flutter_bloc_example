import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rx_dart/blocs/authentication/sigup/sign_up_bloc.dart';
import 'package:rx_dart/constants/layout/text_style.dart';
import 'package:rx_dart/ext/context_ext.dart';
import 'package:rx_dart/presentation/widgets/form_template/form_template.dart';

class FormStep3 extends StatelessWidget {
  const FormStep3({super.key});

  static final GlobalKey<FormState> _signUpFormStep3 = GlobalKey<FormState>();
  static final TextEditingController _password = TextEditingController();
  static final TextEditingController _confirmPassword = TextEditingController();

  @override
  Widget build(BuildContext context) => AuthenticationFormTemplate(
      signInForm: _signUpFormStep3,
      controller1: _password,
      controller2: _confirmPassword,
      onPressed: () {
        if (_signUpFormStep3.currentState!.validate()) {
          ()=> context.signUpBloc.add(SingUpSetFields(
              password: _password.text,
              confirmPassword: _confirmPassword.text));
          context.signUpBloc.add(const SingUpPost());
        }
      },
      btnText: 'SIGN UP',
      label1: const Text('Password', style: textFormLabelStyle),
      label2: const Text('Confirm password', style: textFormLabelStyle),
      hintText1: 'Insert your password',
      hintText2: 'Insert again your password',
      widget2: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        const Text('Already have an account?', style: hintStyle),
        TextButton(
            onPressed: () => context.go('/signin'),
            child: const Text('Sign in', style: signUpStyle))
      ]));
}
