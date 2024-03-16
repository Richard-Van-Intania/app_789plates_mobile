import 'dart:convert';
import 'package:app_789plates_mobile/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
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
      ),
    );
  }
}
