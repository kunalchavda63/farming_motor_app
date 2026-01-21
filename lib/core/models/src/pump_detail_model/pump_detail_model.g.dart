// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pump_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PumpDetailModel _$PumpDetailModelFromJson(Map<String, dynamic> json) =>
    _PumpDetailModel(
      id: json['_id'] as String?,
      serialNumber: json['serialNumber'] as String?,
      pumpID: json['pumpID'] as String?,
      pumpName: json['pumpName'] as String?,
      location: json['location'] as String?,
      phase: (json['phase'] as num?)?.toInt(),
      capacitykW: (json['capacitykW'] as num?)?.toDouble(),
      lph: (json['lph'] as num?)?.toInt(),
      headRangeMetres: (json['headRangeMetres'] as num?)?.toDouble(),
      outletSizeMM: (json['outletSizeMM'] as num?)?.toInt(),
      supplyVoltage: (json['supplyVoltage'] as num?)?.toInt(),
      capacityUnit: json['capacityUnit'] as String?,
      headUnit: json['headUnit'] as String?,
      outletUnit: json['outletUnit'] as String?,
      currentStatus: json['currentStatus'] as String?,
      customer: json['customer'] as String?,
      isActive: json['isActive'] as bool?,
      lastSwitchedOnDuration: (json['lastSwitchedOnDuration'] as num?)?.toInt(),
      totalLifetimeDuration: (json['totalLifetimeDuration'] as num?)?.toInt(),
      installationDate: json['installationDate'] == null
          ? null
          : DateTime.parse(json['installationDate'] as String),
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      schedules: json['schedules'] as List<dynamic>?,
      displaySpecs: json['displaySpecs'] == null
          ? null
          : DisplaySpecsModel.fromJson(
              json['displaySpecs'] as Map<String, dynamic>,
            ),
    );

Map<String, dynamic> _$PumpDetailModelToJson(_PumpDetailModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'serialNumber': instance.serialNumber,
      'pumpID': instance.pumpID,
      'pumpName': instance.pumpName,
      'location': instance.location,
      'phase': instance.phase,
      'capacitykW': instance.capacitykW,
      'lph': instance.lph,
      'headRangeMetres': instance.headRangeMetres,
      'outletSizeMM': instance.outletSizeMM,
      'supplyVoltage': instance.supplyVoltage,
      'capacityUnit': instance.capacityUnit,
      'headUnit': instance.headUnit,
      'outletUnit': instance.outletUnit,
      'currentStatus': instance.currentStatus,
      'customer': instance.customer,
      'isActive': instance.isActive,
      'lastSwitchedOnDuration': instance.lastSwitchedOnDuration,
      'totalLifetimeDuration': instance.totalLifetimeDuration,
      'installationDate': instance.installationDate?.toIso8601String(),
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'schedules': instance.schedules,
      'displaySpecs': instance.displaySpecs,
    };

_DisplaySpecsModel _$DisplaySpecsModelFromJson(Map<String, dynamic> json) =>
    _DisplaySpecsModel(
      capacity: json['capacity'] as String?,
      capacityUnit: json['capacityUnit'] as String?,
      headRange: json['headRange'] as String?,
      headUnit: json['headUnit'] as String?,
      outletSize: (json['outletSize'] as num?)?.toInt(),
      outletUnit: json['outletUnit'] as String?,
    );

Map<String, dynamic> _$DisplaySpecsModelToJson(_DisplaySpecsModel instance) =>
    <String, dynamic>{
      'capacity': instance.capacity,
      'capacityUnit': instance.capacityUnit,
      'headRange': instance.headRange,
      'headUnit': instance.headUnit,
      'outletSize': instance.outletSize,
      'outletUnit': instance.outletUnit,
    };
