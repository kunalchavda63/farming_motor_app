import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_model.freezed.dart';
part 'login_model.g.dart';

@freezed
abstract class LoginModel with _$LoginModel {
  const factory LoginModel({
    @Default('') String status,
    @Default('') String token,
    required User user,
  }) = _LoginModel;

  factory LoginModel.fromJson(Map<String, dynamic> json) =>
      _$LoginModelFromJson(json);
}

@freezed
abstract class User with _$User {
  const factory User({
    String? userId,
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
    String? v, // Changed from __v to v for safe JSON parsing
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) =>
      _$UserFromJson(json);
}
