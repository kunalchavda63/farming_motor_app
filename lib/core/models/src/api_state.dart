
class ApiState<T> {

  const ApiState({
    this.initial = false,
    this.loading = false,
    this.data,
    this.error,
  });
  factory ApiState.loading() => const ApiState();
  factory ApiState.initial() => const ApiState(initial: true);
  factory ApiState.success(T data) => ApiState(data: data);
  factory ApiState.error(String message) => ApiState(error: message);
  final bool loading;
  final bool initial;
  final T? data;
  final String? error;
}