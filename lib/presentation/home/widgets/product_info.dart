import 'package:flutter/material.dart';
import 'package:rx_dart/domain/entities/product/product_entity.dart';

class ProductInfos extends StatelessWidget {
  final ProductEntity product;

  const ProductInfos({required this.product, super.key});

  @override
  Widget build(BuildContext context) =>
      Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(product.title, softWrap: true),
        Text('CATEGORY: ${product.category.toUpperCase()}'),
        Text('PRICE: ${product.price.toStringAsFixed(2)} €'),
        Text('SAVE: ${product.discountPercentage.toStringAsFixed(0)}%')
      ]);
}
