import 'package:json_annotation/json_annotation.dart';

part 'store_profile_model.g.dart';

@JsonSerializable()
class StoreProfileModel {
  String place;
  String phone;
  StoreProfileModel({required this.place, required this.phone});

  factory StoreProfileModel.fromJson(Map<String, dynamic> json) =>
      _$StoreProfileModelFromJson(json);

  Map<String, dynamic> toJson() => _$StoreProfileModelToJson(this);
}
