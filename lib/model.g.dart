// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EmailImpl _$$EmailImplFromJson(Map<String, dynamic> json) => _$EmailImpl(
      email: json['email'] as String,
    );

Map<String, dynamic> _$$EmailImplToJson(_$EmailImpl instance) => <String, dynamic>{
      'email': instance.email,
    };

_$VerificationResImpl _$$VerificationResImplFromJson(Map<String, dynamic> json) => _$VerificationResImpl(
      verification_id: json['verification_id'] as int,
      email: json['email'] as String,
      reference: json['reference'] as int,
    );

Map<String, dynamic> _$$VerificationResImplToJson(_$VerificationResImpl instance) => <String, dynamic>{
      'verification_id': instance.verification_id,
      'email': instance.email,
      'reference': instance.reference,
    };

_$VerificationCodeImpl _$$VerificationCodeImplFromJson(Map<String, dynamic> json) => _$VerificationCodeImpl(
      verification_id: json['verification_id'] as int,
      reference: json['reference'] as int,
      code: json['code'] as int,
    );

Map<String, dynamic> _$$VerificationCodeImplToJson(_$VerificationCodeImpl instance) => <String, dynamic>{
      'verification_id': instance.verification_id,
      'reference': instance.reference,
      'code': instance.code,
    };

_$CreateNewAccountImpl _$$CreateNewAccountImplFromJson(Map<String, dynamic> json) => _$CreateNewAccountImpl(
      verification_id: json['verification_id'] as int,
      reference: json['reference'] as int,
      code: json['code'] as int,
      email: json['email'] as String,
      password: json['password'] as String,
    );

Map<String, dynamic> _$$CreateNewAccountImplToJson(_$CreateNewAccountImpl instance) => <String, dynamic>{
      'verification_id': instance.verification_id,
      'reference': instance.reference,
      'code': instance.code,
      'email': instance.email,
      'password': instance.password,
    };

_$SignInImpl _$$SignInImplFromJson(Map<String, dynamic> json) => _$SignInImpl(
      email: json['email'] as String,
      password: json['password'] as String,
    );

Map<String, dynamic> _$$SignInImplToJson(_$SignInImpl instance) => <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
    };
