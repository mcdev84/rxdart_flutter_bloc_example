// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fake_store.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FakeStoreProduct _$FakeStoreProductFromJson(Map<String, dynamic> json) =>
    FakeStoreProduct(
      id: json['id'] as int,
      title: json['title'] as String,
      price: (json['price'] as num).toDouble(),
      category: json['category'] as String,
      description: json['description'] as String,
      image: json['image'] as String,
    );

Map<String, dynamic> _$FakeStoreProductToJson(FakeStoreProduct instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'category': instance.category,
      'description': instance.description,
      'image': instance.image,
      'price': instance.price,
    };
