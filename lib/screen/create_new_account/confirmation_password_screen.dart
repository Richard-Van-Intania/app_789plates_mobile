import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ConfirmationPasswordScreen extends StatefulHookConsumerWidget {
  const ConfirmationPasswordScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ConfirmationPasswordScreenState();
}

class _ConfirmationPasswordScreenState extends ConsumerState<ConfirmationPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Password'),
      ),
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            SizedBox(
              height: 48,
            ),
            Container(alignment: Alignment.centerLeft, child: Text('Enter your password')),
            SizedBox(
              height: 24,
            ),
            TextField(
              decoration: InputDecoration(
                hintText: 'Password',
                border: const OutlineInputBorder(),
              ),
            ),
            SizedBox(
              height: 24,
            ),
            TextField(
              decoration: InputDecoration(
                hintText: 'Confirm password',
                border: const OutlineInputBorder(),
              ),
            ),
            SizedBox(
              height: 32,
            ),
            FilledButton(
              onPressed: () {},
              child: Container(width: double.infinity, height: 48, alignment: Alignment.center, child: Text('Ok')),
            ),
          ],
        ),
      ),
    );
  }
}
