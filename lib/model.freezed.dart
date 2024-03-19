// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError('It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Email _$EmailFromJson(Map<String, dynamic> json) {
  return _Email.fromJson(json);
}

/// @nodoc
mixin _$Email {
  String get email => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EmailCopyWith<Email> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EmailCopyWith<$Res> {
  factory $EmailCopyWith(Email value, $Res Function(Email) then) = _$EmailCopyWithImpl<$Res, Email>;
  @useResult
  $Res call({String email});
}

/// @nodoc
class _$EmailCopyWithImpl<$Res, $Val extends Email> implements $EmailCopyWith<$Res> {
  _$EmailCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
  }) {
    return _then(_value.copyWith(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EmailImplCopyWith<$Res> implements $EmailCopyWith<$Res> {
  factory _$$EmailImplCopyWith(_$EmailImpl value, $Res Function(_$EmailImpl) then) = __$$EmailImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String email});
}

/// @nodoc
class __$$EmailImplCopyWithImpl<$Res> extends _$EmailCopyWithImpl<$Res, _$EmailImpl> implements _$$EmailImplCopyWith<$Res> {
  __$$EmailImplCopyWithImpl(_$EmailImpl _value, $Res Function(_$EmailImpl) _then) : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
  }) {
    return _then(_$EmailImpl(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EmailImpl implements _Email {
  const _$EmailImpl({required this.email});

  factory _$EmailImpl.fromJson(Map<String, dynamic> json) => _$$EmailImplFromJson(json);

  @override
  final String email;

  @override
  String toString() {
    return 'Email(email: $email)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType && other is _$EmailImpl && (identical(other.email, email) || other.email == email));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, email);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EmailImplCopyWith<_$EmailImpl> get copyWith => __$$EmailImplCopyWithImpl<_$EmailImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EmailImplToJson(
      this,
    );
  }
}

abstract class _Email implements Email {
  const factory _Email({required final String email}) = _$EmailImpl;

  factory _Email.fromJson(Map<String, dynamic> json) = _$EmailImpl.fromJson;

  @override
  String get email;
  @override
  @JsonKey(ignore: true)
  _$$EmailImplCopyWith<_$EmailImpl> get copyWith => throw _privateConstructorUsedError;
}

VerificationRes _$VerificationResFromJson(Map<String, dynamic> json) {
  return _VerificationRes.fromJson(json);
}

/// @nodoc
mixin _$VerificationRes {
  int get verification_id => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  int get reference => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $VerificationResCopyWith<VerificationRes> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VerificationResCopyWith<$Res> {
  factory $VerificationResCopyWith(VerificationRes value, $Res Function(VerificationRes) then) = _$VerificationResCopyWithImpl<$Res, VerificationRes>;
  @useResult
  $Res call({int verification_id, String email, int reference});
}

/// @nodoc
class _$VerificationResCopyWithImpl<$Res, $Val extends VerificationRes> implements $VerificationResCopyWith<$Res> {
  _$VerificationResCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? verification_id = null,
    Object? email = null,
    Object? reference = null,
  }) {
    return _then(_value.copyWith(
      verification_id: null == verification_id
          ? _value.verification_id
          : verification_id // ignore: cast_nullable_to_non_nullable
              as int,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      reference: null == reference
          ? _value.reference
          : reference // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$VerificationResImplCopyWith<$Res> implements $VerificationResCopyWith<$Res> {
  factory _$$VerificationResImplCopyWith(_$VerificationResImpl value, $Res Function(_$VerificationResImpl) then) = __$$VerificationResImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int verification_id, String email, int reference});
}

/// @nodoc
class __$$VerificationResImplCopyWithImpl<$Res> extends _$VerificationResCopyWithImpl<$Res, _$VerificationResImpl> implements _$$VerificationResImplCopyWith<$Res> {
  __$$VerificationResImplCopyWithImpl(_$VerificationResImpl _value, $Res Function(_$VerificationResImpl) _then) : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? verification_id = null,
    Object? email = null,
    Object? reference = null,
  }) {
    return _then(_$VerificationResImpl(
      verification_id: null == verification_id
          ? _value.verification_id
          : verification_id // ignore: cast_nullable_to_non_nullable
              as int,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      reference: null == reference
          ? _value.reference
          : reference // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$VerificationResImpl implements _VerificationRes {
  const _$VerificationResImpl({required this.verification_id, required this.email, required this.reference});

  factory _$VerificationResImpl.fromJson(Map<String, dynamic> json) => _$$VerificationResImplFromJson(json);

  @override
  final int verification_id;
  @override
  final String email;
  @override
  final int reference;

  @override
  String toString() {
    return 'VerificationRes(verification_id: $verification_id, email: $email, reference: $reference)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType && other is _$VerificationResImpl && (identical(other.verification_id, verification_id) || other.verification_id == verification_id) && (identical(other.email, email) || other.email == email) && (identical(other.reference, reference) || other.reference == reference));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, verification_id, email, reference);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$VerificationResImplCopyWith<_$VerificationResImpl> get copyWith => __$$VerificationResImplCopyWithImpl<_$VerificationResImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VerificationResImplToJson(
      this,
    );
  }
}

abstract class _VerificationRes implements VerificationRes {
  const factory _VerificationRes({required final int verification_id, required final String email, required final int reference}) = _$VerificationResImpl;

  factory _VerificationRes.fromJson(Map<String, dynamic> json) = _$VerificationResImpl.fromJson;

  @override
  int get verification_id;
  @override
  String get email;
  @override
  int get reference;
  @override
  @JsonKey(ignore: true)
  _$$VerificationResImplCopyWith<_$VerificationResImpl> get copyWith => throw _privateConstructorUsedError;
}

VerificationCode _$VerificationCodeFromJson(Map<String, dynamic> json) {
  return _VerificationCode.fromJson(json);
}

/// @nodoc
mixin _$VerificationCode {
  int get verification_id => throw _privateConstructorUsedError;
  int get reference => throw _privateConstructorUsedError;
  int get code => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $VerificationCodeCopyWith<VerificationCode> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VerificationCodeCopyWith<$Res> {
  factory $VerificationCodeCopyWith(VerificationCode value, $Res Function(VerificationCode) then) = _$VerificationCodeCopyWithImpl<$Res, VerificationCode>;
  @useResult
  $Res call({int verification_id, int reference, int code});
}

/// @nodoc
class _$VerificationCodeCopyWithImpl<$Res, $Val extends VerificationCode> implements $VerificationCodeCopyWith<$Res> {
  _$VerificationCodeCopyWithImpl(this._value, this._then);

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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$VerificationCodeImplCopyWith<$Res> implements $VerificationCodeCopyWith<$Res> {
  factory _$$VerificationCodeImplCopyWith(_$VerificationCodeImpl value, $Res Function(_$VerificationCodeImpl) then) = __$$VerificationCodeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int verification_id, int reference, int code});
}

/// @nodoc
class __$$VerificationCodeImplCopyWithImpl<$Res> extends _$VerificationCodeCopyWithImpl<$Res, _$VerificationCodeImpl> implements _$$VerificationCodeImplCopyWith<$Res> {
  __$$VerificationCodeImplCopyWithImpl(_$VerificationCodeImpl _value, $Res Function(_$VerificationCodeImpl) _then) : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? verification_id = null,
    Object? reference = null,
    Object? code = null,
  }) {
    return _then(_$VerificationCodeImpl(
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
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$VerificationCodeImpl implements _VerificationCode {
  const _$VerificationCodeImpl({required this.verification_id, required this.reference, required this.code});

  factory _$VerificationCodeImpl.fromJson(Map<String, dynamic> json) => _$$VerificationCodeImplFromJson(json);

  @override
  final int verification_id;
  @override
  final int reference;
  @override
  final int code;

  @override
  String toString() {
    return 'VerificationCode(verification_id: $verification_id, reference: $reference, code: $code)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType && other is _$VerificationCodeImpl && (identical(other.verification_id, verification_id) || other.verification_id == verification_id) && (identical(other.reference, reference) || other.reference == reference) && (identical(other.code, code) || other.code == code));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, verification_id, reference, code);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$VerificationCodeImplCopyWith<_$VerificationCodeImpl> get copyWith => __$$VerificationCodeImplCopyWithImpl<_$VerificationCodeImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VerificationCodeImplToJson(
      this,
    );
  }
}

abstract class _VerificationCode implements VerificationCode {
  const factory _VerificationCode({required final int verification_id, required final int reference, required final int code}) = _$VerificationCodeImpl;

  factory _VerificationCode.fromJson(Map<String, dynamic> json) = _$VerificationCodeImpl.fromJson;

  @override
  int get verification_id;
  @override
  int get reference;
  @override
  int get code;
  @override
  @JsonKey(ignore: true)
  _$$VerificationCodeImplCopyWith<_$VerificationCodeImpl> get copyWith => throw _privateConstructorUsedError;
}

CreateNewAccount _$CreateNewAccountFromJson(Map<String, dynamic> json) {
  return _CreateNewAccount.fromJson(json);
}

/// @nodoc
mixin _$CreateNewAccount {
  int get verification_id => throw _privateConstructorUsedError;
  int get reference => throw _privateConstructorUsedError;
  int get code => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CreateNewAccountCopyWith<CreateNewAccount> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateNewAccountCopyWith<$Res> {
  factory $CreateNewAccountCopyWith(CreateNewAccount value, $Res Function(CreateNewAccount) then) = _$CreateNewAccountCopyWithImpl<$Res, CreateNewAccount>;
  @useResult
  $Res call({int verification_id, int reference, int code, String email, String password});
}

/// @nodoc
class _$CreateNewAccountCopyWithImpl<$Res, $Val extends CreateNewAccount> implements $CreateNewAccountCopyWith<$Res> {
  _$CreateNewAccountCopyWithImpl(this._value, this._then);

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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CreateNewAccountImplCopyWith<$Res> implements $CreateNewAccountCopyWith<$Res> {
  factory _$$CreateNewAccountImplCopyWith(_$CreateNewAccountImpl value, $Res Function(_$CreateNewAccountImpl) then) = __$$CreateNewAccountImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int verification_id, int reference, int code, String email, String password});
}

/// @nodoc
class __$$CreateNewAccountImplCopyWithImpl<$Res> extends _$CreateNewAccountCopyWithImpl<$Res, _$CreateNewAccountImpl> implements _$$CreateNewAccountImplCopyWith<$Res> {
  __$$CreateNewAccountImplCopyWithImpl(_$CreateNewAccountImpl _value, $Res Function(_$CreateNewAccountImpl) _then) : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? verification_id = null,
    Object? reference = null,
    Object? code = null,
    Object? email = null,
    Object? password = null,
  }) {
    return _then(_$CreateNewAccountImpl(
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
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CreateNewAccountImpl implements _CreateNewAccount {
  const _$CreateNewAccountImpl({required this.verification_id, required this.reference, required this.code, required this.email, required this.password});

  factory _$CreateNewAccountImpl.fromJson(Map<String, dynamic> json) => _$$CreateNewAccountImplFromJson(json);

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
  String toString() {
    return 'CreateNewAccount(verification_id: $verification_id, reference: $reference, code: $code, email: $email, password: $password)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateNewAccountImpl &&
            (identical(other.verification_id, verification_id) || other.verification_id == verification_id) &&
            (identical(other.reference, reference) || other.reference == reference) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) || other.password == password));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, verification_id, reference, code, email, password);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateNewAccountImplCopyWith<_$CreateNewAccountImpl> get copyWith => __$$CreateNewAccountImplCopyWithImpl<_$CreateNewAccountImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CreateNewAccountImplToJson(
      this,
    );
  }
}

abstract class _CreateNewAccount implements CreateNewAccount {
  const factory _CreateNewAccount({required final int verification_id, required final int reference, required final int code, required final String email, required final String password}) = _$CreateNewAccountImpl;

  factory _CreateNewAccount.fromJson(Map<String, dynamic> json) = _$CreateNewAccountImpl.fromJson;

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
  @JsonKey(ignore: true)
  _$$CreateNewAccountImplCopyWith<_$CreateNewAccountImpl> get copyWith => throw _privateConstructorUsedError;
}

SignIn _$SignInFromJson(Map<String, dynamic> json) {
  return _SignIn.fromJson(json);
}

/// @nodoc
mixin _$SignIn {
  String get email => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SignInCopyWith<SignIn> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignInCopyWith<$Res> {
  factory $SignInCopyWith(SignIn value, $Res Function(SignIn) then) = _$SignInCopyWithImpl<$Res, SignIn>;
  @useResult
  $Res call({String email, String password});
}

/// @nodoc
class _$SignInCopyWithImpl<$Res, $Val extends SignIn> implements $SignInCopyWith<$Res> {
  _$SignInCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? password = null,
  }) {
    return _then(_value.copyWith(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SignInImplCopyWith<$Res> implements $SignInCopyWith<$Res> {
  factory _$$SignInImplCopyWith(_$SignInImpl value, $Res Function(_$SignInImpl) then) = __$$SignInImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String email, String password});
}

/// @nodoc
class __$$SignInImplCopyWithImpl<$Res> extends _$SignInCopyWithImpl<$Res, _$SignInImpl> implements _$$SignInImplCopyWith<$Res> {
  __$$SignInImplCopyWithImpl(_$SignInImpl _value, $Res Function(_$SignInImpl) _then) : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? password = null,
  }) {
    return _then(_$SignInImpl(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SignInImpl implements _SignIn {
  const _$SignInImpl({required this.email, required this.password});

  factory _$SignInImpl.fromJson(Map<String, dynamic> json) => _$$SignInImplFromJson(json);

  @override
  final String email;
  @override
  final String password;

  @override
  String toString() {
    return 'SignIn(email: $email, password: $password)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType && other is _$SignInImpl && (identical(other.email, email) || other.email == email) && (identical(other.password, password) || other.password == password));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, email, password);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SignInImplCopyWith<_$SignInImpl> get copyWith => __$$SignInImplCopyWithImpl<_$SignInImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SignInImplToJson(
      this,
    );
  }
}

abstract class _SignIn implements SignIn {
  const factory _SignIn({required final String email, required final String password}) = _$SignInImpl;

  factory _SignIn.fromJson(Map<String, dynamic> json) = _$SignInImpl.fromJson;

  @override
  String get email;
  @override
  String get password;
  @override
  @JsonKey(ignore: true)
  _$$SignInImplCopyWith<_$SignInImpl> get copyWith => throw _privateConstructorUsedError;
}

Authentication _$AuthenticationFromJson(Map<String, dynamic> json) {
  return _Authentication.fromJson(json);
}

/// @nodoc
mixin _$Authentication {
  int get verification_id => throw _privateConstructorUsedError;
  int get reference => throw _privateConstructorUsedError;
  int get code => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get secondary_email => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;
  String get access_token => throw _privateConstructorUsedError;
  String get refresh_token => throw _privateConstructorUsedError;
  int get users_id => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AuthenticationCopyWith<Authentication> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthenticationCopyWith<$Res> {
  factory $AuthenticationCopyWith(Authentication value, $Res Function(Authentication) then) = _$AuthenticationCopyWithImpl<$Res, Authentication>;
  @useResult
  $Res call({int verification_id, int reference, int code, String email, String secondary_email, String password, String access_token, String refresh_token, int users_id});
}

/// @nodoc
class _$AuthenticationCopyWithImpl<$Res, $Val extends Authentication> implements $AuthenticationCopyWith<$Res> {
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
    Object? secondary_email = null,
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
      secondary_email: null == secondary_email
          ? _value.secondary_email
          : secondary_email // ignore: cast_nullable_to_non_nullable
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
abstract class _$$AuthenticationImplCopyWith<$Res> implements $AuthenticationCopyWith<$Res> {
  factory _$$AuthenticationImplCopyWith(_$AuthenticationImpl value, $Res Function(_$AuthenticationImpl) then) = __$$AuthenticationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int verification_id, int reference, int code, String email, String secondary_email, String password, String access_token, String refresh_token, int users_id});
}

/// @nodoc
class __$$AuthenticationImplCopyWithImpl<$Res> extends _$AuthenticationCopyWithImpl<$Res, _$AuthenticationImpl> implements _$$AuthenticationImplCopyWith<$Res> {
  __$$AuthenticationImplCopyWithImpl(_$AuthenticationImpl _value, $Res Function(_$AuthenticationImpl) _then) : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? verification_id = null,
    Object? reference = null,
    Object? code = null,
    Object? email = null,
    Object? secondary_email = null,
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
      secondary_email: null == secondary_email
          ? _value.secondary_email
          : secondary_email // ignore: cast_nullable_to_non_nullable
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
  const _$AuthenticationImpl({required this.verification_id, required this.reference, required this.code, required this.email, required this.secondary_email, required this.password, required this.access_token, required this.refresh_token, required this.users_id});

  factory _$AuthenticationImpl.fromJson(Map<String, dynamic> json) => _$$AuthenticationImplFromJson(json);

  @override
  final int verification_id;
  @override
  final int reference;
  @override
  final int code;
  @override
  final String email;
  @override
  final String secondary_email;
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
    return 'Authentication(verification_id: $verification_id, reference: $reference, code: $code, email: $email, secondary_email: $secondary_email, password: $password, access_token: $access_token, refresh_token: $refresh_token, users_id: $users_id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthenticationImpl &&
            (identical(other.verification_id, verification_id) || other.verification_id == verification_id) &&
            (identical(other.reference, reference) || other.reference == reference) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.secondary_email, secondary_email) || other.secondary_email == secondary_email) &&
            (identical(other.password, password) || other.password == password) &&
            (identical(other.access_token, access_token) || other.access_token == access_token) &&
            (identical(other.refresh_token, refresh_token) || other.refresh_token == refresh_token) &&
            (identical(other.users_id, users_id) || other.users_id == users_id));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, verification_id, reference, code, email, secondary_email, password, access_token, refresh_token, users_id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthenticationImplCopyWith<_$AuthenticationImpl> get copyWith => __$$AuthenticationImplCopyWithImpl<_$AuthenticationImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AuthenticationImplToJson(
      this,
    );
  }
}

abstract class _Authentication implements Authentication {
  const factory _Authentication({required final int verification_id, required final int reference, required final int code, required final String email, required final String secondary_email, required final String password, required final String access_token, required final String refresh_token, required final int users_id}) = _$AuthenticationImpl;

  factory _Authentication.fromJson(Map<String, dynamic> json) = _$AuthenticationImpl.fromJson;

  @override
  int get verification_id;
  @override
  int get reference;
  @override
  int get code;
  @override
  String get email;
  @override
  String get secondary_email;
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
  _$$AuthenticationImplCopyWith<_$AuthenticationImpl> get copyWith => throw _privateConstructorUsedError;
}
