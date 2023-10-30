import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rx_dart/blocs/authentication/authentication_bloc.dart';

class ApplicationBottomBar extends StatelessWidget {
  const ApplicationBottomBar({super.key});

  @override
  Widget build(BuildContext context) =>
      BlocConsumer<AuthenticationBloc, AuthenticationState>(
        listener: (context, state) {},
        builder: (context, state) => StreamBuilder(
            stream: context.read<AuthenticationBloc>().authenticationSubject,
            builder: (context, snapshot) {
              Widget _bottomBar = const SizedBox();
              if (context
                      .read<AuthenticationBloc>()
                      .authenticationSubject
                      .value
                      .status ==
                  AuthenticationStatus.authenticated) {
                _bottomBar = BottomNavigationBar(items: [
                  BottomNavigationBarItem(
                      label: '1',
                      icon: FloatingActionButton(
                          mini: true,
                          clipBehavior: Clip.hardEdge,
                          onPressed: () {},
                          child: const Icon(Icons.bolt))),
                  const BottomNavigationBarItem(
                      label: '2',
                      icon: Icon(Icons.ac_unit),
                      activeIcon: Icon(Icons.face))
                ]);
              }
              return _bottomBar;
            }),
      );
}
