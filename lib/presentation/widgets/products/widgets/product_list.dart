import 'package:flutter/material.dart';
import 'package:rx_dart/domain/entities/product/product_entity.dart';
import 'package:rx_dart/presentation/widgets/products/widgets/product_card.dart';

class ProductList extends StatelessWidget {
  final List<ProductEntity> productList;

  const ProductList({required this.productList, super.key});

  @override
  Widget build(BuildContext context) => SliverGrid(
      key: const Key('product list'),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, crossAxisSpacing: 8, mainAxisSpacing: 8),
      delegate: SliverChildBuilderDelegate(
          addRepaintBoundaries: true,
          addAutomaticKeepAlives: true,
          addSemanticIndexes: true,
          childCount: productList.length,
          (context, index) => ProductCard(product: productList[index])));
}
