// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'customer_detail_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CustomerDetailModel {

 String get customer_name; String get phone; String get country_code; String get gender; String get dob; String? get gstIn; String? get notes; String? get fullAddress; bool? get isShippingSame;
/// Create a copy of CustomerDetailModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CustomerDetailModelCopyWith<CustomerDetailModel> get copyWith => _$CustomerDetailModelCopyWithImpl<CustomerDetailModel>(this as CustomerDetailModel, _$identity);

  /// Serializes this CustomerDetailModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CustomerDetailModel&&(identical(other.customer_name, customer_name) || other.customer_name == customer_name)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.country_code, country_code) || other.country_code == country_code)&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.dob, dob) || other.dob == dob)&&(identical(other.gstIn, gstIn) || other.gstIn == gstIn)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.fullAddress, fullAddress) || other.fullAddress == fullAddress)&&(identical(other.isShippingSame, isShippingSame) || other.isShippingSame == isShippingSame));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,customer_name,phone,country_code,gender,dob,gstIn,notes,fullAddress,isShippingSame);

@override
String toString() {
  return 'CustomerDetailModel(customer_name: $customer_name, phone: $phone, country_code: $country_code, gender: $gender, dob: $dob, gstIn: $gstIn, notes: $notes, fullAddress: $fullAddress, isShippingSame: $isShippingSame)';
}


}

/// @nodoc
abstract mixin class $CustomerDetailModelCopyWith<$Res>  {
  factory $CustomerDetailModelCopyWith(CustomerDetailModel value, $Res Function(CustomerDetailModel) _then) = _$CustomerDetailModelCopyWithImpl;
@useResult
$Res call({
 String customer_name, String phone, String country_code, String gender, String dob, String? gstIn, String? notes, String? fullAddress, bool? isShippingSame
});




}
/// @nodoc
class _$CustomerDetailModelCopyWithImpl<$Res>
    implements $CustomerDetailModelCopyWith<$Res> {
  _$CustomerDetailModelCopyWithImpl(this._self, this._then);

  final CustomerDetailModel _self;
  final $Res Function(CustomerDetailModel) _then;

/// Create a copy of CustomerDetailModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? customer_name = null,Object? phone = null,Object? country_code = null,Object? gender = null,Object? dob = null,Object? gstIn = freezed,Object? notes = freezed,Object? fullAddress = freezed,Object? isShippingSame = freezed,}) {
  return _then(_self.copyWith(
customer_name: null == customer_name ? _self.customer_name : customer_name // ignore: cast_nullable_to_non_nullable
as String,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,country_code: null == country_code ? _self.country_code : country_code // ignore: cast_nullable_to_non_nullable
as String,gender: null == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as String,dob: null == dob ? _self.dob : dob // ignore: cast_nullable_to_non_nullable
as String,gstIn: freezed == gstIn ? _self.gstIn : gstIn // ignore: cast_nullable_to_non_nullable
as String?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,fullAddress: freezed == fullAddress ? _self.fullAddress : fullAddress // ignore: cast_nullable_to_non_nullable
as String?,isShippingSame: freezed == isShippingSame ? _self.isShippingSame : isShippingSame // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}

}


/// Adds pattern-matching-related methods to [CustomerDetailModel].
extension CustomerDetailModelPatterns on CustomerDetailModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CustomerDetailModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CustomerDetailModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CustomerDetailModel value)  $default,){
final _that = this;
switch (_that) {
case _CustomerDetailModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CustomerDetailModel value)?  $default,){
final _that = this;
switch (_that) {
case _CustomerDetailModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String customer_name,  String phone,  String country_code,  String gender,  String dob,  String? gstIn,  String? notes,  String? fullAddress,  bool? isShippingSame)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CustomerDetailModel() when $default != null:
return $default(_that.customer_name,_that.phone,_that.country_code,_that.gender,_that.dob,_that.gstIn,_that.notes,_that.fullAddress,_that.isShippingSame);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String customer_name,  String phone,  String country_code,  String gender,  String dob,  String? gstIn,  String? notes,  String? fullAddress,  bool? isShippingSame)  $default,) {final _that = this;
switch (_that) {
case _CustomerDetailModel():
return $default(_that.customer_name,_that.phone,_that.country_code,_that.gender,_that.dob,_that.gstIn,_that.notes,_that.fullAddress,_that.isShippingSame);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String customer_name,  String phone,  String country_code,  String gender,  String dob,  String? gstIn,  String? notes,  String? fullAddress,  bool? isShippingSame)?  $default,) {final _that = this;
switch (_that) {
case _CustomerDetailModel() when $default != null:
return $default(_that.customer_name,_that.phone,_that.country_code,_that.gender,_that.dob,_that.gstIn,_that.notes,_that.fullAddress,_that.isShippingSame);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CustomerDetailModel implements CustomerDetailModel {
  const _CustomerDetailModel({required this.customer_name, required this.phone, required this.country_code, required this.gender, required this.dob, this.gstIn, this.notes, this.fullAddress, this.isShippingSame});
  factory _CustomerDetailModel.fromJson(Map<String, dynamic> json) => _$CustomerDetailModelFromJson(json);

@override final  String customer_name;
@override final  String phone;
@override final  String country_code;
@override final  String gender;
@override final  String dob;
@override final  String? gstIn;
@override final  String? notes;
@override final  String? fullAddress;
@override final  bool? isShippingSame;

/// Create a copy of CustomerDetailModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CustomerDetailModelCopyWith<_CustomerDetailModel> get copyWith => __$CustomerDetailModelCopyWithImpl<_CustomerDetailModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CustomerDetailModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CustomerDetailModel&&(identical(other.customer_name, customer_name) || other.customer_name == customer_name)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.country_code, country_code) || other.country_code == country_code)&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.dob, dob) || other.dob == dob)&&(identical(other.gstIn, gstIn) || other.gstIn == gstIn)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.fullAddress, fullAddress) || other.fullAddress == fullAddress)&&(identical(other.isShippingSame, isShippingSame) || other.isShippingSame == isShippingSame));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,customer_name,phone,country_code,gender,dob,gstIn,notes,fullAddress,isShippingSame);

@override
String toString() {
  return 'CustomerDetailModel(customer_name: $customer_name, phone: $phone, country_code: $country_code, gender: $gender, dob: $dob, gstIn: $gstIn, notes: $notes, fullAddress: $fullAddress, isShippingSame: $isShippingSame)';
}


}

/// @nodoc
abstract mixin class _$CustomerDetailModelCopyWith<$Res> implements $CustomerDetailModelCopyWith<$Res> {
  factory _$CustomerDetailModelCopyWith(_CustomerDetailModel value, $Res Function(_CustomerDetailModel) _then) = __$CustomerDetailModelCopyWithImpl;
@override @useResult
$Res call({
 String customer_name, String phone, String country_code, String gender, String dob, String? gstIn, String? notes, String? fullAddress, bool? isShippingSame
});




}
/// @nodoc
class __$CustomerDetailModelCopyWithImpl<$Res>
    implements _$CustomerDetailModelCopyWith<$Res> {
  __$CustomerDetailModelCopyWithImpl(this._self, this._then);

  final _CustomerDetailModel _self;
  final $Res Function(_CustomerDetailModel) _then;

/// Create a copy of CustomerDetailModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? customer_name = null,Object? phone = null,Object? country_code = null,Object? gender = null,Object? dob = null,Object? gstIn = freezed,Object? notes = freezed,Object? fullAddress = freezed,Object? isShippingSame = freezed,}) {
  return _then(_CustomerDetailModel(
customer_name: null == customer_name ? _self.customer_name : customer_name // ignore: cast_nullable_to_non_nullable
as String,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,country_code: null == country_code ? _self.country_code : country_code // ignore: cast_nullable_to_non_nullable
as String,gender: null == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as String,dob: null == dob ? _self.dob : dob // ignore: cast_nullable_to_non_nullable
as String,gstIn: freezed == gstIn ? _self.gstIn : gstIn // ignore: cast_nullable_to_non_nullable
as String?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,fullAddress: freezed == fullAddress ? _self.fullAddress : fullAddress // ignore: cast_nullable_to_non_nullable
as String?,isShippingSame: freezed == isShippingSame ? _self.isShippingSame : isShippingSame // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}


}

// dart format on
