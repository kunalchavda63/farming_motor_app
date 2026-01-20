import 'package:freezed_annotation/freezed_annotation.dart';
part 'pump_detail_model.freezed.dart';
part 'pump_detail_model.g.dart';

@freezed
abstract class PumpDetailModel with _$PumpDetailModel {
  const factory PumpDetailModel({
    // Pump Technical Details
    String? serialNumber,
    String? pumpName,
    String? customer,
    int? capacity,
    String? capacityUnit,
    int? headRange,
    String? headUnit,
    int? outletSize,
    String? outletUnit,
    int? phaseType,
    int? supplyVoltage,
    int? lph,
    String? location,


  }) = _PumpDetailModel;

  factory PumpDetailModel.fromJson(Map<String, dynamic> json) =>
      _$PumpDetailModelFromJson(json);
}
//
// @freezed
// abstract class PumpLogModel with _$PumpLogModel {
//   const factory PumpLogModel({
//     required String action,
//     required DateTime time,
//   }) = _PumpLogModel;
//   factory PumpLogModel.fromJson(Map<String, dynamic> json) => _$PumpLogModelFromJson(json); }
