import 'package:freezed_annotation/freezed_annotation.dart';

part 'pump_detail_model.freezed.dart';
part 'pump_detail_model.g.dart';

@freezed
abstract class PumpDetailModel with _$PumpDetailModel {
  const factory PumpDetailModel({
    @JsonKey(name: '_id') String? id,

    String? serialNumber,
    String? pumpID,
    String? pumpName,
    String? location,

    int? phase,
    double? capacitykW,
    int? lph,
    double? headRangeMetres,
    int? outletSizeMM,
    int? supplyVoltage,

    String? capacityUnit,
    String? headUnit,
    String? outletUnit,

    String? currentStatus,
    String? customer,
    bool? isActive,

    int? lastSwitchedOnDuration,
    int? totalLifetimeDuration,

    DateTime? installationDate,
    DateTime? createdAt,
    DateTime? updatedAt,

    List<dynamic>? schedules,

    Map<String,dynamic>? displaySpecs,
  }) = _PumpDetailModel;

  factory PumpDetailModel.fromJson(Map<String, dynamic> json) =>
      _$PumpDetailModelFromJson(json);
}


