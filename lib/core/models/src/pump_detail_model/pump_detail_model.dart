import 'package:freezed_annotation/freezed_annotation.dart';
part 'pump_detail_model.freezed.dart';
part 'pump_detail_model.g.dart';

@freezed
abstract class PumpDetailModel with _$PumpDetailModel {
  const factory PumpDetailModel({
    // Pump Technical Details
    String? phaseType,
    String? pumpId,
    String? pumpName,
    double? voltage,
    double? maxHead,
    double? hp,
    double? kw,
    int? lpm,
    int? outletSize,

    // Pump Status
    @Default(false) bool isOn,

    // Time Tracking
    DateTime? createdAt,
    DateTime? lastRunningTime,

    // ✅ USE DateTime (NOT TimeOfDay)
    DateTime? startTime,
    DateTime? endTime,

    // Total running in minutes
    @Default(0) int totalRunningMinutes,

    // Logs
    @Default([]) List<PumpLogModel> logs,
  }) = _PumpDetailModel;

  factory PumpDetailModel.fromJson(Map<String, dynamic> json) =>
      _$PumpDetailModelFromJson(json);
}

@freezed
abstract class PumpLogModel with _$PumpLogModel {
  const factory PumpLogModel({
    required String action,
    required DateTime time,
  }) = _PumpLogModel;
  factory PumpLogModel.fromJson(Map<String, dynamic> json) => _$PumpLogModelFromJson(json); }
