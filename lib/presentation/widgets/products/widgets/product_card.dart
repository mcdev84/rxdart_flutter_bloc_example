import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rx_dart/constants/layout/styles.dart';
import 'package:rx_dart/domain/entities/product/product_entity.dart';
import 'package:rx_dart/presentation/widgets/products/widgets/product_info.dart';
import 'package:rx_dart/presentation/widgets/products/widgets/product_thumb.dart';

class ProductCard extends StatelessWidget {
  final ProductEntity product;

  const ProductCard({required this.product, super.key});

  @override
  Widget build(BuildContext context) => InkWell(
        onTap: () => context.go('/product', extra: product),
        child: Card(
            elevation: 6,
            shape: cardRoundedBorder8,
            child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ProductThumb(product: product),
                      ...productInfos(product: product)
                    ]))),
      );
}
