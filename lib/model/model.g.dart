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

_$ProfileImpl _$$ProfileImplFromJson(Map<String, dynamic> json) => _$ProfileImpl(
      name: json['name'] as String,
      email: json['email'] as String,
      profile_uri: json['profile_uri'] as String?,
      cover_uri: json['cover_uri'] as String?,
      information: json['information'] as String?,
    );

Map<String, dynamic> _$$ProfileImplToJson(_$ProfileImpl instance) => <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'profile_uri': instance.profile_uri,
      'cover_uri': instance.cover_uri,
      'information': instance.information,
    };
