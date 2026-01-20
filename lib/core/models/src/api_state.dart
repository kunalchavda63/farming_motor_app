
import 'package:farming_motor_app/core/utilities/utils.dart';

class ApiState<T> {

  const ApiState({
    this.initial = false,
    this.loading = false,
    this.status = false,

    this.data,
    this.error,
  });
  factory ApiState.loading() => const ApiState();
  factory ApiState.initial() => const ApiState();
  factory ApiState.status() => const ApiState();
  factory ApiState.success(T data) {
    logger.d('Data : $data');
    return ApiState(data: data);
  }
  factory ApiState.error(String message) {
    logger.e('Error : $message');
    return ApiState(error: message);
  }
  final bool loading;
  final bool initial;
  final T? data;
  final String? error;
  final bool? status;
}