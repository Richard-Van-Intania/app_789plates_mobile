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
  final GlobalKey<FormFieldState> key = GlobalKey<FormFieldState>();

  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = useTextEditingController();
    final bool isLoading = ref.watch(loadingProvider);
    final checkavAilabilityEmailResponse = ref.watch(checkAvailabilityEmailProvider);
    final checkVerificationCodeResponse = ref.watch(checkVerificationCodeProvider);
    WidgetsBinding.instance.addPostFrameCallback((Duration timeStamp) {
      switch (checkVerificationCodeResponse) {
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
              print('statusCode: ${valueOrNull.statusCode}');
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
                  TextFormField(
                    key: key,
                    controller: controller,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: 'Verification code',
                      border: const OutlineInputBorder(),
                    ),
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some Verification code';
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
                                ref.read(checkVerificationCodeProvider.notifier).fetch(int.parse(controller.text.trim()));
                                FocusScope.of(context).unfocus();
                                ref.read(loadingProvider.notifier).toggle(true);
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
