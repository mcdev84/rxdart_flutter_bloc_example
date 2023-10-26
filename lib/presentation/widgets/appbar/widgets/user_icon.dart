import 'package:flutter/material.dart';
import 'package:rx_dart/blocs/authentication/authentication_bloc.dart';

class UserIcon extends StatelessWidget {
  final AuthenticationStatus _status;

  const UserIcon(this._status, {super.key});

  @override
  Widget build(BuildContext context) =>
      // BlocConsumer(listener: (context, state) {}, builder: (context, state) {
      // return
      _status == AuthenticationStatus.authenticated
          ? const Icon(Icons.account_circle)
          : const Icon(Icons.account_circle_outlined);
// });
}
