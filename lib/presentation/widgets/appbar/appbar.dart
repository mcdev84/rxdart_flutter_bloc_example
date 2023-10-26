import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:rx_dart/blocs/authentication/authentication_bloc.dart';
import 'package:rx_dart/constants/layout/layout.dart';
import 'package:rx_dart/presentation/widgets/appbar/widgets/user_icon.dart';

class ApplicationBar extends StatelessWidget implements PreferredSizeWidget {
  const ApplicationBar({super.key});

  static const name = 'ApplicationBar';

  @override
  Widget build(BuildContext context) =>
      BlocConsumer<AuthenticationBloc, AuthenticationState>(
          listener: (context, state) {},
          builder: (context, state) => SliverAppBar(
                key: const Key(name),
                backgroundColor: Colors.lime,
                pinned: false,
                floating: true,
                snap: true,
                // toolbarHeight: viewHeight*.1,
                // automaticallyImplyLeading: true,
                expandedHeight: viewHeight * .1 + 50,
                flexibleSpace: FlexibleSpaceBar(
                    title: Text('FlexibleSpaceBar'),
                    background: Image.asset(
                        width: viewWidth,
                        'assets/images/grocery_store_stylized.jpeg',
                        fit: BoxFit.cover)),
                primary: true,
                leading: //context.read<GoRouterState>().path == '/'
                    /* ? IconButton(
                        onPressed: () => Scaffold.of(context).openDrawer(),
                        icon: const Icon(Icons.menu_sharp))
                    :*/
                    IconButton(
                        onPressed: () {
                         context.pop();
                        },
                        icon: Icon(Icons.arrow_back_ios)),
                title: const Text('DUMMY JSON'),
                centerTitle: true,
                actions: [UserIcon(state.status)],
              ));

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size(viewWidth, viewHeight * .1);
}
