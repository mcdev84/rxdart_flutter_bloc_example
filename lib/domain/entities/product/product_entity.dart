import 'package:json_annotation/json_annotation.dart';

part 'product_entity.g.dart';

@JsonSerializable()
class ProductEntity {
  final int? id, stock;

  final double? price, discountPercentage, rating;
  final String? title, description, brand, category, thumbnail;
  final List<String>? images;

  const ProductEntity(
      { this.id,
       this.title,
       this.brand,
       this.category,
       this.description,
       this.discountPercentage,
       this.images,
       this.price,
       this.rating,
       this.stock,
       this.thumbnail});

  factory ProductEntity.fromJson(Map<String, dynamic> json) =>
      _$ProductEntityFromJson(json);

  Map<String, dynamic> toJson() => _$ProductEntityToJson(this);
}
