import 'package:freezed_annotation/freezed_annotation.dart';

part 'customer_detail_model.freezed.dart';
part 'customer_detail_model.g.dart';

@freezed
abstract class CustomerDetailModel with _$CustomerDetailModel {
  const factory CustomerDetailModel({
    required String customer_name,

    required String phone,

    required String country_code,

    required String gender,

    required String dob,

    String? gstIn,

    String? notes,

    String? fullAddress,

    bool? isShippingSame,
  }) = _CustomerDetailModel;

  factory CustomerDetailModel.fromJson(Map<String, dynamic> json) =>
      _$CustomerDetailModelFromJson(json);
}
