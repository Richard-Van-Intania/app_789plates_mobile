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
