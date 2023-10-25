import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:rx_dart/presentation/home/products_bloc.dart';
import 'package:rx_dart/presentation/home/widgets/product_list_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('DUMMY JSON'), centerTitle: true),
      body: BlocProvider(
          create: (_) =>
              GetIt.instance.get<ProductsBloc>()..add(ProductsFetched()),
          child: Builder(builder: (context) => const ProductListWidget())),
    );
  }
}
