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
 String? get serialNumber; String? get pumpName; String? get customer; int? get capacity; String? get capacityUnit; int? get headRange; String? get headUnit; int? get outletSize; String? get outletUnit; int? get phaseType; int? get supplyVoltage; int? get lph; String? get location;
/// Create a copy of PumpDetailModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PumpDetailModelCopyWith<PumpDetailModel> get copyWith => _$PumpDetailModelCopyWithImpl<PumpDetailModel>(this as PumpDetailModel, _$identity);

  /// Serializes this PumpDetailModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PumpDetailModel&&(identical(other.serialNumber, serialNumber) || other.serialNumber == serialNumber)&&(identical(other.pumpName, pumpName) || other.pumpName == pumpName)&&(identical(other.customer, customer) || other.customer == customer)&&(identical(other.capacity, capacity) || other.capacity == capacity)&&(identical(other.capacityUnit, capacityUnit) || other.capacityUnit == capacityUnit)&&(identical(other.headRange, headRange) || other.headRange == headRange)&&(identical(other.headUnit, headUnit) || other.headUnit == headUnit)&&(identical(other.outletSize, outletSize) || other.outletSize == outletSize)&&(identical(other.outletUnit, outletUnit) || other.outletUnit == outletUnit)&&(identical(other.phaseType, phaseType) || other.phaseType == phaseType)&&(identical(other.supplyVoltage, supplyVoltage) || other.supplyVoltage == supplyVoltage)&&(identical(other.lph, lph) || other.lph == lph)&&(identical(other.location, location) || other.location == location));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,serialNumber,pumpName,customer,capacity,capacityUnit,headRange,headUnit,outletSize,outletUnit,phaseType,supplyVoltage,lph,location);

@override
String toString() {
  return 'PumpDetailModel(serialNumber: $serialNumber, pumpName: $pumpName, customer: $customer, capacity: $capacity, capacityUnit: $capacityUnit, headRange: $headRange, headUnit: $headUnit, outletSize: $outletSize, outletUnit: $outletUnit, phaseType: $phaseType, supplyVoltage: $supplyVoltage, lph: $lph, location: $location)';
}


}

/// @nodoc
abstract mixin class $PumpDetailModelCopyWith<$Res>  {
  factory $PumpDetailModelCopyWith(PumpDetailModel value, $Res Function(PumpDetailModel) _then) = _$PumpDetailModelCopyWithImpl;
@useResult
$Res call({
 String? serialNumber, String? pumpName, String? customer, int? capacity, String? capacityUnit, int? headRange, String? headUnit, int? outletSize, String? outletUnit, int? phaseType, int? supplyVoltage, int? lph, String? location
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
@pragma('vm:prefer-inline') @override $Res call({Object? serialNumber = freezed,Object? pumpName = freezed,Object? customer = freezed,Object? capacity = freezed,Object? capacityUnit = freezed,Object? headRange = freezed,Object? headUnit = freezed,Object? outletSize = freezed,Object? outletUnit = freezed,Object? phaseType = freezed,Object? supplyVoltage = freezed,Object? lph = freezed,Object? location = freezed,}) {
  return _then(_self.copyWith(
serialNumber: freezed == serialNumber ? _self.serialNumber : serialNumber // ignore: cast_nullable_to_non_nullable
as String?,pumpName: freezed == pumpName ? _self.pumpName : pumpName // ignore: cast_nullable_to_non_nullable
as String?,customer: freezed == customer ? _self.customer : customer // ignore: cast_nullable_to_non_nullable
as String?,capacity: freezed == capacity ? _self.capacity : capacity // ignore: cast_nullable_to_non_nullable
as int?,capacityUnit: freezed == capacityUnit ? _self.capacityUnit : capacityUnit // ignore: cast_nullable_to_non_nullable
as String?,headRange: freezed == headRange ? _self.headRange : headRange // ignore: cast_nullable_to_non_nullable
as int?,headUnit: freezed == headUnit ? _self.headUnit : headUnit // ignore: cast_nullable_to_non_nullable
as String?,outletSize: freezed == outletSize ? _self.outletSize : outletSize // ignore: cast_nullable_to_non_nullable
as int?,outletUnit: freezed == outletUnit ? _self.outletUnit : outletUnit // ignore: cast_nullable_to_non_nullable
as String?,phaseType: freezed == phaseType ? _self.phaseType : phaseType // ignore: cast_nullable_to_non_nullable
as int?,supplyVoltage: freezed == supplyVoltage ? _self.supplyVoltage : supplyVoltage // ignore: cast_nullable_to_non_nullable
as int?,lph: freezed == lph ? _self.lph : lph // ignore: cast_nullable_to_non_nullable
as int?,location: freezed == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String?,
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? serialNumber,  String? pumpName,  String? customer,  int? capacity,  String? capacityUnit,  int? headRange,  String? headUnit,  int? outletSize,  String? outletUnit,  int? phaseType,  int? supplyVoltage,  int? lph,  String? location)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PumpDetailModel() when $default != null:
return $default(_that.serialNumber,_that.pumpName,_that.customer,_that.capacity,_that.capacityUnit,_that.headRange,_that.headUnit,_that.outletSize,_that.outletUnit,_that.phaseType,_that.supplyVoltage,_that.lph,_that.location);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? serialNumber,  String? pumpName,  String? customer,  int? capacity,  String? capacityUnit,  int? headRange,  String? headUnit,  int? outletSize,  String? outletUnit,  int? phaseType,  int? supplyVoltage,  int? lph,  String? location)  $default,) {final _that = this;
switch (_that) {
case _PumpDetailModel():
return $default(_that.serialNumber,_that.pumpName,_that.customer,_that.capacity,_that.capacityUnit,_that.headRange,_that.headUnit,_that.outletSize,_that.outletUnit,_that.phaseType,_that.supplyVoltage,_that.lph,_that.location);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? serialNumber,  String? pumpName,  String? customer,  int? capacity,  String? capacityUnit,  int? headRange,  String? headUnit,  int? outletSize,  String? outletUnit,  int? phaseType,  int? supplyVoltage,  int? lph,  String? location)?  $default,) {final _that = this;
switch (_that) {
case _PumpDetailModel() when $default != null:
return $default(_that.serialNumber,_that.pumpName,_that.customer,_that.capacity,_that.capacityUnit,_that.headRange,_that.headUnit,_that.outletSize,_that.outletUnit,_that.phaseType,_that.supplyVoltage,_that.lph,_that.location);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PumpDetailModel implements PumpDetailModel {
  const _PumpDetailModel({this.serialNumber, this.pumpName, this.customer, this.capacity, this.capacityUnit, this.headRange, this.headUnit, this.outletSize, this.outletUnit, this.phaseType, this.supplyVoltage, this.lph, this.location});
  factory _PumpDetailModel.fromJson(Map<String, dynamic> json) => _$PumpDetailModelFromJson(json);

// Pump Technical Details
@override final  String? serialNumber;
@override final  String? pumpName;
@override final  String? customer;
@override final  int? capacity;
@override final  String? capacityUnit;
@override final  int? headRange;
@override final  String? headUnit;
@override final  int? outletSize;
@override final  String? outletUnit;
@override final  int? phaseType;
@override final  int? supplyVoltage;
@override final  int? lph;
@override final  String? location;

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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PumpDetailModel&&(identical(other.serialNumber, serialNumber) || other.serialNumber == serialNumber)&&(identical(other.pumpName, pumpName) || other.pumpName == pumpName)&&(identical(other.customer, customer) || other.customer == customer)&&(identical(other.capacity, capacity) || other.capacity == capacity)&&(identical(other.capacityUnit, capacityUnit) || other.capacityUnit == capacityUnit)&&(identical(other.headRange, headRange) || other.headRange == headRange)&&(identical(other.headUnit, headUnit) || other.headUnit == headUnit)&&(identical(other.outletSize, outletSize) || other.outletSize == outletSize)&&(identical(other.outletUnit, outletUnit) || other.outletUnit == outletUnit)&&(identical(other.phaseType, phaseType) || other.phaseType == phaseType)&&(identical(other.supplyVoltage, supplyVoltage) || other.supplyVoltage == supplyVoltage)&&(identical(other.lph, lph) || other.lph == lph)&&(identical(other.location, location) || other.location == location));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,serialNumber,pumpName,customer,capacity,capacityUnit,headRange,headUnit,outletSize,outletUnit,phaseType,supplyVoltage,lph,location);

@override
String toString() {
  return 'PumpDetailModel(serialNumber: $serialNumber, pumpName: $pumpName, customer: $customer, capacity: $capacity, capacityUnit: $capacityUnit, headRange: $headRange, headUnit: $headUnit, outletSize: $outletSize, outletUnit: $outletUnit, phaseType: $phaseType, supplyVoltage: $supplyVoltage, lph: $lph, location: $location)';
}


}

/// @nodoc
abstract mixin class _$PumpDetailModelCopyWith<$Res> implements $PumpDetailModelCopyWith<$Res> {
  factory _$PumpDetailModelCopyWith(_PumpDetailModel value, $Res Function(_PumpDetailModel) _then) = __$PumpDetailModelCopyWithImpl;
@override @useResult
$Res call({
 String? serialNumber, String? pumpName, String? customer, int? capacity, String? capacityUnit, int? headRange, String? headUnit, int? outletSize, String? outletUnit, int? phaseType, int? supplyVoltage, int? lph, String? location
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
@override @pragma('vm:prefer-inline') $Res call({Object? serialNumber = freezed,Object? pumpName = freezed,Object? customer = freezed,Object? capacity = freezed,Object? capacityUnit = freezed,Object? headRange = freezed,Object? headUnit = freezed,Object? outletSize = freezed,Object? outletUnit = freezed,Object? phaseType = freezed,Object? supplyVoltage = freezed,Object? lph = freezed,Object? location = freezed,}) {
  return _then(_PumpDetailModel(
serialNumber: freezed == serialNumber ? _self.serialNumber : serialNumber // ignore: cast_nullable_to_non_nullable
as String?,pumpName: freezed == pumpName ? _self.pumpName : pumpName // ignore: cast_nullable_to_non_nullable
as String?,customer: freezed == customer ? _self.customer : customer // ignore: cast_nullable_to_non_nullable
as String?,capacity: freezed == capacity ? _self.capacity : capacity // ignore: cast_nullable_to_non_nullable
as int?,capacityUnit: freezed == capacityUnit ? _self.capacityUnit : capacityUnit // ignore: cast_nullable_to_non_nullable
as String?,headRange: freezed == headRange ? _self.headRange : headRange // ignore: cast_nullable_to_non_nullable
as int?,headUnit: freezed == headUnit ? _self.headUnit : headUnit // ignore: cast_nullable_to_non_nullable
as String?,outletSize: freezed == outletSize ? _self.outletSize : outletSize // ignore: cast_nullable_to_non_nullable
as int?,outletUnit: freezed == outletUnit ? _self.outletUnit : outletUnit // ignore: cast_nullable_to_non_nullable
as String?,phaseType: freezed == phaseType ? _self.phaseType : phaseType // ignore: cast_nullable_to_non_nullable
as int?,supplyVoltage: freezed == supplyVoltage ? _self.supplyVoltage : supplyVoltage // ignore: cast_nullable_to_non_nullable
as int?,lph: freezed == lph ? _self.lph : lph // ignore: cast_nullable_to_non_nullable
as int?,location: freezed == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
