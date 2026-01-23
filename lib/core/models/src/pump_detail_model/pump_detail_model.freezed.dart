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

@JsonKey(name: '_id') String? get id; String? get serialNumber; String? get pumpID; String? get pumpName; String? get location; int? get phase; double? get capacitykW; int? get lph; double? get headRangeMetres; int? get outletSizeMM; int? get supplyVoltage; String? get capacityUnit; String? get headUnit; String? get outletUnit; String? get currentStatus; String? get customer; bool? get isActive; int? get lastSwitchedOnDuration; int? get totalLifetimeDuration; DateTime? get installationDate; DateTime? get createdAt; DateTime? get updatedAt; List<dynamic>? get schedules; Map<String, dynamic>? get displaySpecs;
/// Create a copy of PumpDetailModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PumpDetailModelCopyWith<PumpDetailModel> get copyWith => _$PumpDetailModelCopyWithImpl<PumpDetailModel>(this as PumpDetailModel, _$identity);

  /// Serializes this PumpDetailModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PumpDetailModel&&(identical(other.id, id) || other.id == id)&&(identical(other.serialNumber, serialNumber) || other.serialNumber == serialNumber)&&(identical(other.pumpID, pumpID) || other.pumpID == pumpID)&&(identical(other.pumpName, pumpName) || other.pumpName == pumpName)&&(identical(other.location, location) || other.location == location)&&(identical(other.phase, phase) || other.phase == phase)&&(identical(other.capacitykW, capacitykW) || other.capacitykW == capacitykW)&&(identical(other.lph, lph) || other.lph == lph)&&(identical(other.headRangeMetres, headRangeMetres) || other.headRangeMetres == headRangeMetres)&&(identical(other.outletSizeMM, outletSizeMM) || other.outletSizeMM == outletSizeMM)&&(identical(other.supplyVoltage, supplyVoltage) || other.supplyVoltage == supplyVoltage)&&(identical(other.capacityUnit, capacityUnit) || other.capacityUnit == capacityUnit)&&(identical(other.headUnit, headUnit) || other.headUnit == headUnit)&&(identical(other.outletUnit, outletUnit) || other.outletUnit == outletUnit)&&(identical(other.currentStatus, currentStatus) || other.currentStatus == currentStatus)&&(identical(other.customer, customer) || other.customer == customer)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.lastSwitchedOnDuration, lastSwitchedOnDuration) || other.lastSwitchedOnDuration == lastSwitchedOnDuration)&&(identical(other.totalLifetimeDuration, totalLifetimeDuration) || other.totalLifetimeDuration == totalLifetimeDuration)&&(identical(other.installationDate, installationDate) || other.installationDate == installationDate)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&const DeepCollectionEquality().equals(other.schedules, schedules)&&const DeepCollectionEquality().equals(other.displaySpecs, displaySpecs));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,serialNumber,pumpID,pumpName,location,phase,capacitykW,lph,headRangeMetres,outletSizeMM,supplyVoltage,capacityUnit,headUnit,outletUnit,currentStatus,customer,isActive,lastSwitchedOnDuration,totalLifetimeDuration,installationDate,createdAt,updatedAt,const DeepCollectionEquality().hash(schedules),const DeepCollectionEquality().hash(displaySpecs)]);

@override
String toString() {
  return 'PumpDetailModel(id: $id, serialNumber: $serialNumber, pumpID: $pumpID, pumpName: $pumpName, location: $location, phase: $phase, capacitykW: $capacitykW, lph: $lph, headRangeMetres: $headRangeMetres, outletSizeMM: $outletSizeMM, supplyVoltage: $supplyVoltage, capacityUnit: $capacityUnit, headUnit: $headUnit, outletUnit: $outletUnit, currentStatus: $currentStatus, customer: $customer, isActive: $isActive, lastSwitchedOnDuration: $lastSwitchedOnDuration, totalLifetimeDuration: $totalLifetimeDuration, installationDate: $installationDate, createdAt: $createdAt, updatedAt: $updatedAt, schedules: $schedules, displaySpecs: $displaySpecs)';
}


}

/// @nodoc
abstract mixin class $PumpDetailModelCopyWith<$Res>  {
  factory $PumpDetailModelCopyWith(PumpDetailModel value, $Res Function(PumpDetailModel) _then) = _$PumpDetailModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: '_id') String? id, String? serialNumber, String? pumpID, String? pumpName, String? location, int? phase, double? capacitykW, int? lph, double? headRangeMetres, int? outletSizeMM, int? supplyVoltage, String? capacityUnit, String? headUnit, String? outletUnit, String? currentStatus, String? customer, bool? isActive, int? lastSwitchedOnDuration, int? totalLifetimeDuration, DateTime? installationDate, DateTime? createdAt, DateTime? updatedAt, List<dynamic>? schedules, Map<String, dynamic>? displaySpecs
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
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? serialNumber = freezed,Object? pumpID = freezed,Object? pumpName = freezed,Object? location = freezed,Object? phase = freezed,Object? capacitykW = freezed,Object? lph = freezed,Object? headRangeMetres = freezed,Object? outletSizeMM = freezed,Object? supplyVoltage = freezed,Object? capacityUnit = freezed,Object? headUnit = freezed,Object? outletUnit = freezed,Object? currentStatus = freezed,Object? customer = freezed,Object? isActive = freezed,Object? lastSwitchedOnDuration = freezed,Object? totalLifetimeDuration = freezed,Object? installationDate = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,Object? schedules = freezed,Object? displaySpecs = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,serialNumber: freezed == serialNumber ? _self.serialNumber : serialNumber // ignore: cast_nullable_to_non_nullable
as String?,pumpID: freezed == pumpID ? _self.pumpID : pumpID // ignore: cast_nullable_to_non_nullable
as String?,pumpName: freezed == pumpName ? _self.pumpName : pumpName // ignore: cast_nullable_to_non_nullable
as String?,location: freezed == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String?,phase: freezed == phase ? _self.phase : phase // ignore: cast_nullable_to_non_nullable
as int?,capacitykW: freezed == capacitykW ? _self.capacitykW : capacitykW // ignore: cast_nullable_to_non_nullable
as double?,lph: freezed == lph ? _self.lph : lph // ignore: cast_nullable_to_non_nullable
as int?,headRangeMetres: freezed == headRangeMetres ? _self.headRangeMetres : headRangeMetres // ignore: cast_nullable_to_non_nullable
as double?,outletSizeMM: freezed == outletSizeMM ? _self.outletSizeMM : outletSizeMM // ignore: cast_nullable_to_non_nullable
as int?,supplyVoltage: freezed == supplyVoltage ? _self.supplyVoltage : supplyVoltage // ignore: cast_nullable_to_non_nullable
as int?,capacityUnit: freezed == capacityUnit ? _self.capacityUnit : capacityUnit // ignore: cast_nullable_to_non_nullable
as String?,headUnit: freezed == headUnit ? _self.headUnit : headUnit // ignore: cast_nullable_to_non_nullable
as String?,outletUnit: freezed == outletUnit ? _self.outletUnit : outletUnit // ignore: cast_nullable_to_non_nullable
as String?,currentStatus: freezed == currentStatus ? _self.currentStatus : currentStatus // ignore: cast_nullable_to_non_nullable
as String?,customer: freezed == customer ? _self.customer : customer // ignore: cast_nullable_to_non_nullable
as String?,isActive: freezed == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool?,lastSwitchedOnDuration: freezed == lastSwitchedOnDuration ? _self.lastSwitchedOnDuration : lastSwitchedOnDuration // ignore: cast_nullable_to_non_nullable
as int?,totalLifetimeDuration: freezed == totalLifetimeDuration ? _self.totalLifetimeDuration : totalLifetimeDuration // ignore: cast_nullable_to_non_nullable
as int?,installationDate: freezed == installationDate ? _self.installationDate : installationDate // ignore: cast_nullable_to_non_nullable
as DateTime?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,schedules: freezed == schedules ? _self.schedules : schedules // ignore: cast_nullable_to_non_nullable
as List<dynamic>?,displaySpecs: freezed == displaySpecs ? _self.displaySpecs : displaySpecs // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: '_id')  String? id,  String? serialNumber,  String? pumpID,  String? pumpName,  String? location,  int? phase,  double? capacitykW,  int? lph,  double? headRangeMetres,  int? outletSizeMM,  int? supplyVoltage,  String? capacityUnit,  String? headUnit,  String? outletUnit,  String? currentStatus,  String? customer,  bool? isActive,  int? lastSwitchedOnDuration,  int? totalLifetimeDuration,  DateTime? installationDate,  DateTime? createdAt,  DateTime? updatedAt,  List<dynamic>? schedules,  Map<String, dynamic>? displaySpecs)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PumpDetailModel() when $default != null:
return $default(_that.id,_that.serialNumber,_that.pumpID,_that.pumpName,_that.location,_that.phase,_that.capacitykW,_that.lph,_that.headRangeMetres,_that.outletSizeMM,_that.supplyVoltage,_that.capacityUnit,_that.headUnit,_that.outletUnit,_that.currentStatus,_that.customer,_that.isActive,_that.lastSwitchedOnDuration,_that.totalLifetimeDuration,_that.installationDate,_that.createdAt,_that.updatedAt,_that.schedules,_that.displaySpecs);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: '_id')  String? id,  String? serialNumber,  String? pumpID,  String? pumpName,  String? location,  int? phase,  double? capacitykW,  int? lph,  double? headRangeMetres,  int? outletSizeMM,  int? supplyVoltage,  String? capacityUnit,  String? headUnit,  String? outletUnit,  String? currentStatus,  String? customer,  bool? isActive,  int? lastSwitchedOnDuration,  int? totalLifetimeDuration,  DateTime? installationDate,  DateTime? createdAt,  DateTime? updatedAt,  List<dynamic>? schedules,  Map<String, dynamic>? displaySpecs)  $default,) {final _that = this;
switch (_that) {
case _PumpDetailModel():
return $default(_that.id,_that.serialNumber,_that.pumpID,_that.pumpName,_that.location,_that.phase,_that.capacitykW,_that.lph,_that.headRangeMetres,_that.outletSizeMM,_that.supplyVoltage,_that.capacityUnit,_that.headUnit,_that.outletUnit,_that.currentStatus,_that.customer,_that.isActive,_that.lastSwitchedOnDuration,_that.totalLifetimeDuration,_that.installationDate,_that.createdAt,_that.updatedAt,_that.schedules,_that.displaySpecs);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: '_id')  String? id,  String? serialNumber,  String? pumpID,  String? pumpName,  String? location,  int? phase,  double? capacitykW,  int? lph,  double? headRangeMetres,  int? outletSizeMM,  int? supplyVoltage,  String? capacityUnit,  String? headUnit,  String? outletUnit,  String? currentStatus,  String? customer,  bool? isActive,  int? lastSwitchedOnDuration,  int? totalLifetimeDuration,  DateTime? installationDate,  DateTime? createdAt,  DateTime? updatedAt,  List<dynamic>? schedules,  Map<String, dynamic>? displaySpecs)?  $default,) {final _that = this;
switch (_that) {
case _PumpDetailModel() when $default != null:
return $default(_that.id,_that.serialNumber,_that.pumpID,_that.pumpName,_that.location,_that.phase,_that.capacitykW,_that.lph,_that.headRangeMetres,_that.outletSizeMM,_that.supplyVoltage,_that.capacityUnit,_that.headUnit,_that.outletUnit,_that.currentStatus,_that.customer,_that.isActive,_that.lastSwitchedOnDuration,_that.totalLifetimeDuration,_that.installationDate,_that.createdAt,_that.updatedAt,_that.schedules,_that.displaySpecs);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PumpDetailModel implements PumpDetailModel {
  const _PumpDetailModel({@JsonKey(name: '_id') this.id, this.serialNumber, this.pumpID, this.pumpName, this.location, this.phase, this.capacitykW, this.lph, this.headRangeMetres, this.outletSizeMM, this.supplyVoltage, this.capacityUnit, this.headUnit, this.outletUnit, this.currentStatus, this.customer, this.isActive, this.lastSwitchedOnDuration, this.totalLifetimeDuration, this.installationDate, this.createdAt, this.updatedAt, final  List<dynamic>? schedules, final  Map<String, dynamic>? displaySpecs}): _schedules = schedules,_displaySpecs = displaySpecs;
  factory _PumpDetailModel.fromJson(Map<String, dynamic> json) => _$PumpDetailModelFromJson(json);

@override@JsonKey(name: '_id') final  String? id;
@override final  String? serialNumber;
@override final  String? pumpID;
@override final  String? pumpName;
@override final  String? location;
@override final  int? phase;
@override final  double? capacitykW;
@override final  int? lph;
@override final  double? headRangeMetres;
@override final  int? outletSizeMM;
@override final  int? supplyVoltage;
@override final  String? capacityUnit;
@override final  String? headUnit;
@override final  String? outletUnit;
@override final  String? currentStatus;
@override final  String? customer;
@override final  bool? isActive;
@override final  int? lastSwitchedOnDuration;
@override final  int? totalLifetimeDuration;
@override final  DateTime? installationDate;
@override final  DateTime? createdAt;
@override final  DateTime? updatedAt;
 final  List<dynamic>? _schedules;
@override List<dynamic>? get schedules {
  final value = _schedules;
  if (value == null) return null;
  if (_schedules is EqualUnmodifiableListView) return _schedules;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  Map<String, dynamic>? _displaySpecs;
@override Map<String, dynamic>? get displaySpecs {
  final value = _displaySpecs;
  if (value == null) return null;
  if (_displaySpecs is EqualUnmodifiableMapView) return _displaySpecs;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PumpDetailModel&&(identical(other.id, id) || other.id == id)&&(identical(other.serialNumber, serialNumber) || other.serialNumber == serialNumber)&&(identical(other.pumpID, pumpID) || other.pumpID == pumpID)&&(identical(other.pumpName, pumpName) || other.pumpName == pumpName)&&(identical(other.location, location) || other.location == location)&&(identical(other.phase, phase) || other.phase == phase)&&(identical(other.capacitykW, capacitykW) || other.capacitykW == capacitykW)&&(identical(other.lph, lph) || other.lph == lph)&&(identical(other.headRangeMetres, headRangeMetres) || other.headRangeMetres == headRangeMetres)&&(identical(other.outletSizeMM, outletSizeMM) || other.outletSizeMM == outletSizeMM)&&(identical(other.supplyVoltage, supplyVoltage) || other.supplyVoltage == supplyVoltage)&&(identical(other.capacityUnit, capacityUnit) || other.capacityUnit == capacityUnit)&&(identical(other.headUnit, headUnit) || other.headUnit == headUnit)&&(identical(other.outletUnit, outletUnit) || other.outletUnit == outletUnit)&&(identical(other.currentStatus, currentStatus) || other.currentStatus == currentStatus)&&(identical(other.customer, customer) || other.customer == customer)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.lastSwitchedOnDuration, lastSwitchedOnDuration) || other.lastSwitchedOnDuration == lastSwitchedOnDuration)&&(identical(other.totalLifetimeDuration, totalLifetimeDuration) || other.totalLifetimeDuration == totalLifetimeDuration)&&(identical(other.installationDate, installationDate) || other.installationDate == installationDate)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&const DeepCollectionEquality().equals(other._schedules, _schedules)&&const DeepCollectionEquality().equals(other._displaySpecs, _displaySpecs));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,serialNumber,pumpID,pumpName,location,phase,capacitykW,lph,headRangeMetres,outletSizeMM,supplyVoltage,capacityUnit,headUnit,outletUnit,currentStatus,customer,isActive,lastSwitchedOnDuration,totalLifetimeDuration,installationDate,createdAt,updatedAt,const DeepCollectionEquality().hash(_schedules),const DeepCollectionEquality().hash(_displaySpecs)]);

@override
String toString() {
  return 'PumpDetailModel(id: $id, serialNumber: $serialNumber, pumpID: $pumpID, pumpName: $pumpName, location: $location, phase: $phase, capacitykW: $capacitykW, lph: $lph, headRangeMetres: $headRangeMetres, outletSizeMM: $outletSizeMM, supplyVoltage: $supplyVoltage, capacityUnit: $capacityUnit, headUnit: $headUnit, outletUnit: $outletUnit, currentStatus: $currentStatus, customer: $customer, isActive: $isActive, lastSwitchedOnDuration: $lastSwitchedOnDuration, totalLifetimeDuration: $totalLifetimeDuration, installationDate: $installationDate, createdAt: $createdAt, updatedAt: $updatedAt, schedules: $schedules, displaySpecs: $displaySpecs)';
}


}

/// @nodoc
abstract mixin class _$PumpDetailModelCopyWith<$Res> implements $PumpDetailModelCopyWith<$Res> {
  factory _$PumpDetailModelCopyWith(_PumpDetailModel value, $Res Function(_PumpDetailModel) _then) = __$PumpDetailModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: '_id') String? id, String? serialNumber, String? pumpID, String? pumpName, String? location, int? phase, double? capacitykW, int? lph, double? headRangeMetres, int? outletSizeMM, int? supplyVoltage, String? capacityUnit, String? headUnit, String? outletUnit, String? currentStatus, String? customer, bool? isActive, int? lastSwitchedOnDuration, int? totalLifetimeDuration, DateTime? installationDate, DateTime? createdAt, DateTime? updatedAt, List<dynamic>? schedules, Map<String, dynamic>? displaySpecs
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
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? serialNumber = freezed,Object? pumpID = freezed,Object? pumpName = freezed,Object? location = freezed,Object? phase = freezed,Object? capacitykW = freezed,Object? lph = freezed,Object? headRangeMetres = freezed,Object? outletSizeMM = freezed,Object? supplyVoltage = freezed,Object? capacityUnit = freezed,Object? headUnit = freezed,Object? outletUnit = freezed,Object? currentStatus = freezed,Object? customer = freezed,Object? isActive = freezed,Object? lastSwitchedOnDuration = freezed,Object? totalLifetimeDuration = freezed,Object? installationDate = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,Object? schedules = freezed,Object? displaySpecs = freezed,}) {
  return _then(_PumpDetailModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,serialNumber: freezed == serialNumber ? _self.serialNumber : serialNumber // ignore: cast_nullable_to_non_nullable
as String?,pumpID: freezed == pumpID ? _self.pumpID : pumpID // ignore: cast_nullable_to_non_nullable
as String?,pumpName: freezed == pumpName ? _self.pumpName : pumpName // ignore: cast_nullable_to_non_nullable
as String?,location: freezed == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String?,phase: freezed == phase ? _self.phase : phase // ignore: cast_nullable_to_non_nullable
as int?,capacitykW: freezed == capacitykW ? _self.capacitykW : capacitykW // ignore: cast_nullable_to_non_nullable
as double?,lph: freezed == lph ? _self.lph : lph // ignore: cast_nullable_to_non_nullable
as int?,headRangeMetres: freezed == headRangeMetres ? _self.headRangeMetres : headRangeMetres // ignore: cast_nullable_to_non_nullable
as double?,outletSizeMM: freezed == outletSizeMM ? _self.outletSizeMM : outletSizeMM // ignore: cast_nullable_to_non_nullable
as int?,supplyVoltage: freezed == supplyVoltage ? _self.supplyVoltage : supplyVoltage // ignore: cast_nullable_to_non_nullable
as int?,capacityUnit: freezed == capacityUnit ? _self.capacityUnit : capacityUnit // ignore: cast_nullable_to_non_nullable
as String?,headUnit: freezed == headUnit ? _self.headUnit : headUnit // ignore: cast_nullable_to_non_nullable
as String?,outletUnit: freezed == outletUnit ? _self.outletUnit : outletUnit // ignore: cast_nullable_to_non_nullable
as String?,currentStatus: freezed == currentStatus ? _self.currentStatus : currentStatus // ignore: cast_nullable_to_non_nullable
as String?,customer: freezed == customer ? _self.customer : customer // ignore: cast_nullable_to_non_nullable
as String?,isActive: freezed == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool?,lastSwitchedOnDuration: freezed == lastSwitchedOnDuration ? _self.lastSwitchedOnDuration : lastSwitchedOnDuration // ignore: cast_nullable_to_non_nullable
as int?,totalLifetimeDuration: freezed == totalLifetimeDuration ? _self.totalLifetimeDuration : totalLifetimeDuration // ignore: cast_nullable_to_non_nullable
as int?,installationDate: freezed == installationDate ? _self.installationDate : installationDate // ignore: cast_nullable_to_non_nullable
as DateTime?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,schedules: freezed == schedules ? _self._schedules : schedules // ignore: cast_nullable_to_non_nullable
as List<dynamic>?,displaySpecs: freezed == displaySpecs ? _self._displaySpecs : displaySpecs // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}


}

// dart format on
