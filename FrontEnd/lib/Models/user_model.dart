import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  String userName;
  String email;
  String password;
  String jwt;
  String type;
  UserModel(
      {required this.userName,
      required this.password,
      required this.email,
      required this.jwt,
      required this.type});

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
