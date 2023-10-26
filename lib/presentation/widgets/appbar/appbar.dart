import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rx_dart/blocs/authentication/authentication_bloc.dart';
import 'package:rx_dart/constants/layout/layout.dart';

class ApplicationBar extends StatelessWidget implements PreferredSizeWidget {
  const ApplicationBar({super.key});

  @override
  Widget build(BuildContext context) =>
      BlocConsumer<AuthenticationBloc, AuthenticationState>(
        listener: (context, state) {},
        builder: (context, state) =>SliverAppBar(
          expandedHeight: 75,
          flexibleSpace: FlexibleSpaceBar(background: Container(color: Colors.red,)),
          primary: true,
          leading: IconButton(
              onPressed: () => Scaffold.of(context).openDrawer(),
              icon: const Icon(Icons.menu_sharp)),
          title: const Text('DUMMY JSON'),
          centerTitle: true,
          actions: [],
        )
      );

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size(viewWidth, viewHeight * .1);
}
