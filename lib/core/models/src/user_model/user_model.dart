import 'package:farming_motor_app/core/models/src/pump_detail_model/pump_detail_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';


@freezed
abstract class UserModel with _$UserModel {
  const factory UserModel({
    @JsonKey(name: '_id') String? id,   // ✅ _id → userId
    String? userId,   // ✅ _id → userId
    String? firstName,
    String? lastName,
    String? name,
    String? email,
    String? mobileNumber,
    String? address,
    @Default('customer') String role,
    String? password,
    @Default(false) bool isActive,
    String? createdAt,
    String? updatedAt,
    @JsonKey(name: '__v') int? v,
    List<PumpDetailModel>? pumps,
    int? totalPumps
    // ✅ __v → v
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}