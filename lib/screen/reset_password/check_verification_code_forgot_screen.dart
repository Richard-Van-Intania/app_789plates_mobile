import 'package:app_789plates_mobile/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'reset_password_screen.dart';

class CheckVerificationCodeForgotScreen extends StatefulHookConsumerWidget {
  const CheckVerificationCodeForgotScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CheckVerificationCodeForgotScreenState();
}

class _CheckVerificationCodeForgotScreenState extends ConsumerState<CheckVerificationCodeForgotScreen> {
  final GlobalKey<FormFieldState> key = GlobalKey<FormFieldState>();
  @override
  Widget build(BuildContext context) {
    final checkVerificationCodeForgot = ref.watch(checkVerificationCodeForgotProvider);
    final controller = useTextEditingController();
    final pendingFetch = useState<Future<void>?>(null);
    final snapshot = useFuture(pendingFetch.value);
    final isErrored = snapshot.hasError && snapshot.connectionState != ConnectionState.waiting;
    WidgetsBinding.instance.addPostFrameCallback((Duration timeStamp) {
      switch (checkVerificationCodeForgot) {
        case AsyncValue(:final error?):
          print(error.toString());
        case AsyncValue(:final valueOrNull?):
          if (valueOrNull.statusCode == 200) {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => const ResetPasswordScreen()));
          } else {
            print(valueOrNull.statusCode);
          }
        default:
      }
    });
    return Scaffold(
      body: checkVerificationCodeForgot.when(
        data: (value) {
          return Column(
            children: [
              SizedBox(
                height: 120,
              ),
              Text(value.model.reference.toString()),
              TextFormField(
                key: key,
                controller: controller,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: 'Verification code forgot',
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
                          if (key.currentState!.validate()) {
                            pendingFetch.value = ref.read(checkVerificationCodeForgotProvider.notifier).fetch(int.parse(controller.text.trim()));
                            FocusScope.of(context).unfocus();
                          }
                        },
                  child: Text('Next')),
            ],
          );
        },
        error: (e, s) => const Center(child: Text('Uh oh. Something went wrong!')),
        loading: () => const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
