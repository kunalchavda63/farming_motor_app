import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_user_model.freezed.dart';
part 'create_user_model.g.dart';

@freezed
abstract class CreateUserModel with _$CreateUserModel {
  const factory CreateUserModel({
    required String firstName,

    required String lastName,

    required String email,

    required String mobileNumber,

    required String address,

    required String role,
  }) = _CreateUserModel;

  factory CreateUserModel.fromJson(Map<String, dynamic> json) =>
      _$CreateUserModelFromJson(json);
}
