import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:rx_dart/blocs/authentication/sigup/sign_up_bloc.dart';
import 'package:rx_dart/constants/layout/text_style.dart';
import 'package:rx_dart/constants/theme/color/colors.dart';
import 'package:rx_dart/ext/context_ext.dart';
import 'package:rx_dart/presentation/widgets/form_template/form_template.dart';

class FormStep2 extends StatelessWidget {
  const FormStep2({super.key});

  static final GlobalKey<FormState> _signUpFormStep2 = GlobalKey<FormState>();
  static final TextEditingController _email = TextEditingController();

  @override
  Widget build(BuildContext context) => AuthenticationFormTemplate(
      signInForm: _signUpFormStep2,
      controller1: _email,
      widget2alternative: Row(
        children: [
          BlocConsumer<SignUpBloc, SignUpState>(
            listener: (context, state) {
              // TODO: implement listener
            },
            builder: (context, state) => Checkbox(activeColor: happyYellow,

                value: context.signUpBloc.state.newsLetterAcceptance,
                onChanged: (value) {
                  context.signUpBloc.add(const SingUpToggleAcceptance());
                }),
          ),
          const Flexible(
              child: Text('I will subscribe to newsletters and promos'))
        ],
      ),
      onPressed: () {
        if (_signUpFormStep2.currentState!.validate()) {
          () => context.signUpBloc.add(SingUpSetFields(email: _email.text));
          context.signUpBloc.add(const SingUpNext(step: 3));
        }
      },
      btnText: 'CONTINUE',
      label1: const Text('Email', style: textFormLabelStyle),
      hintText1: 'Insert your email',
      textInputType1: TextInputType.emailAddress,
      widget2: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        const Text('Already have an account?', style: hintStyle),
        TextButton(
            onPressed: () => context.go('/signin'),
            child: const Text('Sign in', style: signUpStyle))
      ]));
}
