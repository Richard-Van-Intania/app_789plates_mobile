// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AuthenticationImpl _$$AuthenticationImplFromJson(Map<String, dynamic> json) => _$AuthenticationImpl(
      verification_id: json['verification_id'] as int,
      reference: json['reference'] as int,
      code: json['code'] as int,
      email: json['email'] as String,
      secondary_email: json['secondary_email'] as String,
      password: json['password'] as String,
      access_token: json['access_token'] as String,
      refresh_token: json['refresh_token'] as String,
      users_id: json['users_id'] as int,
    );

Map<String, dynamic> _$$AuthenticationImplToJson(_$AuthenticationImpl instance) => <String, dynamic>{
      'verification_id': instance.verification_id,
      'reference': instance.reference,
      'code': instance.code,
      'email': instance.email,
      'secondary_email': instance.secondary_email,
      'password': instance.password,
      'access_token': instance.access_token,
      'refresh_token': instance.refresh_token,
      'users_id': instance.users_id,
    };
