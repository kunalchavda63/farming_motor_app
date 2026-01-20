// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pump_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PumpDetailModel _$PumpDetailModelFromJson(Map<String, dynamic> json) =>
    _PumpDetailModel(
      serialNumber: json['serialNumber'] as String?,
      pumpName: json['pumpName'] as String?,
      customer: json['customer'] as String?,
      capacity: (json['capacity'] as num?)?.toInt(),
      capacityUnit: json['capacityUnit'] as String?,
      headRange: (json['headRange'] as num?)?.toInt(),
      headUnit: json['headUnit'] as String?,
      outletSize: (json['outletSize'] as num?)?.toInt(),
      outletUnit: json['outletUnit'] as String?,
      phaseType: (json['phaseType'] as num?)?.toInt(),
      supplyVoltage: (json['supplyVoltage'] as num?)?.toInt(),
      lph: (json['lph'] as num?)?.toInt(),
      location: json['location'] as String?,
    );

Map<String, dynamic> _$PumpDetailModelToJson(_PumpDetailModel instance) =>
    <String, dynamic>{
      'serialNumber': instance.serialNumber,
      'pumpName': instance.pumpName,
      'customer': instance.customer,
      'capacity': instance.capacity,
      'capacityUnit': instance.capacityUnit,
      'headRange': instance.headRange,
      'headUnit': instance.headUnit,
      'outletSize': instance.outletSize,
      'outletUnit': instance.outletUnit,
      'phaseType': instance.phaseType,
      'supplyVoltage': instance.supplyVoltage,
      'lph': instance.lph,
      'location': instance.location,
    };
