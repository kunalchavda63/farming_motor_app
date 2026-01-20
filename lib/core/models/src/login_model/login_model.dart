import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_model.freezed.dart';
part 'login_model.g.dart';

@freezed
abstract class LoginModel with _$LoginModel {
  const factory LoginModel({
    String? status,
    String? token,
    User? user,
  }) = _LoginModel;

  factory LoginModel.fromJson(Map<String, dynamic> json) =>
      _$LoginModelFromJson(json);
}

@freezed
abstract class User with _$User {
  const factory User({
    @JsonKey(name: '_id') String? id,   // ✅ _id → userId
    @JsonKey(name: 'userId') String? userId,   // ✅ _id → userId
    String? firstName,
    String? lastName,
    String? email,
    String? mobileNumber,
    String? address,
    @Default('customer') String role,
    String? password,
    @Default(false) bool isActive,
    String? createdAt,
    String? updatedAt,
    @JsonKey(name: '__v') int? v,            // ✅ __v → v
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) =>
      _$UserFromJson(json);
}