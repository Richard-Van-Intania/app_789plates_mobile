// ignore_for_file: non_constant_identifier_names
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'constants.dart';

import 'initialize.dart';
import 'package:http/http.dart' as http;

import 'provider/authentication.dart';
import 'routes.dart';

part 'provider.g.dart';

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
  // Search
}



// @riverpod
// class ChangePassword extends _$ChangePassword {
//   @override
//   Future<int> build() async {
//     return 0;
//   }

//   Future<void> fetch(String pw) async {
//     final credential = await ref.read(credentialProvider.future);
//     final email = credential['email'];
//     final password = credential['password'];
//     final access_token = credential['access_token'];
//     final users_id = credential['users_id'];
//     if (email != null && password != null && access_token != null && users_id != null && (password == pw)) {
//       final Uri uri = Uri(
//         scheme: 'http',
//         host: '10.0.2.2',
//         port: 8700,
//         path: '/change_password',
//       );
//       final response = await http.put(
//         uri,
//         headers: <String, String>{'Content-Type': 'application/json; charset=UTF-8', HttpHeaders.authorizationHeader: 'Bearer $access_token'},
//         body: jsonEncode(Authentication(
//           verification_id: nullAliasInt,
//           reference: nullAliasInt,
//           code: nullAliasInt,
//           email: email,
//           password: password,
//           access_token: access_token,
//           refresh_token: nullAliasString,
//           users_id: int.parse(users_id),
//         ).toJson()),
//       );
//     } else {
//       state = const AsyncData(409);
//     }
//   }
// }
