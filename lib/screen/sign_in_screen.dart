import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'create_new_account/create_new_account_screen.dart';
import 'forgot_password/forgot_password_screen.dart';

class SignInScreen extends StatefulHookConsumerWidget {
  const SignInScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SignInScreenState();
}

class _SignInScreenState extends ConsumerState<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            Image.asset('assets/images/Image.png'),
            Card(
                child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Email',
                      border: const OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Password',
                      border: const OutlineInputBorder(),
                    ),
                  ),
                  Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => const ForgotPasswordScreen()));
                          },
                          child: Text('Forgot password?'))),
                  FilledButton(
                    onPressed: () {},
                    child: Container(
                      alignment: Alignment.center,
                      width: double.infinity,
                      child: Text('sign in'),
                    ),
                  ),
                  Row(
                    children: [Expanded(child: Divider()), Text('or'), Expanded(child: Divider())],
                  ),
                  OutlinedButton(
                    onPressed: () {},
                    child: Container(
                      alignment: Alignment.center,
                      width: double.infinity,
                      child: Text('sign in with google'),
                    ),
                  ),
                  OutlinedButton(
                    onPressed: () {},
                    child: Container(
                      alignment: Alignment.center,
                      width: double.infinity,
                      child: Text('anonyumous'),
                    ),
                  ),
                ],
              ),
            )),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text("don't have account? "),
                SizedBox(
                  width: 8,
                ),
                TextButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => const CreateNewAccountScreen()));
                    },
                    child: Text('create account')),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
