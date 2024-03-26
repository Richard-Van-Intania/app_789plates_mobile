// ignore_for_file: non_constant_identifier_names
import 'dart:convert';
import 'dart:io';
import 'package:app_789plates_mobile/constants.dart';
import 'package:app_789plates_mobile/model.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'initialize.dart';
import 'package:http/http.dart' as http;

part 'provider.g.dart';

@riverpod
class LocaleUpdate extends _$LocaleUpdate {
  @override
  Locale build() {
    final String? languageCode = prefs.getString('languageCode');
    return languageCode == null ? const Locale('en') : Locale(languageCode);
  }

  void updateLocale(Locale locale) {
    prefs.setString('languageCode', locale.languageCode);
    state = locale;
  }
}

@riverpod
class TabIndex extends _$TabIndex {
  @override
  int build() => 0;
  void updateTabIndex(int index) => state = index;
}

@riverpod
class DrawerIndex extends _$DrawerIndex {
  @override
  int build() => 0;
  void updateDrawerIndex(int index) => state = index;
}

@riverpod
class ThemeModeUpdate extends _$ThemeModeUpdate {
  @override
  ThemeMode build() {
    final String? themeMode = prefs.getString('themeMode');
    if (themeMode == null) {
      return ThemeMode.system;
    } else {
      switch (themeMode) {
        case 'system':
          return ThemeMode.system;
        case 'light':
          return ThemeMode.light;
        case 'dark':
          return ThemeMode.dark;
        default:
          return ThemeMode.system;
      }
    }
  }

  void updateThemeMode(ThemeMode themeMode) {
    prefs.setString('themeMode', themeMode.name);
    state = themeMode;
  }
}

@Riverpod(keepAlive: true)
class Credential extends _$Credential {
  @override
  Future<Authentication> build() async {
    final secureStorage = await flutterSecureStorage.readAll();
    return Authentication(
      verification_id: nullAliasInt,
      reference: nullAliasInt,
      code: nullAliasInt,
      email: secureStorage['email'] ?? nullAliasString,
      secondary_email: secureStorage['secondary_email'] ?? nullAliasString,
      password: secureStorage['password'] ?? nullAliasString,
      access_token: secureStorage['access_token'] ?? nullAliasString,
      refresh_token: secureStorage['refresh_token'] ?? nullAliasString,
      users_id: secureStorage['users_id'] == null ? nullAliasInt : int.parse(secureStorage['users_id']!),
    );
  }

  Future<void> deleteAll() async {
    await flutterSecureStorage.deleteAll();
    state = const AsyncData(authentication);
  }

  Future<void> write({required Authentication authentication}) async {
    if (authentication.email != nullAliasString) {
      await flutterSecureStorage.write(key: 'email', value: authentication.email);
    }
    if (authentication.secondary_email != nullAliasString) {
      await flutterSecureStorage.write(key: 'secondary_email', value: authentication.secondary_email);
    }
    if (authentication.password != nullAliasString) {
      await flutterSecureStorage.write(key: 'password', value: authentication.password);
    }
    if (authentication.access_token != nullAliasString) {
      await flutterSecureStorage.write(key: 'access_token', value: authentication.access_token);
    }
    if (authentication.refresh_token != nullAliasString) {
      await flutterSecureStorage.write(key: 'refresh_token', value: authentication.refresh_token);
    }
    if (authentication.users_id != nullAliasInt) {
      await flutterSecureStorage.write(key: 'users_id', value: authentication.users_id.toString());
    }
    final secureStorage = await flutterSecureStorage.readAll();
    state = AsyncData(Authentication(
      verification_id: nullAliasInt,
      reference: nullAliasInt,
      code: nullAliasInt,
      email: secureStorage['email'] ?? nullAliasString,
      secondary_email: secureStorage['secondary_email'] ?? nullAliasString,
      password: secureStorage['password'] ?? nullAliasString,
      access_token: secureStorage['access_token'] ?? nullAliasString,
      refresh_token: secureStorage['refresh_token'] ?? nullAliasString,
      users_id: secureStorage['users_id'] == null ? nullAliasInt : int.parse(secureStorage['users_id']!),
    ));
  }
}

@riverpod
class CheckAvailabilityEmail extends _$CheckAvailabilityEmail {
  @override
  Future<UnwrapResponse<Authentication>> build() async {
    return unwrapResponse;
  }

  Future<void> fetch(String email) async {
    final Uri uri = Uri(scheme: 'http', host: '10.0.2.2', port: 8700, path: '/checkavailabilityemail');
    final response = await http.post(
      uri,
      headers: <String, String>{'Content-Type': 'application/json; charset=UTF-8'},
      body: jsonEncode(Authentication(
        verification_id: nullAliasInt,
        reference: nullAliasInt,
        code: nullAliasInt,
        email: email,
        secondary_email: nullAliasString,
        password: nullAliasString,
        access_token: nullAliasString,
        refresh_token: nullAliasString,
        users_id: nullAliasInt,
      ).toJson()),
    );
    if (response.statusCode == 200) {
      final Authentication authentication = Authentication.fromJson(jsonDecode(utf8.decode(response.bodyBytes)));
      state = AsyncData(UnwrapResponse<Authentication>(statusCode: response.statusCode, model: authentication));
    } else {
      state = AsyncData(UnwrapResponse<Authentication>(
        statusCode: response.statusCode,
        model: Authentication(
          verification_id: nullAliasInt,
          reference: nullAliasInt,
          code: nullAliasInt,
          email: email,
          secondary_email: nullAliasString,
          password: nullAliasString,
          access_token: nullAliasString,
          refresh_token: nullAliasString,
          users_id: nullAliasInt,
        ),
      ));
    }
  }
}

@riverpod
class CheckVerificationCode extends _$CheckVerificationCode {
  @override
  Future<UnwrapResponse<Authentication>> build() async {
    return unwrapResponse;
  }

  Future<void> fetch(int code) async {
    final checkAvailabilityEmail = await ref.read(checkAvailabilityEmailProvider.future);
    if (checkAvailabilityEmail.statusCode == 200) {
      final Uri uri = Uri(scheme: 'http', host: '10.0.2.2', port: 8700, path: '/checkverificationcode');
      final response = await http.post(
        uri,
        headers: <String, String>{'Content-Type': 'application/json; charset=UTF-8'},
        body: jsonEncode(Authentication(
          verification_id: checkAvailabilityEmail.model.verification_id,
          reference: checkAvailabilityEmail.model.reference,
          code: code,
          email: checkAvailabilityEmail.model.email,
          secondary_email: nullAliasString,
          password: nullAliasString,
          access_token: nullAliasString,
          refresh_token: nullAliasString,
          users_id: nullAliasInt,
        ).toJson()),
      );
      if (response.statusCode == 200) {
        final Authentication authentication = Authentication.fromJson(jsonDecode(utf8.decode(response.bodyBytes)));
        state = AsyncData(UnwrapResponse<Authentication>(statusCode: response.statusCode, model: authentication));
      } else {
        state = AsyncData(UnwrapResponse<Authentication>(
          statusCode: response.statusCode,
          model: Authentication(
            verification_id: checkAvailabilityEmail.model.verification_id,
            reference: checkAvailabilityEmail.model.reference,
            code: code,
            email: checkAvailabilityEmail.model.email,
            secondary_email: nullAliasString,
            password: nullAliasString,
            access_token: nullAliasString,
            refresh_token: nullAliasString,
            users_id: nullAliasInt,
          ),
        ));
      }
    }
  }
}

@riverpod
class CreateNewAccount extends _$CreateNewAccount {
  @override
  Future<UnwrapResponse<Authentication>> build() async {
    return unwrapResponse;
  }

  Future<void> fetch(String password) async {
    final checkVerificationCode = await ref.read(checkVerificationCodeProvider.future);
    if (checkVerificationCode.statusCode == 200) {
      final Uri uri = Uri(scheme: 'http', host: '10.0.2.2', port: 8700, path: '/createnewaccount');
      final response = await http.post(
        uri,
        headers: <String, String>{'Content-Type': 'application/json; charset=UTF-8'},
        body: jsonEncode(Authentication(
          verification_id: checkVerificationCode.model.verification_id,
          reference: checkVerificationCode.model.reference,
          code: checkVerificationCode.model.code,
          email: checkVerificationCode.model.email,
          secondary_email: nullAliasString,
          password: password,
          access_token: nullAliasString,
          refresh_token: nullAliasString,
          users_id: nullAliasInt,
        ).toJson()),
      );
      if (response.statusCode == 200) {
        final Authentication authentication = Authentication.fromJson(jsonDecode(utf8.decode(response.bodyBytes)));
        await ref.read(credentialProvider.notifier).deleteAll();
        await ref.read(credentialProvider.notifier).write(authentication: authentication);
        state = AsyncData(UnwrapResponse<Authentication>(statusCode: response.statusCode, model: authentication));
      } else {
        state = AsyncData(UnwrapResponse<Authentication>(
          statusCode: response.statusCode,
          model: Authentication(
            verification_id: checkVerificationCode.model.verification_id,
            reference: checkVerificationCode.model.reference,
            code: checkVerificationCode.model.code,
            email: checkVerificationCode.model.email,
            secondary_email: nullAliasString,
            password: password,
            access_token: nullAliasString,
            refresh_token: nullAliasString,
            users_id: nullAliasInt,
          ),
        ));
      }
    }
  }
}

@riverpod
class SignIn extends _$SignIn {
  @override
  Future<UnwrapResponse<Authentication>> build() async {
    return unwrapResponse;
  }

  Future<void> fetch(String email, String password) async {
    final Uri uri = Uri(scheme: 'http', host: '10.0.2.2', port: 8700, path: '/signin');
    final response = await http.post(
      uri,
      headers: <String, String>{'Content-Type': 'application/json; charset=UTF-8'},
      body: jsonEncode(Authentication(
        verification_id: nullAliasInt,
        reference: nullAliasInt,
        code: nullAliasInt,
        email: email,
        secondary_email: nullAliasString,
        password: password,
        access_token: nullAliasString,
        refresh_token: nullAliasString,
        users_id: nullAliasInt,
      ).toJson()),
    );
    if (response.statusCode == 200) {
      final Authentication authentication = Authentication.fromJson(jsonDecode(utf8.decode(response.bodyBytes)));
      await ref.read(credentialProvider.notifier).deleteAll();
      await ref.read(credentialProvider.notifier).write(authentication: authentication);
      state = AsyncData(UnwrapResponse<Authentication>(statusCode: response.statusCode, model: authentication));
    } else {
      state = AsyncData(UnwrapResponse<Authentication>(
        statusCode: response.statusCode,
        model: Authentication(
          verification_id: nullAliasInt,
          reference: nullAliasInt,
          code: nullAliasInt,
          email: email,
          secondary_email: nullAliasString,
          password: password,
          access_token: nullAliasString,
          refresh_token: nullAliasString,
          users_id: nullAliasInt,
        ),
      ));
    }
  }
}

@riverpod
class ForgotPassword extends _$ForgotPassword {
  @override
  Future<UnwrapResponse<Authentication>> build() async {
    return unwrapResponse;
  }

  Future<void> fetch(String email) async {
    final Uri uri = Uri(scheme: 'http', host: '10.0.2.2', port: 8700, path: '/forgotpassword');
    final response = await http.post(
      uri,
      headers: <String, String>{'Content-Type': 'application/json; charset=UTF-8'},
      body: jsonEncode(Authentication(
        verification_id: nullAliasInt,
        reference: nullAliasInt,
        code: nullAliasInt,
        email: email,
        secondary_email: nullAliasString,
        password: nullAliasString,
        access_token: nullAliasString,
        refresh_token: nullAliasString,
        users_id: nullAliasInt,
      ).toJson()),
    );
    if (response.statusCode == 200) {
      final Authentication authentication = Authentication.fromJson(jsonDecode(utf8.decode(response.bodyBytes)));
      state = AsyncData(UnwrapResponse<Authentication>(statusCode: response.statusCode, model: authentication));
    } else {
      state = AsyncData(UnwrapResponse<Authentication>(
        statusCode: response.statusCode,
        model: Authentication(
          verification_id: nullAliasInt,
          reference: nullAliasInt,
          code: nullAliasInt,
          email: email,
          secondary_email: nullAliasString,
          password: nullAliasString,
          access_token: nullAliasString,
          refresh_token: nullAliasString,
          users_id: nullAliasInt,
        ),
      ));
    }
  }
}

@riverpod
class CheckVerificationCodeForgot extends _$CheckVerificationCodeForgot {
  @override
  Future<UnwrapResponse<Authentication>> build() async {
    return unwrapResponse;
  }

  Future<void> fetch(int code) async {
    final forgotPassword = await ref.read(forgotPasswordProvider.future);
    if (forgotPassword.statusCode == 200) {
      final Uri uri = Uri(scheme: 'http', host: '10.0.2.2', port: 8700, path: '/checkverificationcode');
      final response = await http.post(
        uri,
        headers: <String, String>{'Content-Type': 'application/json; charset=UTF-8'},
        body: jsonEncode(Authentication(
          verification_id: forgotPassword.model.verification_id,
          reference: forgotPassword.model.reference,
          code: code,
          email: forgotPassword.model.email,
          secondary_email: nullAliasString,
          password: nullAliasString,
          access_token: nullAliasString,
          refresh_token: nullAliasString,
          users_id: nullAliasInt,
        ).toJson()),
      );
      if (response.statusCode == 200) {
        final Authentication authentication = Authentication.fromJson(jsonDecode(utf8.decode(response.bodyBytes)));
        state = AsyncData(UnwrapResponse<Authentication>(statusCode: response.statusCode, model: authentication));
      } else {
        state = AsyncData(UnwrapResponse<Authentication>(
          statusCode: response.statusCode,
          model: Authentication(
            verification_id: forgotPassword.model.verification_id,
            reference: forgotPassword.model.reference,
            code: code,
            email: forgotPassword.model.email,
            secondary_email: nullAliasString,
            password: nullAliasString,
            access_token: nullAliasString,
            refresh_token: nullAliasString,
            users_id: nullAliasInt,
          ),
        ));
      }
    }
  }
}

@riverpod
class ResetPassword extends _$ResetPassword {
  @override
  Future<UnwrapResponse<Authentication>> build() async {
    return unwrapResponse;
  }

  Future<void> fetch(String password) async {
    final checkVerificationCodeForgot = await ref.read(checkVerificationCodeForgotProvider.future);
    if (checkVerificationCodeForgot.statusCode == 200) {
      final Uri uri = Uri(scheme: 'http', host: '10.0.2.2', port: 8700, path: '/resetpassword');
      final response = await http.put(
        uri,
        headers: <String, String>{'Content-Type': 'application/json; charset=UTF-8'},
        body: jsonEncode(Authentication(
          verification_id: checkVerificationCodeForgot.model.verification_id,
          reference: checkVerificationCodeForgot.model.reference,
          code: checkVerificationCodeForgot.model.code,
          email: checkVerificationCodeForgot.model.email,
          secondary_email: nullAliasString,
          password: password,
          access_token: nullAliasString,
          refresh_token: nullAliasString,
          users_id: nullAliasInt,
        ).toJson()),
      );
      if (response.statusCode == 200) {
        final Authentication authentication = Authentication.fromJson(jsonDecode(utf8.decode(response.bodyBytes)));
        await ref.read(credentialProvider.notifier).deleteAll();
        await ref.read(credentialProvider.notifier).write(authentication: authentication);
        state = AsyncData(UnwrapResponse<Authentication>(statusCode: response.statusCode, model: authentication));
      } else {
        state = AsyncData(UnwrapResponse<Authentication>(
          statusCode: response.statusCode,
          model: Authentication(
            verification_id: checkVerificationCodeForgot.model.verification_id,
            reference: checkVerificationCodeForgot.model.reference,
            code: checkVerificationCodeForgot.model.code,
            email: checkVerificationCodeForgot.model.email,
            secondary_email: nullAliasString,
            password: password,
            access_token: nullAliasString,
            refresh_token: nullAliasString,
            users_id: nullAliasInt,
          ),
        ));
      }
    }
  }
}

@riverpod
class RenewToken extends _$RenewToken {
  @override
  Future<UnwrapResponse<Authentication>> build() async {
    return unwrapResponse;
  }

  Future<void> renewToken() async {
    final credential = await ref.read(credentialProvider.future);
    final Uri uri = Uri(scheme: 'http', host: '10.0.2.2', port: 8700, path: '/renewtoken');
    final response = await http.post(
      uri,
      headers: <String, String>{'Content-Type': 'application/json; charset=UTF-8'},
      body: jsonEncode(Authentication(
        verification_id: nullAliasInt,
        reference: nullAliasInt,
        code: nullAliasInt,
        email: nullAliasString,
        secondary_email: nullAliasString,
        password: nullAliasString,
        access_token: credential.access_token,
        refresh_token: credential.refresh_token,
        users_id: nullAliasInt,
      ).toJson()),
    );
    if (response.statusCode == 200) {
      final Authentication authentication = Authentication.fromJson(jsonDecode(utf8.decode(response.bodyBytes)));
      await ref.read(credentialProvider.notifier).write(authentication: authentication);
      state = AsyncData(UnwrapResponse<Authentication>(statusCode: response.statusCode, model: authentication));
    } else if (response.statusCode == 401) {
      final Uri uri = Uri(scheme: 'http', host: '10.0.2.2', port: 8700, path: '/signin');
      final response = await http.post(
        uri,
        headers: <String, String>{'Content-Type': 'application/json; charset=UTF-8'},
        body: jsonEncode(Authentication(
          verification_id: nullAliasInt,
          reference: nullAliasInt,
          code: nullAliasInt,
          email: credential.email,
          secondary_email: nullAliasString,
          password: credential.password,
          access_token: nullAliasString,
          refresh_token: nullAliasString,
          users_id: nullAliasInt,
        ).toJson()),
      );
      if (response.statusCode == 200) {
        final Authentication authentication = Authentication.fromJson(jsonDecode(utf8.decode(response.bodyBytes)));
        await ref.read(credentialProvider.notifier).deleteAll();
        await ref.read(credentialProvider.notifier).write(authentication: authentication);
        state = AsyncData(UnwrapResponse<Authentication>(statusCode: response.statusCode, model: authentication));
      } else {
        state = AsyncData(UnwrapResponse<Authentication>(
          statusCode: response.statusCode,
          model: Authentication(
            verification_id: nullAliasInt,
            reference: nullAliasInt,
            code: nullAliasInt,
            email: credential.email,
            secondary_email: nullAliasString,
            password: credential.password,
            access_token: nullAliasString,
            refresh_token: nullAliasString,
            users_id: nullAliasInt,
          ),
        ));
      }
    } else {
      state = const AsyncData(unwrapResponse);
    }
  }
}

@riverpod
class Search extends _$Search {
  @override
  Future<String> build() async {
    return 'start';
  }

  Future<void> fetch(String query) async {}
}
