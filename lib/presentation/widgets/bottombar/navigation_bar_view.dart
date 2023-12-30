import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:rx_dart/blocs/authentication/sigin/authentication_bloc.dart';
import 'package:rx_dart/constants/layout/styles.dart';
import 'package:rx_dart/constants/theme/color/colors.dart';
import 'package:rx_dart/presentation/home/view/home.dart';
import 'package:rx_dart/presentation/widgets/bottombar/bloc/navigation_bar_bloc.dart';
import 'package:rx_dart/presentation/widgets/bottombar/widgets/selected_icon.dart';

class AppAttackBottomBar extends StatelessWidget {
  const AppAttackBottomBar({super.key});

  @override
  Widget build(BuildContext context) => BlocConsumer<AuthenticationBloc,
          AuthenticationState>(
      listener: (context, state) {},
      builder: (context, state) {
        Widget _bottomBar = emptyWidget;
        if (state.status == AuthenticationStatus.authenticated) {
          _bottomBar = Wrap(children: [
            BlocProvider.value(
              value: GetIt.instance.get<NavigationBarBloc>(),
              child: BlocConsumer<NavigationBarBloc, NavigationBarState>(
                listener: (context, state) {},
                builder: (context, state) => NavigationBar(
                    animationDuration: const Duration(milliseconds: 200),
                    onDestinationSelected: (newSelectedIndex) {
                      context.read<NavigationBarBloc>().add(
                          NavigationBarEventSelectedIndex(newSelectedIndex));
                      context.go(HomePage.routeName);
                    },
                    selectedIndex: state.selectedIndex,
                    indicatorColor: Colors.transparent,
                    shadowColor: happyYellow.withOpacity(.5),
                    labelBehavior: NavigationDestinationLabelBehavior.values[2],
                    destinations: [
                      NavigationDestination(
                          label: 'Home',
                          selectedIcon: NavBarSelectedIcon(
                              icon: Icon(
                            Icons.home,
                            color: happyYellow.withOpacity(.65),
                            size: 17,
                          )),
                          icon: const Icon(Icons.home, color: Colors.white)),
                      NavigationDestination(
                          label: 'Nearby',
                          selectedIcon: NavBarSelectedIcon(
                              icon: Icon(
                            Icons.near_me,
                            color: happyYellow.withOpacity(.65),
                            size: 17,
                          )),
                          icon: const Icon(Icons.near_me, color: Colors.white)),
                      NavigationDestination(
                          label: 'Cart',
                          selectedIcon: NavBarSelectedIcon(
                              icon: Icon(
                            Icons.shopping_cart,
                            color: happyYellow.withOpacity(.65),
                            size: 17,
                          )),
                          icon: const Icon(Icons.shopping_cart,
                              color: Colors.white)),
                      NavigationDestination(
                          label: 'Recent',
                          selectedIcon: NavBarSelectedIcon(
                              icon: Icon(
                            Icons.timelapse_rounded,
                            color: happyYellow.withOpacity(.65),
                            size: 17,
                          )),
                          icon: const Icon(Icons.timelapse_rounded,
                              color: Colors.white)),
                      NavigationDestination(
                          label: 'Profile',
                          selectedIcon: NavBarSelectedIcon(
                              icon: Icon(
                            Icons.supervised_user_circle_outlined,
                            color: happyYellow.withOpacity(.65),
                            size: 17,
                          )),
                          icon: const Icon(
                            Icons.supervised_user_circle_outlined,
                            color: Colors.white,
                          ))
                    ]),
              ),
            )
          ]);
        }
        return _bottomBar;
      });
}
