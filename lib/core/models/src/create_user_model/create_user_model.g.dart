// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CreateUserModel _$CreateUserModelFromJson(Map<String, dynamic> json) =>
    _CreateUserModel(
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      email: json['email'] as String,
      mobileNumber: json['mobileNumber'] as String,
      address: json['address'] as String,
      role: json['role'] as String,
    );

Map<String, dynamic> _$CreateUserModelToJson(_CreateUserModel instance) =>
    <String, dynamic>{
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'email': instance.email,
      'mobileNumber': instance.mobileNumber,
      'address': instance.address,
      'role': instance.role,
    };
