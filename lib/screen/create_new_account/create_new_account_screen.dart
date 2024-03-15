import 'dart:convert';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'verification_code_new_screen.dart';

class CreateNewAccountScreen extends StatefulHookConsumerWidget {
  const CreateNewAccountScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CreateNewAccountScreenState();
}

class _CreateNewAccountScreenState extends ConsumerState<CreateNewAccountScreen> {
  final TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('create new account'),
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
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                hintText: 'Email',
                border: const OutlineInputBorder(),
              ),
            ),
            SizedBox(
              height: 32,
            ),
            ElevatedButton(
              onPressed: () async {
                final email = controller.text.trim().toLowerCase();
                final valid = EmailValidator.validate(email);
                if (valid) {
                  final Uri uri = Uri(scheme: 'http', host: '10.0.2.2', port: 8700, path: '/checkavailabilityemail');
                  final response = await http.post(
                    uri,
                    headers: <String, String>{'Content-Type': 'application/json; charset=UTF-8'},
                    body: jsonEncode(<String, String>{'email': email}),
                  );
                  switch (response.statusCode) {
                    case 200:
                      print(response.body);
                      if (!context.mounted) return;
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => const VerificationCodeNewScreen()));
                    case 400:
                      print("email not correct");
                    case 403:
                      print("email not avialable");
                    case 500:
                      print("service error");
                    default:
                      print("sth wrong");
                  }
                } else {
                  // error
                }
              },
              child: Text('Next'),
            ),
          ],
        ),
      ),
    );
  }
}
