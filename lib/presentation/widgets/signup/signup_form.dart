import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rx_dart/blocs/authentication/sigup/sign_up_bloc.dart';
import 'package:rx_dart/constants/layout/styles.dart';
import 'package:rx_dart/presentation/widgets/signup/signup_forms_steps/form_step_1.dart';
import 'package:rx_dart/presentation/widgets/signup/signup_forms_steps/form_step_2.dart';
import 'package:rx_dart/presentation/widgets/signup/signup_forms_steps/form_step_3.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({super.key});

  @override
  Widget build(BuildContext context) => BlocConsumer<SignUpBloc, SignUpState>(
        listener: (context, state) {},
        builder: (context, state) {
          final formStep = switch (state.step) {
            1 => const FormStep1(),
            2 => const FormStep2(),
            3 => const FormStep3(),
            int() => emptyWidget,
          };
          return SliverToBoxAdapter(child: formStep);
        },
      );
}
