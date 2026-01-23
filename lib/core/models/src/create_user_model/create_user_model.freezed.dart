// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_user_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CreateUserModel {

 String get firstName; String get lastName; String get email; String get mobileNumber; String get address; String get role;
/// Create a copy of CreateUserModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateUserModelCopyWith<CreateUserModel> get copyWith => _$CreateUserModelCopyWithImpl<CreateUserModel>(this as CreateUserModel, _$identity);

  /// Serializes this CreateUserModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateUserModel&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.email, email) || other.email == email)&&(identical(other.mobileNumber, mobileNumber) || other.mobileNumber == mobileNumber)&&(identical(other.address, address) || other.address == address)&&(identical(other.role, role) || other.role == role));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,firstName,lastName,email,mobileNumber,address,role);

@override
String toString() {
  return 'CreateUserModel(firstName: $firstName, lastName: $lastName, email: $email, mobileNumber: $mobileNumber, address: $address, role: $role)';
}


}

/// @nodoc
abstract mixin class $CreateUserModelCopyWith<$Res>  {
  factory $CreateUserModelCopyWith(CreateUserModel value, $Res Function(CreateUserModel) _then) = _$CreateUserModelCopyWithImpl;
@useResult
$Res call({
 String firstName, String lastName, String email, String mobileNumber, String address, String role
});




}
/// @nodoc
class _$CreateUserModelCopyWithImpl<$Res>
    implements $CreateUserModelCopyWith<$Res> {
  _$CreateUserModelCopyWithImpl(this._self, this._then);

  final CreateUserModel _self;
  final $Res Function(CreateUserModel) _then;

/// Create a copy of CreateUserModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? firstName = null,Object? lastName = null,Object? email = null,Object? mobileNumber = null,Object? address = null,Object? role = null,}) {
  return _then(_self.copyWith(
firstName: null == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String,lastName: null == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,mobileNumber: null == mobileNumber ? _self.mobileNumber : mobileNumber // ignore: cast_nullable_to_non_nullable
as String,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [CreateUserModel].
extension CreateUserModelPatterns on CreateUserModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CreateUserModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CreateUserModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CreateUserModel value)  $default,){
final _that = this;
switch (_that) {
case _CreateUserModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CreateUserModel value)?  $default,){
final _that = this;
switch (_that) {
case _CreateUserModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String firstName,  String lastName,  String email,  String mobileNumber,  String address,  String role)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CreateUserModel() when $default != null:
return $default(_that.firstName,_that.lastName,_that.email,_that.mobileNumber,_that.address,_that.role);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String firstName,  String lastName,  String email,  String mobileNumber,  String address,  String role)  $default,) {final _that = this;
switch (_that) {
case _CreateUserModel():
return $default(_that.firstName,_that.lastName,_that.email,_that.mobileNumber,_that.address,_that.role);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String firstName,  String lastName,  String email,  String mobileNumber,  String address,  String role)?  $default,) {final _that = this;
switch (_that) {
case _CreateUserModel() when $default != null:
return $default(_that.firstName,_that.lastName,_that.email,_that.mobileNumber,_that.address,_that.role);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CreateUserModel implements CreateUserModel {
  const _CreateUserModel({required this.firstName, required this.lastName, required this.email, required this.mobileNumber, required this.address, required this.role});
  factory _CreateUserModel.fromJson(Map<String, dynamic> json) => _$CreateUserModelFromJson(json);

@override final  String firstName;
@override final  String lastName;
@override final  String email;
@override final  String mobileNumber;
@override final  String address;
@override final  String role;

/// Create a copy of CreateUserModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreateUserModelCopyWith<_CreateUserModel> get copyWith => __$CreateUserModelCopyWithImpl<_CreateUserModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CreateUserModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreateUserModel&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.email, email) || other.email == email)&&(identical(other.mobileNumber, mobileNumber) || other.mobileNumber == mobileNumber)&&(identical(other.address, address) || other.address == address)&&(identical(other.role, role) || other.role == role));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,firstName,lastName,email,mobileNumber,address,role);

@override
String toString() {
  return 'CreateUserModel(firstName: $firstName, lastName: $lastName, email: $email, mobileNumber: $mobileNumber, address: $address, role: $role)';
}


}

/// @nodoc
abstract mixin class _$CreateUserModelCopyWith<$Res> implements $CreateUserModelCopyWith<$Res> {
  factory _$CreateUserModelCopyWith(_CreateUserModel value, $Res Function(_CreateUserModel) _then) = __$CreateUserModelCopyWithImpl;
@override @useResult
$Res call({
 String firstName, String lastName, String email, String mobileNumber, String address, String role
});




}
/// @nodoc
class __$CreateUserModelCopyWithImpl<$Res>
    implements _$CreateUserModelCopyWith<$Res> {
  __$CreateUserModelCopyWithImpl(this._self, this._then);

  final _CreateUserModel _self;
  final $Res Function(_CreateUserModel) _then;

/// Create a copy of CreateUserModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? firstName = null,Object? lastName = null,Object? email = null,Object? mobileNumber = null,Object? address = null,Object? role = null,}) {
  return _then(_CreateUserModel(
firstName: null == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String,lastName: null == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,mobileNumber: null == mobileNumber ? _self.mobileNumber : mobileNumber // ignore: cast_nullable_to_non_nullable
as String,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
