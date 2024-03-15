import 'package:freezed_annotation/freezed_annotation.dart';

part 'model.freezed.dart';
part 'model.g.dart';

@freezed
class Email with _$Email {
  const factory Email({required String email}) = _Email;
  factory Email.fromJson(Map<String, Object> json) => _$EmailFromJson(json);
}
