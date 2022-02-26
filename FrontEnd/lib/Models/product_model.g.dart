// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductModel _$ProductModelFromJson(Map<String, dynamic> json) => ProductModel(
      id: json['_id'] as String? ?? '',
      pname: json['pname'] as String? ?? '',
      qty: json['qty'] as int,
      price: json['price'] as int,
      Image: json['Image'] as String? ?? '',
    );

Map<String, dynamic> _$ProductModelToJson(ProductModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'pname': instance.pname,
      'qty': instance.qty,
      'price': instance.price,
      'Image': instance.Image,
    };
