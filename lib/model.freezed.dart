// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Authentication _$AuthenticationFromJson(Map<String, dynamic> json) {
  return _Authentication.fromJson(json);
}

/// @nodoc
mixin _$Authentication {
  int get verification_id => throw _privateConstructorUsedError;
  int get reference => throw _privateConstructorUsedError;
  int get code => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;
  String get access_token => throw _privateConstructorUsedError;
  String get refresh_token => throw _privateConstructorUsedError;
  int get users_id => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AuthenticationCopyWith<Authentication> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthenticationCopyWith<$Res> {
  factory $AuthenticationCopyWith(
          Authentication value, $Res Function(Authentication) then) =
      _$AuthenticationCopyWithImpl<$Res, Authentication>;
  @useResult
  $Res call(
      {int verification_id,
      int reference,
      int code,
      String email,
      String password,
      String access_token,
      String refresh_token,
      int users_id});
}

/// @nodoc
class _$AuthenticationCopyWithImpl<$Res, $Val extends Authentication>
    implements $AuthenticationCopyWith<$Res> {
  _$AuthenticationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? verification_id = null,
    Object? reference = null,
    Object? code = null,
    Object? email = null,
    Object? password = null,
    Object? access_token = null,
    Object? refresh_token = null,
    Object? users_id = null,
  }) {
    return _then(_value.copyWith(
      verification_id: null == verification_id
          ? _value.verification_id
          : verification_id // ignore: cast_nullable_to_non_nullable
              as int,
      reference: null == reference
          ? _value.reference
          : reference // ignore: cast_nullable_to_non_nullable
              as int,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as int,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      access_token: null == access_token
          ? _value.access_token
          : access_token // ignore: cast_nullable_to_non_nullable
              as String,
      refresh_token: null == refresh_token
          ? _value.refresh_token
          : refresh_token // ignore: cast_nullable_to_non_nullable
              as String,
      users_id: null == users_id
          ? _value.users_id
          : users_id // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AuthenticationImplCopyWith<$Res>
    implements $AuthenticationCopyWith<$Res> {
  factory _$$AuthenticationImplCopyWith(_$AuthenticationImpl value,
          $Res Function(_$AuthenticationImpl) then) =
      __$$AuthenticationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int verification_id,
      int reference,
      int code,
      String email,
      String password,
      String access_token,
      String refresh_token,
      int users_id});
}

/// @nodoc
class __$$AuthenticationImplCopyWithImpl<$Res>
    extends _$AuthenticationCopyWithImpl<$Res, _$AuthenticationImpl>
    implements _$$AuthenticationImplCopyWith<$Res> {
  __$$AuthenticationImplCopyWithImpl(
      _$AuthenticationImpl _value, $Res Function(_$AuthenticationImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? verification_id = null,
    Object? reference = null,
    Object? code = null,
    Object? email = null,
    Object? password = null,
    Object? access_token = null,
    Object? refresh_token = null,
    Object? users_id = null,
  }) {
    return _then(_$AuthenticationImpl(
      verification_id: null == verification_id
          ? _value.verification_id
          : verification_id // ignore: cast_nullable_to_non_nullable
              as int,
      reference: null == reference
          ? _value.reference
          : reference // ignore: cast_nullable_to_non_nullable
              as int,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as int,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      access_token: null == access_token
          ? _value.access_token
          : access_token // ignore: cast_nullable_to_non_nullable
              as String,
      refresh_token: null == refresh_token
          ? _value.refresh_token
          : refresh_token // ignore: cast_nullable_to_non_nullable
              as String,
      users_id: null == users_id
          ? _value.users_id
          : users_id // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AuthenticationImpl implements _Authentication {
  const _$AuthenticationImpl(
      {required this.verification_id,
      required this.reference,
      required this.code,
      required this.email,
      required this.password,
      required this.access_token,
      required this.refresh_token,
      required this.users_id});

  factory _$AuthenticationImpl.fromJson(Map<String, dynamic> json) =>
      _$$AuthenticationImplFromJson(json);

  @override
  final int verification_id;
  @override
  final int reference;
  @override
  final int code;
  @override
  final String email;
  @override
  final String password;
  @override
  final String access_token;
  @override
  final String refresh_token;
  @override
  final int users_id;

  @override
  String toString() {
    return 'Authentication(verification_id: $verification_id, reference: $reference, code: $code, email: $email, password: $password, access_token: $access_token, refresh_token: $refresh_token, users_id: $users_id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthenticationImpl &&
            (identical(other.verification_id, verification_id) ||
                other.verification_id == verification_id) &&
            (identical(other.reference, reference) ||
                other.reference == reference) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.access_token, access_token) ||
                other.access_token == access_token) &&
            (identical(other.refresh_token, refresh_token) ||
                other.refresh_token == refresh_token) &&
            (identical(other.users_id, users_id) ||
                other.users_id == users_id));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, verification_id, reference, code,
      email, password, access_token, refresh_token, users_id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthenticationImplCopyWith<_$AuthenticationImpl> get copyWith =>
      __$$AuthenticationImplCopyWithImpl<_$AuthenticationImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AuthenticationImplToJson(
      this,
    );
  }
}

abstract class _Authentication implements Authentication {
  const factory _Authentication(
      {required final int verification_id,
      required final int reference,
      required final int code,
      required final String email,
      required final String password,
      required final String access_token,
      required final String refresh_token,
      required final int users_id}) = _$AuthenticationImpl;

  factory _Authentication.fromJson(Map<String, dynamic> json) =
      _$AuthenticationImpl.fromJson;

  @override
  int get verification_id;
  @override
  int get reference;
  @override
  int get code;
  @override
  String get email;
  @override
  String get password;
  @override
  String get access_token;
  @override
  String get refresh_token;
  @override
  int get users_id;
  @override
  @JsonKey(ignore: true)
  _$$AuthenticationImplCopyWith<_$AuthenticationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
