// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pump_detail_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PumpDetailModel {

// Pump Technical Details
 String? get phaseType; String? get pumpId; String? get pumpName; double? get voltage; double? get maxHead; double? get hp; double? get kw; int? get lpm; int? get outletSize;// Pump Status
 bool get isOn;// Time Tracking
 DateTime? get createdAt; DateTime? get lastRunningTime;// ✅ USE DateTime (NOT TimeOfDay)
 DateTime? get startTime; DateTime? get endTime;// Total running in minutes
 int get totalRunningMinutes;// Logs
 List<PumpLogModel> get logs;
/// Create a copy of PumpDetailModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PumpDetailModelCopyWith<PumpDetailModel> get copyWith => _$PumpDetailModelCopyWithImpl<PumpDetailModel>(this as PumpDetailModel, _$identity);

  /// Serializes this PumpDetailModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PumpDetailModel&&(identical(other.phaseType, phaseType) || other.phaseType == phaseType)&&(identical(other.pumpId, pumpId) || other.pumpId == pumpId)&&(identical(other.pumpName, pumpName) || other.pumpName == pumpName)&&(identical(other.voltage, voltage) || other.voltage == voltage)&&(identical(other.maxHead, maxHead) || other.maxHead == maxHead)&&(identical(other.hp, hp) || other.hp == hp)&&(identical(other.kw, kw) || other.kw == kw)&&(identical(other.lpm, lpm) || other.lpm == lpm)&&(identical(other.outletSize, outletSize) || other.outletSize == outletSize)&&(identical(other.isOn, isOn) || other.isOn == isOn)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.lastRunningTime, lastRunningTime) || other.lastRunningTime == lastRunningTime)&&(identical(other.startTime, startTime) || other.startTime == startTime)&&(identical(other.endTime, endTime) || other.endTime == endTime)&&(identical(other.totalRunningMinutes, totalRunningMinutes) || other.totalRunningMinutes == totalRunningMinutes)&&const DeepCollectionEquality().equals(other.logs, logs));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,phaseType,pumpId,pumpName,voltage,maxHead,hp,kw,lpm,outletSize,isOn,createdAt,lastRunningTime,startTime,endTime,totalRunningMinutes,const DeepCollectionEquality().hash(logs));

@override
String toString() {
  return 'PumpDetailModel(phaseType: $phaseType, pumpId: $pumpId, pumpName: $pumpName, voltage: $voltage, maxHead: $maxHead, hp: $hp, kw: $kw, lpm: $lpm, outletSize: $outletSize, isOn: $isOn, createdAt: $createdAt, lastRunningTime: $lastRunningTime, startTime: $startTime, endTime: $endTime, totalRunningMinutes: $totalRunningMinutes, logs: $logs)';
}


}

/// @nodoc
abstract mixin class $PumpDetailModelCopyWith<$Res>  {
  factory $PumpDetailModelCopyWith(PumpDetailModel value, $Res Function(PumpDetailModel) _then) = _$PumpDetailModelCopyWithImpl;
@useResult
$Res call({
 String? phaseType, String? pumpId, String? pumpName, double? voltage, double? maxHead, double? hp, double? kw, int? lpm, int? outletSize, bool isOn, DateTime? createdAt, DateTime? lastRunningTime, DateTime? startTime, DateTime? endTime, int totalRunningMinutes, List<PumpLogModel> logs
});




}
/// @nodoc
class _$PumpDetailModelCopyWithImpl<$Res>
    implements $PumpDetailModelCopyWith<$Res> {
  _$PumpDetailModelCopyWithImpl(this._self, this._then);

  final PumpDetailModel _self;
  final $Res Function(PumpDetailModel) _then;

/// Create a copy of PumpDetailModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? phaseType = freezed,Object? pumpId = freezed,Object? pumpName = freezed,Object? voltage = freezed,Object? maxHead = freezed,Object? hp = freezed,Object? kw = freezed,Object? lpm = freezed,Object? outletSize = freezed,Object? isOn = null,Object? createdAt = freezed,Object? lastRunningTime = freezed,Object? startTime = freezed,Object? endTime = freezed,Object? totalRunningMinutes = null,Object? logs = null,}) {
  return _then(_self.copyWith(
phaseType: freezed == phaseType ? _self.phaseType : phaseType // ignore: cast_nullable_to_non_nullable
as String?,pumpId: freezed == pumpId ? _self.pumpId : pumpId // ignore: cast_nullable_to_non_nullable
as String?,pumpName: freezed == pumpName ? _self.pumpName : pumpName // ignore: cast_nullable_to_non_nullable
as String?,voltage: freezed == voltage ? _self.voltage : voltage // ignore: cast_nullable_to_non_nullable
as double?,maxHead: freezed == maxHead ? _self.maxHead : maxHead // ignore: cast_nullable_to_non_nullable
as double?,hp: freezed == hp ? _self.hp : hp // ignore: cast_nullable_to_non_nullable
as double?,kw: freezed == kw ? _self.kw : kw // ignore: cast_nullable_to_non_nullable
as double?,lpm: freezed == lpm ? _self.lpm : lpm // ignore: cast_nullable_to_non_nullable
as int?,outletSize: freezed == outletSize ? _self.outletSize : outletSize // ignore: cast_nullable_to_non_nullable
as int?,isOn: null == isOn ? _self.isOn : isOn // ignore: cast_nullable_to_non_nullable
as bool,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,lastRunningTime: freezed == lastRunningTime ? _self.lastRunningTime : lastRunningTime // ignore: cast_nullable_to_non_nullable
as DateTime?,startTime: freezed == startTime ? _self.startTime : startTime // ignore: cast_nullable_to_non_nullable
as DateTime?,endTime: freezed == endTime ? _self.endTime : endTime // ignore: cast_nullable_to_non_nullable
as DateTime?,totalRunningMinutes: null == totalRunningMinutes ? _self.totalRunningMinutes : totalRunningMinutes // ignore: cast_nullable_to_non_nullable
as int,logs: null == logs ? _self.logs : logs // ignore: cast_nullable_to_non_nullable
as List<PumpLogModel>,
  ));
}

}


/// Adds pattern-matching-related methods to [PumpDetailModel].
extension PumpDetailModelPatterns on PumpDetailModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PumpDetailModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PumpDetailModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PumpDetailModel value)  $default,){
final _that = this;
switch (_that) {
case _PumpDetailModel():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PumpDetailModel value)?  $default,){
final _that = this;
switch (_that) {
case _PumpDetailModel() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? phaseType,  String? pumpId,  String? pumpName,  double? voltage,  double? maxHead,  double? hp,  double? kw,  int? lpm,  int? outletSize,  bool isOn,  DateTime? createdAt,  DateTime? lastRunningTime,  DateTime? startTime,  DateTime? endTime,  int totalRunningMinutes,  List<PumpLogModel> logs)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PumpDetailModel() when $default != null:
return $default(_that.phaseType,_that.pumpId,_that.pumpName,_that.voltage,_that.maxHead,_that.hp,_that.kw,_that.lpm,_that.outletSize,_that.isOn,_that.createdAt,_that.lastRunningTime,_that.startTime,_that.endTime,_that.totalRunningMinutes,_that.logs);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? phaseType,  String? pumpId,  String? pumpName,  double? voltage,  double? maxHead,  double? hp,  double? kw,  int? lpm,  int? outletSize,  bool isOn,  DateTime? createdAt,  DateTime? lastRunningTime,  DateTime? startTime,  DateTime? endTime,  int totalRunningMinutes,  List<PumpLogModel> logs)  $default,) {final _that = this;
switch (_that) {
case _PumpDetailModel():
return $default(_that.phaseType,_that.pumpId,_that.pumpName,_that.voltage,_that.maxHead,_that.hp,_that.kw,_that.lpm,_that.outletSize,_that.isOn,_that.createdAt,_that.lastRunningTime,_that.startTime,_that.endTime,_that.totalRunningMinutes,_that.logs);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? phaseType,  String? pumpId,  String? pumpName,  double? voltage,  double? maxHead,  double? hp,  double? kw,  int? lpm,  int? outletSize,  bool isOn,  DateTime? createdAt,  DateTime? lastRunningTime,  DateTime? startTime,  DateTime? endTime,  int totalRunningMinutes,  List<PumpLogModel> logs)?  $default,) {final _that = this;
switch (_that) {
case _PumpDetailModel() when $default != null:
return $default(_that.phaseType,_that.pumpId,_that.pumpName,_that.voltage,_that.maxHead,_that.hp,_that.kw,_that.lpm,_that.outletSize,_that.isOn,_that.createdAt,_that.lastRunningTime,_that.startTime,_that.endTime,_that.totalRunningMinutes,_that.logs);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PumpDetailModel implements PumpDetailModel {
  const _PumpDetailModel({this.phaseType, this.pumpId, this.pumpName, this.voltage, this.maxHead, this.hp, this.kw, this.lpm, this.outletSize, this.isOn = false, this.createdAt, this.lastRunningTime, this.startTime, this.endTime, this.totalRunningMinutes = 0, final  List<PumpLogModel> logs = const []}): _logs = logs;
  factory _PumpDetailModel.fromJson(Map<String, dynamic> json) => _$PumpDetailModelFromJson(json);

// Pump Technical Details
@override final  String? phaseType;
@override final  String? pumpId;
@override final  String? pumpName;
@override final  double? voltage;
@override final  double? maxHead;
@override final  double? hp;
@override final  double? kw;
@override final  int? lpm;
@override final  int? outletSize;
// Pump Status
@override@JsonKey() final  bool isOn;
// Time Tracking
@override final  DateTime? createdAt;
@override final  DateTime? lastRunningTime;
// ✅ USE DateTime (NOT TimeOfDay)
@override final  DateTime? startTime;
@override final  DateTime? endTime;
// Total running in minutes
@override@JsonKey() final  int totalRunningMinutes;
// Logs
 final  List<PumpLogModel> _logs;
// Logs
@override@JsonKey() List<PumpLogModel> get logs {
  if (_logs is EqualUnmodifiableListView) return _logs;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_logs);
}


/// Create a copy of PumpDetailModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PumpDetailModelCopyWith<_PumpDetailModel> get copyWith => __$PumpDetailModelCopyWithImpl<_PumpDetailModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PumpDetailModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PumpDetailModel&&(identical(other.phaseType, phaseType) || other.phaseType == phaseType)&&(identical(other.pumpId, pumpId) || other.pumpId == pumpId)&&(identical(other.pumpName, pumpName) || other.pumpName == pumpName)&&(identical(other.voltage, voltage) || other.voltage == voltage)&&(identical(other.maxHead, maxHead) || other.maxHead == maxHead)&&(identical(other.hp, hp) || other.hp == hp)&&(identical(other.kw, kw) || other.kw == kw)&&(identical(other.lpm, lpm) || other.lpm == lpm)&&(identical(other.outletSize, outletSize) || other.outletSize == outletSize)&&(identical(other.isOn, isOn) || other.isOn == isOn)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.lastRunningTime, lastRunningTime) || other.lastRunningTime == lastRunningTime)&&(identical(other.startTime, startTime) || other.startTime == startTime)&&(identical(other.endTime, endTime) || other.endTime == endTime)&&(identical(other.totalRunningMinutes, totalRunningMinutes) || other.totalRunningMinutes == totalRunningMinutes)&&const DeepCollectionEquality().equals(other._logs, _logs));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,phaseType,pumpId,pumpName,voltage,maxHead,hp,kw,lpm,outletSize,isOn,createdAt,lastRunningTime,startTime,endTime,totalRunningMinutes,const DeepCollectionEquality().hash(_logs));

@override
String toString() {
  return 'PumpDetailModel(phaseType: $phaseType, pumpId: $pumpId, pumpName: $pumpName, voltage: $voltage, maxHead: $maxHead, hp: $hp, kw: $kw, lpm: $lpm, outletSize: $outletSize, isOn: $isOn, createdAt: $createdAt, lastRunningTime: $lastRunningTime, startTime: $startTime, endTime: $endTime, totalRunningMinutes: $totalRunningMinutes, logs: $logs)';
}


}

/// @nodoc
abstract mixin class _$PumpDetailModelCopyWith<$Res> implements $PumpDetailModelCopyWith<$Res> {
  factory _$PumpDetailModelCopyWith(_PumpDetailModel value, $Res Function(_PumpDetailModel) _then) = __$PumpDetailModelCopyWithImpl;
@override @useResult
$Res call({
 String? phaseType, String? pumpId, String? pumpName, double? voltage, double? maxHead, double? hp, double? kw, int? lpm, int? outletSize, bool isOn, DateTime? createdAt, DateTime? lastRunningTime, DateTime? startTime, DateTime? endTime, int totalRunningMinutes, List<PumpLogModel> logs
});




}
/// @nodoc
class __$PumpDetailModelCopyWithImpl<$Res>
    implements _$PumpDetailModelCopyWith<$Res> {
  __$PumpDetailModelCopyWithImpl(this._self, this._then);

  final _PumpDetailModel _self;
  final $Res Function(_PumpDetailModel) _then;

/// Create a copy of PumpDetailModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? phaseType = freezed,Object? pumpId = freezed,Object? pumpName = freezed,Object? voltage = freezed,Object? maxHead = freezed,Object? hp = freezed,Object? kw = freezed,Object? lpm = freezed,Object? outletSize = freezed,Object? isOn = null,Object? createdAt = freezed,Object? lastRunningTime = freezed,Object? startTime = freezed,Object? endTime = freezed,Object? totalRunningMinutes = null,Object? logs = null,}) {
  return _then(_PumpDetailModel(
phaseType: freezed == phaseType ? _self.phaseType : phaseType // ignore: cast_nullable_to_non_nullable
as String?,pumpId: freezed == pumpId ? _self.pumpId : pumpId // ignore: cast_nullable_to_non_nullable
as String?,pumpName: freezed == pumpName ? _self.pumpName : pumpName // ignore: cast_nullable_to_non_nullable
as String?,voltage: freezed == voltage ? _self.voltage : voltage // ignore: cast_nullable_to_non_nullable
as double?,maxHead: freezed == maxHead ? _self.maxHead : maxHead // ignore: cast_nullable_to_non_nullable
as double?,hp: freezed == hp ? _self.hp : hp // ignore: cast_nullable_to_non_nullable
as double?,kw: freezed == kw ? _self.kw : kw // ignore: cast_nullable_to_non_nullable
as double?,lpm: freezed == lpm ? _self.lpm : lpm // ignore: cast_nullable_to_non_nullable
as int?,outletSize: freezed == outletSize ? _self.outletSize : outletSize // ignore: cast_nullable_to_non_nullable
as int?,isOn: null == isOn ? _self.isOn : isOn // ignore: cast_nullable_to_non_nullable
as bool,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,lastRunningTime: freezed == lastRunningTime ? _self.lastRunningTime : lastRunningTime // ignore: cast_nullable_to_non_nullable
as DateTime?,startTime: freezed == startTime ? _self.startTime : startTime // ignore: cast_nullable_to_non_nullable
as DateTime?,endTime: freezed == endTime ? _self.endTime : endTime // ignore: cast_nullable_to_non_nullable
as DateTime?,totalRunningMinutes: null == totalRunningMinutes ? _self.totalRunningMinutes : totalRunningMinutes // ignore: cast_nullable_to_non_nullable
as int,logs: null == logs ? _self._logs : logs // ignore: cast_nullable_to_non_nullable
as List<PumpLogModel>,
  ));
}


}


/// @nodoc
mixin _$PumpLogModel {

 String get action; DateTime get time;
/// Create a copy of PumpLogModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PumpLogModelCopyWith<PumpLogModel> get copyWith => _$PumpLogModelCopyWithImpl<PumpLogModel>(this as PumpLogModel, _$identity);

  /// Serializes this PumpLogModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PumpLogModel&&(identical(other.action, action) || other.action == action)&&(identical(other.time, time) || other.time == time));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,action,time);

@override
String toString() {
  return 'PumpLogModel(action: $action, time: $time)';
}


}

/// @nodoc
abstract mixin class $PumpLogModelCopyWith<$Res>  {
  factory $PumpLogModelCopyWith(PumpLogModel value, $Res Function(PumpLogModel) _then) = _$PumpLogModelCopyWithImpl;
@useResult
$Res call({
 String action, DateTime time
});




}
/// @nodoc
class _$PumpLogModelCopyWithImpl<$Res>
    implements $PumpLogModelCopyWith<$Res> {
  _$PumpLogModelCopyWithImpl(this._self, this._then);

  final PumpLogModel _self;
  final $Res Function(PumpLogModel) _then;

/// Create a copy of PumpLogModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? action = null,Object? time = null,}) {
  return _then(_self.copyWith(
action: null == action ? _self.action : action // ignore: cast_nullable_to_non_nullable
as String,time: null == time ? _self.time : time // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [PumpLogModel].
extension PumpLogModelPatterns on PumpLogModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PumpLogModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PumpLogModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PumpLogModel value)  $default,){
final _that = this;
switch (_that) {
case _PumpLogModel():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PumpLogModel value)?  $default,){
final _that = this;
switch (_that) {
case _PumpLogModel() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String action,  DateTime time)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PumpLogModel() when $default != null:
return $default(_that.action,_that.time);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String action,  DateTime time)  $default,) {final _that = this;
switch (_that) {
case _PumpLogModel():
return $default(_that.action,_that.time);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String action,  DateTime time)?  $default,) {final _that = this;
switch (_that) {
case _PumpLogModel() when $default != null:
return $default(_that.action,_that.time);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PumpLogModel implements PumpLogModel {
  const _PumpLogModel({required this.action, required this.time});
  factory _PumpLogModel.fromJson(Map<String, dynamic> json) => _$PumpLogModelFromJson(json);

@override final  String action;
@override final  DateTime time;

/// Create a copy of PumpLogModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PumpLogModelCopyWith<_PumpLogModel> get copyWith => __$PumpLogModelCopyWithImpl<_PumpLogModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PumpLogModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PumpLogModel&&(identical(other.action, action) || other.action == action)&&(identical(other.time, time) || other.time == time));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,action,time);

@override
String toString() {
  return 'PumpLogModel(action: $action, time: $time)';
}


}

/// @nodoc
abstract mixin class _$PumpLogModelCopyWith<$Res> implements $PumpLogModelCopyWith<$Res> {
  factory _$PumpLogModelCopyWith(_PumpLogModel value, $Res Function(_PumpLogModel) _then) = __$PumpLogModelCopyWithImpl;
@override @useResult
$Res call({
 String action, DateTime time
});




}
/// @nodoc
class __$PumpLogModelCopyWithImpl<$Res>
    implements _$PumpLogModelCopyWith<$Res> {
  __$PumpLogModelCopyWithImpl(this._self, this._then);

  final _PumpLogModel _self;
  final $Res Function(_PumpLogModel) _then;

/// Create a copy of PumpLogModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? action = null,Object? time = null,}) {
  return _then(_PumpLogModel(
action: null == action ? _self.action : action // ignore: cast_nullable_to_non_nullable
as String,time: null == time ? _self.time : time // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
