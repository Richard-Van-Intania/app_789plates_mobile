import 'dart:convert';
import 'package:app_789plates_mobile/provider.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:http/http.dart' as http;
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'verification_code_new_screen.dart';

class CreateNewAccountScreen extends StatefulHookConsumerWidget {
  const CreateNewAccountScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CreateNewAccountScreenState();
}

class _CreateNewAccountScreenState extends ConsumerState<CreateNewAccountScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final controller = useTextEditingController();
    final AsyncValue<int> statusCode = ref.watch(checkavAilabilityEmailProvider);
    WidgetsBinding.instance.addPostFrameCallback((Duration timeStamp) {
      switch (statusCode) {
        case AsyncValue(:final error?):
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(error.toString())));
        case AsyncValue(:final valueOrNull?):
          switch (valueOrNull) {
            case 0:
              {}
            case 200:
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => const VerificationCodeNewScreen()));
            case 500:
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(valueOrNull.toString())));
            case 409:
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(valueOrNull.toString())));
            case 400:
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(valueOrNull.toString())));
            default:
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Oops, something unexpected happened')));
          }
        default:
      }
    });
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
              height: 120,
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
                await ref.read(checkavAilabilityEmailProvider.notifier).postCheck(controller.text);
              },
              child: Text('Next'),
            ),
          ],
        ),
      ),
    );
  }
}
