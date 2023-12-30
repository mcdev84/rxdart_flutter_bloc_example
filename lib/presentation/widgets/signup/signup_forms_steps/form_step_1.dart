import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rx_dart/blocs/authentication/sigup/sign_up_bloc.dart';
import 'package:rx_dart/constants/layout/text_style.dart';
import 'package:rx_dart/ext/context_ext.dart';
import 'package:rx_dart/presentation/widgets/form_template/form_template.dart';

class FormStep1 extends StatelessWidget {
  const FormStep1({super.key});

  static final GlobalKey<FormState> _signUpFormStep1 = GlobalKey<FormState>();
  static final TextEditingController _firstName = TextEditingController();
  static final TextEditingController _lastName = TextEditingController();

  @override
  Widget build(BuildContext context) => AuthenticationFormTemplate(
        signInForm: _signUpFormStep1,
        controller1: _firstName,
        controller2: _lastName,
        onPressed: () {
          if (_signUpFormStep1.currentState!.validate()) {
            ()=> context.signUpBloc.add(SingUpSetFields(
                name: _firstName.text, lastName: _lastName.text));
            context.signUpBloc.add(const SingUpNext(step: 2));
          }
        },
        btnText: 'CONTINUE',
        label1: const Text('Name', style: textFormLabelStyle),
        label2: const Text('Last name', style: textFormLabelStyle),
        hintText1: 'Insert your name',
        hintText2: 'Insert your last name',
        widget2: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          const Text('Already have an account?', style: hintStyle),
          TextButton(
              onPressed: () => context.go('/signin'),
              child: const Text('Sign in', style: signUpStyle))
        ]),
      );
}
