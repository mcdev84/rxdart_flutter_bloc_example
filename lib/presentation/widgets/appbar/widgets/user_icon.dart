import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rx_dart/blocs/authentication/authentication_bloc.dart';
import 'package:rx_dart/presentation/authentication/signin/signin.dart';

class UserIcon extends StatelessWidget {
  final AuthenticationStatus _status;

  const UserIcon(this._status, {super.key});

  @override
  Widget build(BuildContext context) =>
      _status == AuthenticationStatus.authenticated
          ? IconButton(
              onPressed: () {
                // context.read<AuthenticationBloc>().add(SignOut());
              },
              icon: const Icon(Icons.account_circle))
          : IconButton(
              onPressed: () {
                // context.read<AuthenticationBloc>().add(SignIn());
                context.push(SignInPage.routeName);
              },
              icon: const Icon(Icons.no_accounts_outlined));
}
