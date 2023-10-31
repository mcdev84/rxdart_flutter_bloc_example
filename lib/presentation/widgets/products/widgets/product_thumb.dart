import 'package:flutter/material.dart';
import 'package:rx_dart/constants/layout/sizes.dart';
import 'package:rx_dart/constants/layout/styles.dart';
import 'package:rx_dart/domain/entities/product/product_entity.dart';

class ProductThumb extends StatelessWidget {
  final ProductEntity product;

  const ProductThumb({required this.product, super.key});

  @override
  Widget build(BuildContext context) => ClipRRect(
        borderRadius: borderRadius8,
        child: Image.network(product.thumbnail,
            filterQuality: FilterQuality.high,
            height: thumbSize.height,
            width: thumbSize.width,
            cacheHeight: (viewSize.height * .15).toInt(),
            cacheWidth: (viewSize.width * .4).toInt(),
            semanticLabel: product.title),
      );
}
