// ignore_for_file: non_constant_identifier_names
import 'package:freezed_annotation/freezed_annotation.dart';

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
