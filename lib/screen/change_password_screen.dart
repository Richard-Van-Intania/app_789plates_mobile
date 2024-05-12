import 'package:app_789plates_mobile/provider/authentication.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ChangePasswordScreen extends HookConsumerWidget {
  ChangePasswordScreen({super.key});
  final textFormKey = GlobalKey<FormFieldState>();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final changePassword = ref.watch(changePasswordProvider);
    final passwordController = useTextEditingController();
    final pendingFetch = useState<Future<void>?>(null);
    final snapshot = useFuture(pendingFetch.value);
    // here
    WidgetsBinding.instance.addPostFrameCallback((Duration timeStamp) {
      changePassword.whenData((value) async {
        if (value == 200) {
          context.pop();
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Ok!')));
        }
      });
    });
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('ChangePasswordScreen'),
            SizedBox(height: 32),
            TextFormField(
              key: textFormKey,
              maxLength: 64,
              obscureText: true,
              controller: passwordController,
              decoration: InputDecoration(
                errorMaxLines: 5,
                hintText: 'Password',
                border: const OutlineInputBorder(),
              ),
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter  password';
                } else {
                  return null;
                }
              },
            ),
            ElevatedButton(
                onPressed: (snapshot.connectionState == ConnectionState.waiting)
                    ? null
                    : () {
                        if (textFormKey.currentState!.validate()) {
                          pendingFetch.value = ref.read(changePasswordProvider.notifier).fetch(passwordController.text.trim());
                          FocusScope.of(context).unfocus();
                        }
                      },
                child: Text('Ok')),
            SizedBox(height: 32),
            ElevatedButton(
                onPressed: () {
                  context.pop();
                },
                child: Text('Back')),
          ],
        ),
      ),
    );
  }
}
