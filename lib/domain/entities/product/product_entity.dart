import 'package:json_annotation/json_annotation.dart';

part 'product_entity.g.dart';

@JsonSerializable()
class ProductEntity {
  final int id, stock;

  final double price, discountPercentage, rating;
  final String title, description, brand, category, thumbnail;
  final List<String> images;

  const ProductEntity(
      {required this.id,
      required this.title,
      required this.brand,
      required this.category,
      required this.description,
      required this.discountPercentage,
      required this.images,
      required this.price,
      required this.rating,
      required this.stock,
      required this.thumbnail});

  factory ProductEntity.fromJson(Map<String, dynamic> json) =>
      _$ProductEntityFromJson(json);

  Map<String, dynamic> toJson() => _$ProductEntityToJson(this);
}
