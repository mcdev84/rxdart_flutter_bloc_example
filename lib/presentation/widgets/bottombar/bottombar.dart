import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rx_dart/blocs/authentication/authentication_bloc.dart';
import 'package:rx_dart/constants/theme/color/colors.dart';

class ApplicationBottomBar extends StatelessWidget {
  const ApplicationBottomBar({super.key});

  @override
  Widget build(BuildContext context) => StreamBuilder(
            stream: context.read<AuthenticationBloc>().authenticationSubject,
            builder: (context, snapshot) {
              Widget _bottomBar = const SizedBox();
              if (context
                      .read<AuthenticationBloc>()
                      .authenticationSubject
                      .value
                      .status ==
                  AuthenticationStatus.authenticated) {
                _bottomBar = BottomNavigationBar(
                    showSelectedLabels: false,
                    showUnselectedLabels: false,
                    backgroundColor: happyYellow,
                    items:const [
                      BottomNavigationBarItem(
                          label: '1',
                          icon: Icon(Icons.menu_sharp)),
                      BottomNavigationBarItem(
                          label: '2',
                          icon:   Icon(Icons.settings))
                    ]);
              }
              return _bottomBar;
            }
      );
}
