// ignore_for_file: non_constant_identifier_names
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'constants.dart';
import 'initialize.dart';
import 'package:http/http.dart' as http;

import 'model.dart';

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
  Future<Map<String, String>> build() async {
    return await flutterSecureStorage.readAll();
  }

  Future<void> deleteAll() async {
    await flutterSecureStorage.deleteAll();
    state = const AsyncData(<String, String>{});
  }

  Future<void> write({
    required String? email,
    required String? password,
    required String? access_token,
    required String? refresh_token,
    required int? users_id,
  }) async {
    if (email != null) {
      await flutterSecureStorage.write(key: 'email', value: email);
    }
    if (password != null) {
      await flutterSecureStorage.write(key: 'password', value: password);
    }
    if (access_token != null) {
      await flutterSecureStorage.write(key: 'access_token', value: access_token);
    }
    if (refresh_token != null) {
      await flutterSecureStorage.write(key: 'refresh_token', value: refresh_token);
    }
    if (users_id != null) {
      await flutterSecureStorage.write(key: 'users_id', value: users_id.toString());
    }
    state = AsyncData(await flutterSecureStorage.readAll());
  }
}

@riverpod
class CheckAvailabilityEmail extends _$CheckAvailabilityEmail {
  @override
  Future<UnwrapResponse<Authentication>> build() async {
    return unwrapResponse;
  }

  Future<void> fetch(String email) async {
    final Uri uri = Uri(
      scheme: 'http',
      host: '10.0.2.2',
      port: 8700,
      path: '/create_verification',
      queryParameters: {'api_key': apiKey},
    );
    final response = await http.post(
      uri,
      headers: <String, String>{'Content-Type': 'application/json; charset=UTF-8'},
      body: jsonEncode(Authentication(
        verification_id: nullAliasInt,
        reference: nullAliasInt,
        code: nullAliasInt,
        email: email,
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
      final Uri uri = Uri(
        scheme: 'http',
        host: '10.0.2.2',
        port: 8700,
        path: '/validate_verification',
        queryParameters: {'api_key': apiKey},
      );
      final response = await http.post(
        uri,
        headers: <String, String>{'Content-Type': 'application/json; charset=UTF-8'},
        body: jsonEncode(Authentication(
          verification_id: checkAvailabilityEmail.model.verification_id,
          reference: checkAvailabilityEmail.model.reference,
          code: code,
          email: checkAvailabilityEmail.model.email,
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
    await ref.read(credentialProvider.notifier).deleteAll();
    final checkVerificationCode = await ref.read(checkVerificationCodeProvider.future);
    if (checkVerificationCode.statusCode == 200) {
      final Uri uri = Uri(
        scheme: 'http',
        host: '10.0.2.2',
        port: 8700,
        path: '/create_new_account',
        queryParameters: {'api_key': apiKey},
      );
      final response = await http.post(
        uri,
        headers: <String, String>{'Content-Type': 'application/json; charset=UTF-8'},
        body: jsonEncode(Authentication(
          verification_id: checkVerificationCode.model.verification_id,
          reference: checkVerificationCode.model.reference,
          code: checkVerificationCode.model.code,
          email: checkVerificationCode.model.email,
          password: password,
          access_token: nullAliasString,
          refresh_token: nullAliasString,
          users_id: nullAliasInt,
        ).toJson()),
      );
      if (response.statusCode == 200) {
        final Authentication authentication = Authentication.fromJson(jsonDecode(utf8.decode(response.bodyBytes)));
        await ref.read(credentialProvider.notifier).write(email: authentication.email, password: authentication.password, access_token: authentication.access_token, refresh_token: authentication.refresh_token, users_id: authentication.users_id);
        state = AsyncData(UnwrapResponse<Authentication>(statusCode: response.statusCode, model: authentication));
      } else {
        state = AsyncData(UnwrapResponse<Authentication>(
          statusCode: response.statusCode,
          model: Authentication(
            verification_id: checkVerificationCode.model.verification_id,
            reference: checkVerificationCode.model.reference,
            code: checkVerificationCode.model.code,
            email: checkVerificationCode.model.email,
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
    final Uri uri = Uri(
      scheme: 'http',
      host: '10.0.2.2',
      port: 8700,
      path: '/sign_in',
      queryParameters: {'api_key': apiKey},
    );
    final response = await http.post(
      uri,
      headers: <String, String>{'Content-Type': 'application/json; charset=UTF-8'},
      body: jsonEncode(Authentication(
        verification_id: nullAliasInt,
        reference: nullAliasInt,
        code: nullAliasInt,
        email: email,
        password: password,
        access_token: nullAliasString,
        refresh_token: nullAliasString,
        users_id: nullAliasInt,
      ).toJson()),
    );
    if (response.statusCode == 200) {
      final Authentication authentication = Authentication.fromJson(jsonDecode(utf8.decode(response.bodyBytes)));
      await ref.read(credentialProvider.notifier).deleteAll();
      await ref.read(credentialProvider.notifier).write(email: authentication.email, password: authentication.password, access_token: authentication.access_token, refresh_token: authentication.refresh_token, users_id: authentication.users_id);
      state = AsyncData(UnwrapResponse<Authentication>(statusCode: response.statusCode, model: authentication));
    } else {
      state = AsyncData(UnwrapResponse<Authentication>(
        statusCode: response.statusCode,
        model: Authentication(
          verification_id: nullAliasInt,
          reference: nullAliasInt,
          code: nullAliasInt,
          email: email,
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
    final Uri uri = Uri(
      scheme: 'http',
      host: '10.0.2.2',
      port: 8700,
      path: '/create_verification_forgot',
      queryParameters: {'api_key': apiKey},
    );
    final response = await http.post(
      uri,
      headers: <String, String>{'Content-Type': 'application/json; charset=UTF-8'},
      body: jsonEncode(Authentication(
        verification_id: nullAliasInt,
        reference: nullAliasInt,
        code: nullAliasInt,
        email: email,
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
      final Uri uri = Uri(
        scheme: 'http',
        host: '10.0.2.2',
        port: 8700,
        path: '/validate_verification',
        queryParameters: {'api_key': apiKey},
      );
      final response = await http.post(
        uri,
        headers: <String, String>{'Content-Type': 'application/json; charset=UTF-8'},
        body: jsonEncode(Authentication(
          verification_id: forgotPassword.model.verification_id,
          reference: forgotPassword.model.reference,
          code: code,
          email: forgotPassword.model.email,
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
    await ref.read(credentialProvider.notifier).deleteAll();
    final checkVerificationCodeForgot = await ref.read(checkVerificationCodeForgotProvider.future);
    if (checkVerificationCodeForgot.statusCode == 200) {
      final Uri uri = Uri(
        scheme: 'http',
        host: '10.0.2.2',
        port: 8700,
        path: '/reset_password',
        queryParameters: {'api_key': apiKey},
      );
      final response = await http.put(
        uri,
        headers: <String, String>{'Content-Type': 'application/json; charset=UTF-8'},
        body: jsonEncode(Authentication(
          verification_id: checkVerificationCodeForgot.model.verification_id,
          reference: checkVerificationCodeForgot.model.reference,
          code: checkVerificationCodeForgot.model.code,
          email: checkVerificationCodeForgot.model.email,
          password: password,
          access_token: nullAliasString,
          refresh_token: nullAliasString,
          users_id: nullAliasInt,
        ).toJson()),
      );
      if (response.statusCode == 200) {
        final Authentication authentication = Authentication.fromJson(jsonDecode(utf8.decode(response.bodyBytes)));
        await ref.read(credentialProvider.notifier).write(email: authentication.email, password: authentication.password, access_token: authentication.access_token, refresh_token: authentication.refresh_token, users_id: authentication.users_id);
        state = AsyncData(UnwrapResponse<Authentication>(statusCode: response.statusCode, model: authentication));
      } else {
        state = AsyncData(UnwrapResponse<Authentication>(
          statusCode: response.statusCode,
          model: Authentication(
            verification_id: checkVerificationCodeForgot.model.verification_id,
            reference: checkVerificationCodeForgot.model.reference,
            code: checkVerificationCodeForgot.model.code,
            email: checkVerificationCodeForgot.model.email,
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

  Future<void> fetch() async {
    final credential = await ref.read(credentialProvider.future);
    final access_token = credential['access_token'];
    final refresh_token = credential['refresh_token'];
    if (access_token != null && refresh_token != null) {
      final Uri uri = Uri(
        scheme: 'http',
        host: '10.0.2.2',
        port: 8700,
        path: '/renew_token',
        queryParameters: {'api_key': apiKey},
      );
      final response = await http.post(
        uri,
        headers: <String, String>{'Content-Type': 'application/json; charset=UTF-8'},
        body: jsonEncode(Authentication(
          verification_id: nullAliasInt,
          reference: nullAliasInt,
          code: nullAliasInt,
          email: nullAliasString,
          password: nullAliasString,
          access_token: access_token,
          refresh_token: refresh_token,
          users_id: nullAliasInt,
        ).toJson()),
      );
      if (response.statusCode == 200) {
        final Authentication authentication = Authentication.fromJson(jsonDecode(utf8.decode(response.bodyBytes)));
        await ref.read(credentialProvider.notifier).write(email: null, password: null, access_token: authentication.access_token, refresh_token: authentication.refresh_token, users_id: null);
        state = AsyncData(UnwrapResponse<Authentication>(statusCode: response.statusCode, model: authentication));
      } else if (response.statusCode == 401) {
        final email = credential['email'];
        final password = credential['password'];
        if (email != null && password != null) {
          final Uri uri = Uri(
            scheme: 'http',
            host: '10.0.2.2',
            port: 8700,
            path: '/sign_in',
            queryParameters: {'api_key': apiKey},
          );
          final response = await http.post(
            uri,
            headers: <String, String>{'Content-Type': 'application/json; charset=UTF-8'},
            body: jsonEncode(Authentication(
              verification_id: nullAliasInt,
              reference: nullAliasInt,
              code: nullAliasInt,
              email: email,
              password: password,
              access_token: nullAliasString,
              refresh_token: nullAliasString,
              users_id: nullAliasInt,
            ).toJson()),
          );
          if (response.statusCode == 200) {
            final Authentication authentication = Authentication.fromJson(jsonDecode(utf8.decode(response.bodyBytes)));
            await ref.read(credentialProvider.notifier).deleteAll();
            await ref.read(credentialProvider.notifier).write(email: authentication.email, password: authentication.password, access_token: authentication.access_token, refresh_token: authentication.refresh_token, users_id: authentication.users_id);
            state = AsyncData(UnwrapResponse<Authentication>(statusCode: response.statusCode, model: authentication));
          } else {
            await ref.read(credentialProvider.notifier).deleteAll();
            state = AsyncData(UnwrapResponse<Authentication>(
              statusCode: response.statusCode,
              model: Authentication(
                verification_id: nullAliasInt,
                reference: nullAliasInt,
                code: nullAliasInt,
                email: email,
                password: password,
                access_token: nullAliasString,
                refresh_token: nullAliasString,
                users_id: nullAliasInt,
              ),
            ));
          }
        } else {
          await ref.read(credentialProvider.notifier).deleteAll();
          state = const AsyncData(unwrapResponse);
        }
      } else {
        await ref.read(credentialProvider.notifier).deleteAll();
        state = const AsyncData(unwrapResponse);
      }
    } else {
      await ref.read(credentialProvider.notifier).deleteAll();
      state = const AsyncData(unwrapResponse);
    }
  }
}

// here jaa

@Riverpod(keepAlive: true)
Future<UnwrapResponse<Authentication>> autoSignIn(AutoSignInRef ref) async {
  final credential = await ref.read(credentialProvider.future);
  final email = credential['email'];
  final password = credential['password'];
  if (email != null && password != null) {
    final Uri uri = Uri(
      scheme: 'http',
      host: '10.0.2.2',
      port: 8700,
      path: '/sign_in',
      queryParameters: {'api_key': apiKey},
    );
    final response = await http.post(
      uri,
      headers: <String, String>{'Content-Type': 'application/json; charset=UTF-8'},
      body: jsonEncode(Authentication(
        verification_id: nullAliasInt,
        reference: nullAliasInt,
        code: nullAliasInt,
        email: email,
        password: password,
        access_token: nullAliasString,
        refresh_token: nullAliasString,
        users_id: nullAliasInt,
      ).toJson()),
    );
    if (response.statusCode == 200) {
      final Authentication authentication = Authentication.fromJson(jsonDecode(utf8.decode(response.bodyBytes)));
      await ref.read(credentialProvider.notifier).deleteAll();
      await ref.read(credentialProvider.notifier).write(email: authentication.email, password: authentication.password, access_token: authentication.access_token, refresh_token: authentication.refresh_token, users_id: authentication.users_id);
      return UnwrapResponse<Authentication>(statusCode: response.statusCode, model: authentication);
    } else {
      // await ref.read(credentialProvider.notifier).deleteAll();
      // internal server error
      return UnwrapResponse<Authentication>(
        statusCode: response.statusCode,
        model: Authentication(
          verification_id: nullAliasInt,
          reference: nullAliasInt,
          code: nullAliasInt,
          email: email,
          password: password,
          access_token: nullAliasString,
          refresh_token: nullAliasString,
          users_id: nullAliasInt,
        ),
      );
    }
  } else {
    await ref.read(credentialProvider.notifier).deleteAll();
    return unwrapResponse;
  }
}

@riverpod
class Search extends _$Search {
  @override
  Future<String> build() async {
    return 'start';
  }

  Future<void> fetch(String query) async {
    final credential = await ref.read(credentialProvider.future);
    final access_token = credential['access_token'];
    final users_id = credential['users_id'];
    if (access_token != null && users_id != null) {
      final Uri uri = Uri(
        scheme: 'http',
        host: '10.0.2.2',
        port: 8700,
        path: '/search',
        queryParameters: {
          'users_id': int.parse(users_id),
          'query': query,
        },
      );
      final response = await http.get(
        uri,
        headers: <String, String>{'Content-Type': 'application/json; charset=UTF-8', HttpHeaders.authorizationHeader: 'Bearer $access_token'},
      );
      if (response.statusCode == 200) {
        state = AsyncData(response.body);
      } else if (response.statusCode == 401) {
        await ref.read(renewTokenProvider.notifier).fetch();
        ref.read(searchProvider.notifier).fetch(query);
      } else {
        // await ref.read(credentialProvider.notifier).deleteAll();
        // other error
        state = const AsyncData('sign out');
      }
    } else {
      await ref.read(credentialProvider.notifier).deleteAll();
      state = const AsyncData('sign out');
    }
  }
}
