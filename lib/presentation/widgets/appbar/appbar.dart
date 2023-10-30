import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:rx_dart/blocs/authentication/authentication_bloc.dart';
import 'package:rx_dart/constants/layout/layout.dart';
import 'package:rx_dart/presentation/home/view/home.dart';
import 'package:rx_dart/presentation/widgets/appbar/widgets/user_icon.dart';
import 'package:rx_dart/presentation/widgets/appbar/widgets/wavwd_container.dart';

import '../../../blocs/products/products_bloc.dart';

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
                  toolbarHeight: appBarHeight,
                  key: const Key(name),
                  pinned: false,
                  floating: true,
                  snap: true,
                  expandedHeight: appBarHeightExpanded,
                  flexibleSpace: BlocConsumer<ProductsBloc, ProductsState>(
                      listener: (context, state) {},
                      builder: (context, state) => ClipPath(
                        //upper clippath with less height
                        clipper: WaveClipper(),
                        //set our custom wave clipper.
                        child: Container(
                            padding: EdgeInsets.only(bottom: 50),
                            color: Colors.red,
                            height: 180,
                            alignment: Alignment.center,
                            child: Column(
                              children: [
                                Text(
                                  "Wave clipper",
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            )),
                      )
                     /*     FlexibleSpaceBar(
                          background: Image.asset(
                              width: viewWidth,
                              'assets/images/grocery_store_stylized.jpeg',
                              fit: BoxFit.cover),
                          centerTitle: true,
                          title: SizedBox(
                            height: appBarHeight * .33,
                            child: Row(
                              children: [
                                InputChip(
                                  label: Text('Filter'),
                                ),
                                SearchBar(
                                    leading: const Icon(Icons.search,
                                        color: Colors.grey, size: 16),
                                    hintText: 'Search',
                                    onChanged: (String input) => context
                                        .read<ProductsBloc>()
                                        .add(SearchProduct(input)),
                                    constraints: BoxConstraints(
                                        maxHeight: appBarHeight * .33,
                                        maxWidth: appBarWidth * .3)),
                              ],
                            ),
                          ))*/
                  ),
                  primary: true,
                  leading: GoRouterState.of(context).path != HomePage.routeName
                      ? IconButton(
                          onPressed: () => context.pop(),
                          icon: const Icon(Icons.arrow_back_ios))
                      : IconButton(
                          onPressed: () => Scaffold.of(context).openDrawer(),
                          icon: const Icon(Icons.menu)),
                  title: const Text('DUMMY JSON'),
                  centerTitle: true,
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
  Size get preferredSize => Size(viewWidth, viewHeight * .1);
}
