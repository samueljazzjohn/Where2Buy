import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  String username;
  String email;
  String password;
  String token;
  String type;
  UserModel(
      {required this.username,
      required this.password,
      required this.email,
      required this.token,
      required this.type});

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
