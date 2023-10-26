import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:rx_dart/presentation/widgets/appbar/appbar.dart';
import 'package:rx_dart/presentation/widgets/products/products_bloc.dart';

class PageTemplate extends StatelessWidget {
  final Widget child;

  const PageTemplate({required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
        key: scaffoldKey,
        drawer: const NavigationDrawer(children: [Text('DRAWER')]),
        body: BlocProvider(
            create: (_) =>
                GetIt.instance.get<ProductsBloc>()..add(ProductsFetched()),
            child: CustomScrollView(slivers: [const ApplicationBar(), child])));
  }
}
