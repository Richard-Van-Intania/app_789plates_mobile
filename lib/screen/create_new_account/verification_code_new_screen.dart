import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'confirmation_password_screen.dart';
import 'package:http/http.dart' as http;

class VerificationCodeNewScreen extends StatefulHookConsumerWidget {
  const VerificationCodeNewScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _VerificationCodeNewScreenState();
}

class _VerificationCodeNewScreenState extends ConsumerState<VerificationCodeNewScreen> {
  final TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text('Verification code'),
        ),
        resizeToAvoidBottomInset: false,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              SizedBox(
                height: 96,
              ),
              TextField(
                controller: controller,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: 'Verification code',
                  border: const OutlineInputBorder(),
                ),
              ),
              SizedBox(
                height: 32,
              ),
              ElevatedButton(
                  onPressed: () async {
                    final Uri uri = Uri(scheme: 'http', host: '10.0.2.2', port: 8700, path: '/checkverificationcode');
                    final response = await http.post(
                      uri,
                      headers: <String, String>{'Content-Type': 'application/json; charset=UTF-8'},
                      body: jsonEncode(<String, String>{
                        'uuid': '88862a24-acc0-4400-b630-77111ed11c1a',
                        'reference': '79',
                        'code': '122980',
                      }),
                    );
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => const ConfirmationPasswordScreen()));
                  },
                  child: Text('Next')),
            ],
          ),
        ),
      ),
    );
  }
}
