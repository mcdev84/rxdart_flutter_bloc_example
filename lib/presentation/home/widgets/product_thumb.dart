import 'package:flutter/material.dart';
import 'package:rx_dart/domain/entities/product/product_entity.dart';

class ProductThumb extends StatelessWidget {
  final ProductEntity product;

  const ProductThumb({required this.product, super.key});

  @override
  Widget build(BuildContext context) => Image.network(
        product.thumbnail,
        filterQuality: FilterQuality.high,
        fit: BoxFit.contain,
        cacheHeight: 100,
        cacheWidth: 100,
        semanticLabel: product.title,
      );
}
