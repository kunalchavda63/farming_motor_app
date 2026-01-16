// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CustomerDetailModel _$CustomerDetailModelFromJson(Map<String, dynamic> json) =>
    _CustomerDetailModel(
      customer_name: json['customer_name'] as String,
      phone: json['phone'] as String,
      country_code: json['country_code'] as String,
      gender: json['gender'] as String,
      dob: json['dob'] as String,
      gstIn: json['gstIn'] as String?,
      notes: json['notes'] as String?,
      fullAddress: json['fullAddress'] as String?,
      isShippingSame: json['isShippingSame'] as bool?,
    );

Map<String, dynamic> _$CustomerDetailModelToJson(
  _CustomerDetailModel instance,
) => <String, dynamic>{
  'customer_name': instance.customer_name,
  'phone': instance.phone,
  'country_code': instance.country_code,
  'gender': instance.gender,
  'dob': instance.dob,
  'gstIn': instance.gstIn,
  'notes': instance.notes,
  'fullAddress': instance.fullAddress,
  'isShippingSame': instance.isShippingSame,
};
