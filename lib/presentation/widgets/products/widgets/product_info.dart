import 'package:flutter/material.dart';
import 'package:rx_dart/domain/entities/product/product_entity.dart';

List<Widget> productInfos({required ProductEntity product}) => <Widget>[
      Text(product.title),
      Text('PRICE: ${product.price.toStringAsFixed(2)} €'),
      Text('SAVE: ${product.discountPercentage.toStringAsFixed(0)}%',
          overflow: TextOverflow.fade)
    ];
