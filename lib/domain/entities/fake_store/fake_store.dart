import 'package:json_annotation/json_annotation.dart';

part 'fake_store.g.dart';

@JsonSerializable()
class FakeStoreProduct {
  final int id;
  final String title, category, description, image;
  final double price;

  FakeStoreProduct(
      {required this.id,
      required this.title,
      required this.price,
      required this.category,
      required this.description,
      required this.image});

  factory FakeStoreProduct.fromJson(Map<String, dynamic> json) =>
      _$FakeStoreProductFromJson(json);

  Map<String, dynamic> toJson() => _$FakeStoreProductToJson(this);
}
