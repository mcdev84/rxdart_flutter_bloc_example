import 'package:rx_dart/domain/entities/product/product_entity.dart';

abstract class ProductsRepository {
  Future<List<ProductEntity>> getProducts();
  Future<List<ProductEntity>> searchProducts(String searchTerm);

}
