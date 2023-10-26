import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:rx_dart/presentation/widgets/products/products_bloc.dart';
import 'package:rx_dart/presentation/widgets/products/widgets/product_list_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static const routeName = '/';
  static const name = 'home';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) =>
            GetIt.instance.get<ProductsBloc>()..add(ProductsFetched()),
        child: Builder(builder: (context) => const ProductListWidget()));
  }
}
