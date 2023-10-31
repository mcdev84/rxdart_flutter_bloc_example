import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:rx_dart/blocs/authentication/authentication_bloc.dart';
import 'package:rx_dart/constants/layout/sizes.dart';
import 'package:rx_dart/presentation/home/view/home.dart';
import 'package:rx_dart/presentation/widgets/appbar/widgets/flexible_space_appbar.dart';
import 'package:rx_dart/presentation/widgets/appbar/widgets/searchbar.dart';
import 'package:rx_dart/presentation/widgets/appbar/widgets/user_icon.dart';

class ApplicationBar extends StatelessWidget implements PreferredSizeWidget {
  const ApplicationBar({super.key});

  static const name = 'ApplicationBar';

  @override
  Widget build(BuildContext context) =>
      BlocConsumer<AuthenticationBloc, AuthenticationState>(
          listener: (context, state) {},
          builder: (context, state) =>
              StreamBuilder(
                stream:
                context
                    .read<AuthenticationBloc>()
                    .authenticationSubject,
                builder: (context, snapshot) =>
                    SliverAppBar(
                      expandedHeight: appBarSize.height + 25,
                      flexibleSpace: FlexibleSpaceAppBar(),
                      key: const Key(name),
                      pinned: true,
                      floating: true,
                      snap: true,
                      primary: true,
                      leading: GoRouterState
                          .of(context)
                          .path != HomePage.routeName
                          ? IconButton(
                          onPressed: () => context.pop(),
                          icon: const Icon(Icons.arrow_back_ios))
                          : IconButton(
                          onPressed: () => Scaffold.of(context).openDrawer(),
                          icon: const Icon(Icons.menu)),
                      title: const Text('DUMMY JSON'),
                      actions: [
                        UserIcon(context
                            .read<AuthenticationBloc>()
                            .authenticationSubject
                            .value
                            .status)
                      ],
                    ),
              ));

  @override
  // TODO: implement preferredSize
  Size get preferredSize => appBarSize;
}
