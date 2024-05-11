import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../provider/authentication.dart';
import 'check_verification_code_forgot_screen.dart';

class ForgotPasswordScreen extends StatefulHookConsumerWidget {
  const ForgotPasswordScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends ConsumerState<ForgotPasswordScreen> {
  final _formFieldKey = GlobalKey<FormFieldState>();

  @override
  Widget build(BuildContext context) {
    final forgotPassword = ref.watch(forgotPasswordProvider);
    final controller = useTextEditingController();
    final pendingFetch = useState<Future<void>?>(null);
    final snapshot = useFuture(pendingFetch.value);
    final isErrored = snapshot.hasError && snapshot.connectionState != ConnectionState.waiting;
    WidgetsBinding.instance.addPostFrameCallback((Duration timeStamp) {
      switch (forgotPassword) {
        case AsyncValue(:final error?):
          print(error.toString());
        case AsyncValue(:final valueOrNull?):
          if (valueOrNull.statusCode == 200) {
            context.go('/forgot_password_screen/check_verification_code_forgot_screen');
          } else {
            print(valueOrNull.statusCode);
          }
        default:
      }
    });
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: forgotPassword.when(
        data: (data) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                SizedBox(
                  height: 120,
                ),
                Text('ForgotPasswordScreen'),
                TextFormField(
                  key: _formFieldKey,
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
                  onPressed: (snapshot.connectionState == ConnectionState.waiting)
                      ? null
                      : () {
                          if (_formFieldKey.currentState!.validate()) {
                            pendingFetch.value = ref.read(forgotPasswordProvider.notifier).fetch(controller.text.trim().toLowerCase());
                            FocusScope.of(context).unfocus();
                          }
                        },
                  child: Text('Next'),
                ),
              ],
            ),
          );
        },
        error: (e, s) => const Center(child: Text('Uh oh. Something went wrong!')),
        loading: () => const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
