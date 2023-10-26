import 'package:flutter/material.dart';
import 'package:rx_dart/constants/layout/layout.dart';
import 'package:rx_dart/domain/entities/product/product_entity.dart';
import 'package:rx_dart/presentation/widgets/products/widgets/product_card.dart';

class ProductList extends StatelessWidget {
  final List<ProductEntity> productList;

  const ProductList({required this.productList, super.key});

  @override
  Widget build(BuildContext context) => ListView(
          padding: EdgeInsets.symmetric(horizontal: viewWidth * .05),
          children: [
            ...productList.map((product) => ProductCard(product: product))
          ]);
}
