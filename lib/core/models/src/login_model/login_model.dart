import 'package:farming_motor_app/core/models/src/user_model/user_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_model.freezed.dart';
part 'login_model.g.dart';

@freezed
abstract class LoginModel with _$LoginModel {
  const factory LoginModel({
    String? status,
    String? token,
    UserModel? user,
  }) = _LoginModel;

  factory LoginModel.fromJson(Map<String, dynamic> json) =>
      _$LoginModelFromJson(json);
}

