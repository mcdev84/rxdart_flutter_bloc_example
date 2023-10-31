import 'package:flutter/material.dart';
import 'package:rx_dart/constants/layout/styles.dart';
import 'package:rx_dart/constants/theme/color/colors.dart';
import 'package:rx_dart/domain/entities/product/product_entity.dart';
import 'package:rx_dart/presentation/widgets/appbar/widgets/waved_container.dart';
import 'package:rx_dart/presentation/widgets/products/widgets/product_info.dart';
import 'package:rx_dart/presentation/widgets/products/widgets/product_thumb.dart';

class ProductCard extends StatelessWidget {
  final ProductEntity product;

  const ProductCard({required this.product, super.key});

  @override
  Widget build(BuildContext context) => Card(color: happyBrown,
    elevation: 0,
    shape: cardRoundedBorder8,
    child: Container(
      padding: const EdgeInsets.only(left: 8, top: 8),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ProductThumb(product: product),
            ...productInfos(product: product)
          ]),
    ),
  );
}
