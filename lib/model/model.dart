// ignore_for_file: non_constant_identifier_names
import 'package:freezed_annotation/freezed_annotation.dart';
import '../initialize.dart';

part 'model.freezed.dart';
part 'model.g.dart';

@freezed
class Authentication with _$Authentication {
  const factory Authentication({
    required int verification_id,
    required int reference,
    required int code,
    required String email,
    required String password,
    required String access_token,
    required String refresh_token,
    required int users_id,
  }) = _Authentication;

  factory Authentication.fromJson(Map<String, Object?> json) => _$AuthenticationFromJson(json);
}

@freezed
class Profile with _$Profile {
  const factory Profile({
    required String name,
    required String email,
    required String? profile_uri,
    required String? cover_uri,
    required String? information,
  }) = _Profile;

  factory Profile.fromJson(Map<String, Object?> json) => _$ProfileFromJson(json);
}

class UnwrapResponse<M extends Object> {
  const UnwrapResponse({required this.statusCode, required this.model});
  final int statusCode;
  final M model;
}

const UnwrapResponse<Authentication> unwrapResponse = UnwrapResponse<Authentication>(
  statusCode: nullAliasInt,
  model: Authentication(
    verification_id: nullAliasInt,
    reference: nullAliasInt,
    code: nullAliasInt,
    email: nullAliasString,
    password: nullAliasString,
    access_token: nullAliasString,
    refresh_token: nullAliasString,
    users_id: nullAliasInt,
  ),
);
