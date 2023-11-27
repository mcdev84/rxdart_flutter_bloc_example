import 'package:dio/dio.dart';
import 'package:rx_dart/data/datasources/products/products_repository.dart';
import 'package:rx_dart/domain/entities/product/product_entity.dart';

class ProductsRepositoryImpl extends ProductsRepository {
  final Dio _dio;

  ProductsRepositoryImpl(this._dio);

  @override
  Future<List<ProductEntity>> getProducts() async =>
      await _dio.get('/products').then((value) {
        List<ProductEntity> tmp = <ProductEntity>[];
        for (Map<String, dynamic> product in value.data["products"]) {
          tmp.add(ProductEntity.fromJson(product));
        }
        return tmp;
      });

  @override
  Future<List<ProductEntity>> searchProducts(String searchTerm) async =>
      await _dio.get('/products/search?q=$searchTerm').then((value) {
        List<ProductEntity> tmp = <ProductEntity>[];
        for (Map<String, dynamic> product in value.data['products']) {
          tmp.add(ProductEntity.fromJson(product));
        }
        return tmp;
      });
}
