// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      username: json['username'] as String? ?? ' ',
      password: json['password'] as String? ?? ' ',
      email: json['email'] as String? ?? ' ',
      token: json['token'] as String? ?? ' ',
      type: json['type'] as String? ?? ' ',
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'username': instance.username,
      'email': instance.email,
      'password': instance.password,
      'token': instance.token,
      'type': instance.type,
    };
