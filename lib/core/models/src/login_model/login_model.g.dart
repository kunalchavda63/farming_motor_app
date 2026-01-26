// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LoginModel _$LoginModelFromJson(Map<String, dynamic> json) => _LoginModel(
  status: json['status'] as String?,
  token: json['token'] as String?,
  user: json['user'] == null
      ? null
      : UserModel.fromJson(json['user'] as Map<String, dynamic>),
);

Map<String, dynamic> _$LoginModelToJson(_LoginModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'token': instance.token,
      'user': instance.user,
    };
