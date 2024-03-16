import 'dart:convert';

import 'package:app_789plates_mobile/model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'initialize.dart';
import 'package:http/http.dart' as http;

part 'provider.g.dart';

final initResponse = Response('', 100);

@riverpod
class LocaleUpdate extends _$LocaleUpdate {
  @override
  Locale build() {
    final String? languageCode = prefs.getString('languageCode');
    return languageCode == null ? const Locale('en') : Locale(languageCode);
  }

  Future<void> updateLocale(Locale locale) async {
    await prefs.setString('languageCode', locale.languageCode);
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

@riverpod
class CheckavAilabilityEmail extends _$CheckavAilabilityEmail {
  @override
  Future<Response> build() async {
    return initResponse;
  }

  Future<void> fetch(String email) async {
    final Uri uri = Uri(scheme: 'http', host: '10.0.2.2', port: 8700, path: '/checkavailabilityemail');
    final Response response = await http.post(
      uri,
      headers: <String, String>{'Content-Type': 'application/json; charset=UTF-8'},
      body: jsonEncode(Email(email: email).toJson()),
    );
    state = AsyncData(response);
  }
}

@riverpod
class CheckVerificationCode extends _$CheckVerificationCode {
  @override
  Future<Response> build() async {
    return initResponse;
  }

  Future<void> fetch(int code) async {
    final checkavAilabilityEmailResponse = await ref.watch(checkavAilabilityEmailProvider.future);
    final VerificationRes verificationRes = VerificationRes.fromJson(jsonDecode(utf8.decode(checkavAilabilityEmailResponse.bodyBytes)));
    final Uri uri = Uri(scheme: 'http', host: '10.0.2.2', port: 8700, path: '/checkverificationcode');
    final Response response = await http.post(
      uri,
      headers: <String, String>{'Content-Type': 'application/json; charset=UTF-8'},
      body: jsonEncode(VerificationCode(verification_id: verificationRes.verification_id, reference: verificationRes.reference, code: code).toJson()),
    );
    state = AsyncData(response);
  }
}

@riverpod
class Test extends _$Test {
  @override
  Future<String> build() async {
    return 'hello';
  }

  Future<void> fetch() async {
    await Future.delayed(const Duration(seconds: 10));
    state = AsyncData(DateTime.now().toIso8601String());
  }
}
