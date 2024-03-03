import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'new_password_screen.dart';

class VerificationCodeForgotScreen extends StatefulHookConsumerWidget {
  const VerificationCodeForgotScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _VerificationCodeForgotScreenState();
}

class _VerificationCodeForgotScreenState extends ConsumerState<VerificationCodeForgotScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Verification code'),
      ),
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            SizedBox(
              height: 48,
            ),
            Container(alignment: Alignment.centerLeft, child: Text('Enter verification code')),
            SizedBox(
              height: 24,
            ),
            TextField(
              decoration: InputDecoration(
                hintText: 'Code',
                border: const OutlineInputBorder(),
              ),
            ),
            SizedBox(
              height: 32,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => const NewPasswordScreen()));
                },
                child: Text('Next')),
          ],
        ),
      ),
    );
  }
}
