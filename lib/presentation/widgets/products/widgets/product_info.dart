import 'package:flutter/material.dart';
import 'package:rx_dart/domain/entities/fake_store/fake_store.dart';
import 'package:rx_dart/domain/entities/product/product_entity.dart';

List<Widget> productInfos({required ProductEntity product}) => <Widget>[
      Text(product.title!,style:const TextStyle(overflow:TextOverflow.ellipsis )),
      Text('PRICE: ${product.price} €'),

    ];
