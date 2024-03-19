// ignore_for_file: non_constant_identifier_names
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:http/http.dart';

part 'model.freezed.dart';
part 'model.g.dart';

@freezed
class Email with _$Email {
  const factory Email({
    required String email,
  }) = _Email;
  factory Email.fromJson(Map<String, Object?> json) => _$EmailFromJson(json);
}

@freezed
class VerificationRes with _$VerificationRes {
  const factory VerificationRes({
    required int verification_id,
    required String email,
    required int reference,
  }) = _VerificationRes;

  factory VerificationRes.fromJson(Map<String, Object?> json) => _$VerificationResFromJson(json);
}

@freezed
class VerificationCode with _$VerificationCode {
  const factory VerificationCode({
    required int verification_id,
    required int reference,
    required int code,
  }) = _VerificationCode;

  factory VerificationCode.fromJson(Map<String, Object?> json) => _$VerificationCodeFromJson(json);
}

@freezed
class CreateNewAccount with _$CreateNewAccount {
  const factory CreateNewAccount({
    required int verification_id,
    required int reference,
    required int code,
    required String email,
    required String password,
  }) = _CreateNewAccount;

  factory CreateNewAccount.fromJson(Map<String, Object?> json) => _$CreateNewAccountFromJson(json);
}

@freezed
class SignIn with _$SignIn {
  const factory SignIn({
    required String email,
    required String password,
  }) = _SignIn;

  factory SignIn.fromJson(Map<String, Object?> json) => _$SignInFromJson(json);
}

@freezed
class Authentication with _$Authentication {
  const factory Authentication({
    required int verification_id,
    required int reference,
    required int code,
    required String email,
    required String secondary_email,
    required String password,
    required String access_token,
    required String refresh_token,
    required int users_id,
  }) = _Authentication;

  factory Authentication.fromJson(Map<String, Object?> json) => _$AuthenticationFromJson(json);
}

class UnwrapResponse<T extends Object> {
  UnwrapResponse({required this.statusCode, required this.model});
  final int statusCode;
  final T model;
}
