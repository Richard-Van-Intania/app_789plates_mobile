import 'dart:convert';
import 'package:app_789plates_mobile/model.dart';
import 'package:app_789plates_mobile/provider.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:http/http.dart' as http;
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'confirmation_password_screen.dart';
import 'verification_code_new_screen.dart';

class CreateNewAccountScreen extends StatefulHookConsumerWidget {
  const CreateNewAccountScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CreateNewAccountScreenState();
}

class _CreateNewAccountScreenState extends ConsumerState<CreateNewAccountScreen> {
  final GlobalKey<FormFieldState> key = GlobalKey<FormFieldState>();

  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = useTextEditingController();
    final bool isLoading = ref.watch(loadingProvider);
    final checkavAilabilityEmailResponse = ref.watch(checkAvailabilityEmailProvider);
    WidgetsBinding.instance.addPostFrameCallback((Duration timeStamp) {
      switch (checkavAilabilityEmailResponse) {
        case AsyncValue(:final error?):
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(error.toString())));
        case AsyncValue(:final valueOrNull?):
          switch (valueOrNull.statusCode) {
            case 100:
              {}
            case 200:
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => const VerificationCodeNewScreen()));
            case 500:
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(valueOrNull.statusCode.toString()), behavior: SnackBarBehavior.floating));
            case 409:
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(valueOrNull.statusCode.toString()), behavior: SnackBarBehavior.floating));
            case 400:
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(valueOrNull.statusCode.toString()), behavior: SnackBarBehavior.floating));
            default:
              print('statusCode: ${valueOrNull.statusCode}');
          }
      }
    });
    return Scaffold(
      appBar: AppBar(
        title: Text('create new account'),
      ),
      resizeToAvoidBottomInset: false,
      body: switch (checkavAilabilityEmailResponse) {
        AsyncData(:final value) => Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                SizedBox(
                  height: 120,
                ),
                TextFormField(
                  key: key,
                  controller: controller,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    hintText: 'Email',
                    border: const OutlineInputBorder(),
                  ),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some emailAddress';
                    } else if (!EmailValidator.validate(value.trim().toLowerCase())) {
                      return 'emailAddress not correct';
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(
                  height: 32,
                ),
                ElevatedButton(
                  onPressed: isLoading
                      ? null
                      : () {
                          if (key.currentState!.validate()) {
                            ref.read(checkAvailabilityEmailProvider.notifier).fetch(controller.text.trim().toLowerCase());
                            FocusScope.of(context).unfocus();
                            ref.read(loadingProvider.notifier).toggle(true);
                          }
                        },
                  child: Text('Next'),
                ),
              ],
            ),
          ),
        AsyncError() => Center(child: const Text('Oops, something unexpected happened')),
        _ => Center(child: const CircularProgressIndicator()),
      },
      floatingActionButton: FloatingActionButton(
        onPressed: () async {},
      ),
    );
  }
}
