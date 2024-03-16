import 'dart:convert';
import 'package:app_789plates_mobile/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../model.dart';
import 'confirmation_password_screen.dart';
import 'package:http/http.dart' as http;

class VerificationCodeNewScreen extends StatefulHookConsumerWidget {
  const VerificationCodeNewScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _VerificationCodeNewScreenState();
}

class _VerificationCodeNewScreenState extends ConsumerState<VerificationCodeNewScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = useTextEditingController();
    final response = ref.watch(checkVerificationCodeProvider);
    final checkavAilabilityEmailResponse = ref.watch(checkavAilabilityEmailProvider);
    WidgetsBinding.instance.addPostFrameCallback((Duration timeStamp) {
      switch (response) {
        case AsyncValue(:final error?):
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(error.toString())));
        case AsyncValue(:final valueOrNull?):
          switch (valueOrNull.statusCode) {
            case 100:
              {}
            case 200:
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => const ConfirmationPasswordScreen()));
            case 500:
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(valueOrNull.statusCode.toString()), behavior: SnackBarBehavior.floating));
            case 409:
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(valueOrNull.statusCode.toString()), behavior: SnackBarBehavior.floating));
            case 400:
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(valueOrNull.statusCode.toString()), behavior: SnackBarBehavior.floating));
            default:
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Oops, something unexpected happened'), behavior: SnackBarBehavior.floating));
          }
        default:
      }
    });
    return PopScope(
      canPop: false,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text('Verification code'),
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
                  Text(VerificationRes.fromJson(jsonDecode(utf8.decode(value.bodyBytes))).reference.toString()),
                  Form(
                    key: formKey,
                    child: TextFormField(
                      controller: controller,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: 'Verification code',
                        border: const OutlineInputBorder(),
                      ),
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some Verification code';
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(
                    height: 32,
                  ),
                  ElevatedButton(
                      onPressed: () async {
                        if (formKey.currentState!.validate()) {
                          ref.read(checkVerificationCodeProvider.notifier).fetch(int.parse(controller.text.trim()));
                          FocusScope.of(context).unfocus();
                        }
                      },
                      child: Text('Next')),
                ],
              ),
            ),
          AsyncError() => Center(child: const Text('Oops, something unexpected happened')),
          _ => Center(child: const CircularProgressIndicator()),
        },
      ),
    );
  }
}
