import 'dart:convert';
import 'package:app_789plates_mobile/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../model.dart';
import 'create_new_account_screen.dart';
import 'package:http/http.dart' as http;

class CheckVerificationCodeScreen extends StatefulHookConsumerWidget {
  const CheckVerificationCodeScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CheckVerificationCodeScreenState();
}

class _CheckVerificationCodeScreenState extends ConsumerState<CheckVerificationCodeScreen> {
  final _formFieldKey = GlobalKey<FormFieldState>();

  @override
  Widget build(BuildContext context) {
    final checkAvailabilityEmail = ref.watch(checkAvailabilityEmailProvider);
    final checkVerificationCode = ref.watch(checkVerificationCodeProvider);
    final controller = useTextEditingController();
    final pendingFetch = useState<Future<void>?>(null);
    final snapshot = useFuture(pendingFetch.value);
    final isErrored = snapshot.hasError && snapshot.connectionState != ConnectionState.waiting;
    WidgetsBinding.instance.addPostFrameCallback((Duration timeStamp) {
      switch (checkVerificationCode) {
        case AsyncValue(:final error?):
          print(error.toString());
        case AsyncValue(:final valueOrNull?):
          if (valueOrNull.statusCode == 200) {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => const CreateNewAccountScreen()));
          } else {
            print(valueOrNull.statusCode);
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
        body: switch (checkAvailabilityEmail) {
          AsyncData(:final value) => Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  SizedBox(
                    height: 120,
                  ),
                  Text(value.model.reference.toString()),
                  TextFormField(
                    key: _formFieldKey,
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
                      onPressed: (snapshot.connectionState == ConnectionState.waiting)
                          ? null
                          : () {
                              if (_formFieldKey.currentState!.validate()) {
                                pendingFetch.value = ref.read(checkVerificationCodeProvider.notifier).fetch(int.parse(controller.text.trim()));
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
