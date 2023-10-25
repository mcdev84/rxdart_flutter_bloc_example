import 'package:flutter/material.dart';
import 'package:rx_dart/domain/entities/product/product_entity.dart';
import 'package:rx_dart/presentation/home/widgets/product_info.dart';
import 'package:rx_dart/presentation/home/widgets/product_thumb.dart';

class ProductCard extends StatelessWidget {
  final ProductEntity product;

  const ProductCard({required this.product, super.key});

  @override
  Widget build(BuildContext context) => Card(
      child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12),
          child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
            ProductThumb(product: product),
            const SizedBox(width: 10),
            ProductInfos(product: product)
          ])));
}
