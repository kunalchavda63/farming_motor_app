
import 'package:freezed_annotation/freezed_annotation.dart';

part 'pump_log_model.freezed.dart';
part 'pump_log_model.g.dart';

@freezed
abstract class PumpLogModel with _$PumpLogModel {
  const factory PumpLogModel({
    @JsonKey(name: '_id') String? id,
    String? serialNumber,

    int? pumpNumber,     // ✅ FIX
    String? action,
    int? duration,       // ✅ FIX

    DateTime? timestamp,
    String? userId,

    @JsonKey(name: '__v') int? version, // ✅ FIX
  }) = _PumpLogModel;

  factory PumpLogModel.fromJson(Map<String, dynamic> json) =>
      _$PumpLogModelFromJson(json);
}
