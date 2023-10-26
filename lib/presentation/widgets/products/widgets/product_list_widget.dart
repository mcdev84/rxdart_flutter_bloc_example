import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rx_dart/constants/layout/layout.dart';
import 'package:rx_dart/presentation/widgets/products/products_bloc.dart';
import 'package:rx_dart/presentation/widgets/products/widgets/product_list.dart';
import 'package:rxdart/rxdart.dart';

class ProductListWidget extends StatelessWidget {
  const ProductListWidget({super.key});

  @override
  Widget build(BuildContext context) =>
      BlocConsumer<ProductsBloc, ProductsState>(
          listener: (context, state) {},
          builder: (context, state) => SliverList(
              delegate: SliverChildBuilderDelegate((context, index) =>
                  StreamBuilder(
                      stream: context
                          .read<ProductsBloc>()
                          .productsSubject
                          .distinct()
                          .debounceTime(const Duration(milliseconds: 250)),
                      builder: (context, snapshot) {
                        Widget _widget = const CircularProgressIndicator();
                        if (snapshot.connectionState ==
                                ConnectionState.active &&
                            state.status == ProductsStatus.loaded) {
                          _widget = Column(
                            children: [
                              SearchBar(
                                  onChanged: (String input) => context
                                      .read<ProductsBloc>()
                                      .add(SearchProduct(input)),
                                  constraints: BoxConstraints(
                                      minHeight: 40,
                                      minWidth: viewWidth * .9,
                                      maxHeight: 40,
                                      maxWidth: viewWidth * .9)),
                              SizedBox(
                                  width: viewWidth * .9,
                                  child: ProductList(
                                      productList: snapshot.requireData)),
                            ],
                          );
                        }
                        return _widget;
                      }))));
}
