import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rx_dart/blocs/authentication/sigup/sign_up_bloc.dart';
import 'package:rx_dart/constants/theme/color/colors.dart';

class StepsIndicator extends StatelessWidget {
  const StepsIndicator({super.key});

  @override
  Widget build(BuildContext context) => BlocConsumer<SignUpBloc, SignUpState>(
      listener: (context, state) {},
      builder: (context, state) =>
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            ...List.generate(state.totalSteps, (i) => i + 1)
                .map((step) => IconButton(
                      visualDensity: VisualDensity.compact,
                      onPressed: () => context
                          .read<SignUpBloc>()
                          .add(SingUpNext(step: step)),
                      icon: Icon(Icons.circle_sharp,
                          opticalSize: 14,
                          size: 14,
                          color: step == state.step
                              ? happyYellow
                              : happyYellow.withOpacity(.5)),
                    ))
          ]));
}
