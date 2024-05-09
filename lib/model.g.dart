// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AuthenticationImpl _$$AuthenticationImplFromJson(Map<String, dynamic> json) => _$AuthenticationImpl(
      verification_id: (json['verification_id'] as num).toInt(),
      reference: (json['reference'] as num).toInt(),
      code: (json['code'] as num).toInt(),
      email: json['email'] as String,
      password: json['password'] as String,
      access_token: json['access_token'] as String,
      refresh_token: json['refresh_token'] as String,
      users_id: (json['users_id'] as num).toInt(),
    );

Map<String, dynamic> _$$AuthenticationImplToJson(_$AuthenticationImpl instance) => <String, dynamic>{
      'verification_id': instance.verification_id,
      'reference': instance.reference,
      'code': instance.code,
      'email': instance.email,
      'password': instance.password,
      'access_token': instance.access_token,
      'refresh_token': instance.refresh_token,
      'users_id': instance.users_id,
    };
