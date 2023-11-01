import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rx_dart/blocs/authentication/authentication_bloc.dart';
import 'package:rx_dart/constants/layout/sizes.dart';
import 'package:rx_dart/presentation/widgets/appbar/widgets/leading_icon.dart';
import 'package:rx_dart/presentation/widgets/appbar/widgets/searchbar.dart';
import 'package:rx_dart/presentation/widgets/appbar/widgets/user_icon.dart';

class ApplicationBar extends StatelessWidget implements PreferredSizeWidget {
  const ApplicationBar({super.key});

  static const name = 'ApplicationBar';

  @override
  Widget build(BuildContext context) =>
      BlocConsumer<AuthenticationBloc, AuthenticationState>(
          listener: (context, state) {},
          builder: (context, state) => StreamBuilder(
                stream:
                    context.read<AuthenticationBloc>().authenticationSubject,
                builder: (context, snapshot) => SliverAppBar(
                  //expandedHeight: appBarSize.height + 25,
                  //flexibleSpace: const FlexibleSpaceAppBar(),*/
                  bottom: AppBar(leading: const SizedBox(),toolbarHeight: appBarSize.height,
                      title: const SearchAppBar()),
                  key: const Key(name),
                  pinned: true,
                  floating: true,
                  snap: true,
                  leading: const LeadingAppBarIcon(),
                  title: const Text('DummyJson shop'),
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
