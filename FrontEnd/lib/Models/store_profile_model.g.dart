// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store_profile_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StoreProfileModel _$StoreProfileModelFromJson(Map<String, dynamic> json) =>
    StoreProfileModel(
      place: json['place'] as String? ?? ' ',
      phone: json['phone'] as String? ?? ' ',
    );

Map<String, dynamic> _$StoreProfileModelToJson(StoreProfileModel instance) =>
    <String, dynamic>{
      'place': instance.place,
      'phone': instance.phone,
    };
