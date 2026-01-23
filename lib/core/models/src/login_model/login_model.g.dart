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
      : User.fromJson(json['user'] as Map<String, dynamic>),
);

Map<String, dynamic> _$LoginModelToJson(_LoginModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'token': instance.token,
      'user': instance.user,
    };

_User _$UserFromJson(Map<String, dynamic> json) => _User(
  id: json['_id'] as String?,
  userId: json['userId'] as String?,
  firstName: json['firstName'] as String?,
  lastName: json['lastName'] as String?,
  name: json['name'] as String?,
  email: json['email'] as String?,
  mobileNumber: json['mobileNumber'] as String?,
  address: json['address'] as String?,
  role: json['role'] as String? ?? 'customer',
  password: json['password'] as String?,
  isActive: json['isActive'] as bool? ?? false,
  createdAt: json['createdAt'] as String?,
  updatedAt: json['updatedAt'] as String?,
  v: (json['__v'] as num?)?.toInt(),
);

Map<String, dynamic> _$UserToJson(_User instance) => <String, dynamic>{
  '_id': instance.id,
  'userId': instance.userId,
  'firstName': instance.firstName,
  'lastName': instance.lastName,
  'name': instance.name,
  'email': instance.email,
  'mobileNumber': instance.mobileNumber,
  'address': instance.address,
  'role': instance.role,
  'password': instance.password,
  'isActive': instance.isActive,
  'createdAt': instance.createdAt,
  'updatedAt': instance.updatedAt,
  '__v': instance.v,
};
