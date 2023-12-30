import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:rx_dart/blocs/authentication/sigin/authentication_bloc.dart';
import 'package:rx_dart/presentation/authentication/signin/sign_in_view.dart';
import 'package:rx_dart/presentation/home/view/home.dart';
import 'package:rx_dart/presentation/widgets/animations/logo_animated.dart';

class SplashScreen extends StatefulWidget {
  static const name = 'splashScreen';
  static const routeName = '/splash';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) => Scaffold(
      key: const Key(SplashScreen.name),
      body: BlocProvider.value(
        value: GetIt.instance.get<AuthenticationBloc>()..add(AuthenticationEventCheckJwt()),
        child: BlocConsumer<AuthenticationBloc, AuthenticationState>(
            listener: (context, state) {
          Timer(const Duration(seconds: 2), () {
            if (state.status == AuthenticationStatus.authenticated) {
              context.go(HomePage.routeName);
            } else {
              context.go(SignInPage.routeName);
            }
          });
        }, builder: (context, state) => const Center(child: LogoAnimated())),
      ));
}
