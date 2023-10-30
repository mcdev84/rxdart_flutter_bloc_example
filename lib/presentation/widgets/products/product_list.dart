import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rx_dart/blocs/products/products_bloc.dart';
import 'package:rx_dart/constants/layout/layout.dart';
import 'package:rx_dart/presentation/widgets/products/widgets/product_list.dart';
import 'package:rxdart/rxdart.dart';

class ProductListWidget extends StatelessWidget {
  const ProductListWidget({super.key});

  @override
  Widget build(BuildContext context) =>
      BlocConsumer<ProductsBloc, ProductsState>(
          listener: (context, state) {},
          builder: (context, state) => StreamBuilder(
              stream: context
                  .read<ProductsBloc>()
                  .productsSubject
                  .distinct()
                  .debounceTime(const Duration(milliseconds: 250)),
              builder: (context, snapshot) {
                Widget _widget = SliverToBoxAdapter(
                    child: SizedBox(
                  height: viewHeight - appBarHeightExpanded,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircularProgressIndicator(
                        color: Colors.white,
                      ),
                    ],
                  ),
                ));
                if (snapshot.connectionState == ConnectionState.active &&
                    state.status == ProductsStatus.loaded) {
                  _widget = ProductList(productList: snapshot.requireData);
                }

                return _widget;
              }));
}
