/*
import 'dart:isolate';

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:rx_dart/domain/entities/product/product_entity.dart';

// Isolates with run function
Future<List<ProductEntity>> downloadUsingRunMethod() async {
  final productList = await Isolate.run(getProducts);
  return productList;
}

Future<List<ProductEntity>> getProducts() async =>
    await GetIt.instance.get<Dio>().get('/products').then((value) {
      List<ProductEntity> tmp = <ProductEntity>[];
      for (Map<String, dynamic> product in value.data["products"]) {
        tmp.add(ProductEntity.fromJson(product));
      }
      return tmp;
    });
*/
