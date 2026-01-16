// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pump_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PumpDetailModel _$PumpDetailModelFromJson(Map<String, dynamic> json) =>
    _PumpDetailModel(
      phaseType: json['phaseType'] as String?,
      pumpId: json['pumpId'] as String?,
      pumpName: json['pumpName'] as String?,
      voltage: (json['voltage'] as num?)?.toDouble(),
      maxHead: (json['maxHead'] as num?)?.toDouble(),
      hp: (json['hp'] as num?)?.toDouble(),
      kw: (json['kw'] as num?)?.toDouble(),
      lpm: (json['lpm'] as num?)?.toInt(),
      outletSize: (json['outletSize'] as num?)?.toInt(),
      isOn: json['isOn'] as bool? ?? false,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      lastRunningTime: json['lastRunningTime'] == null
          ? null
          : DateTime.parse(json['lastRunningTime'] as String),
      startTime: json['startTime'] == null
          ? null
          : DateTime.parse(json['startTime'] as String),
      endTime: json['endTime'] == null
          ? null
          : DateTime.parse(json['endTime'] as String),
      totalRunningMinutes: (json['totalRunningMinutes'] as num?)?.toInt() ?? 0,
      logs:
          (json['logs'] as List<dynamic>?)
              ?.map((e) => PumpLogModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$PumpDetailModelToJson(_PumpDetailModel instance) =>
    <String, dynamic>{
      'phaseType': instance.phaseType,
      'pumpId': instance.pumpId,
      'pumpName': instance.pumpName,
      'voltage': instance.voltage,
      'maxHead': instance.maxHead,
      'hp': instance.hp,
      'kw': instance.kw,
      'lpm': instance.lpm,
      'outletSize': instance.outletSize,
      'isOn': instance.isOn,
      'createdAt': instance.createdAt?.toIso8601String(),
      'lastRunningTime': instance.lastRunningTime?.toIso8601String(),
      'startTime': instance.startTime?.toIso8601String(),
      'endTime': instance.endTime?.toIso8601String(),
      'totalRunningMinutes': instance.totalRunningMinutes,
      'logs': instance.logs,
    };

_PumpLogModel _$PumpLogModelFromJson(Map<String, dynamic> json) =>
    _PumpLogModel(
      action: json['action'] as String,
      time: DateTime.parse(json['time'] as String),
    );

Map<String, dynamic> _$PumpLogModelToJson(_PumpLogModel instance) =>
    <String, dynamic>{
      'action': instance.action,
      'time': instance.time.toIso8601String(),
    };
