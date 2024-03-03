import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../main.dart';

class NewPasswordScreen extends StatefulHookConsumerWidget {
  const NewPasswordScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _NewPasswordScreenState();
}

class _NewPasswordScreenState extends ConsumerState<NewPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New password'),
      ),
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            SizedBox(
              height: 48,
            ),
            Container(alignment: Alignment.centerLeft, child: Text('Enter your new password')),
            SizedBox(
              height: 24,
            ),
            TextField(
              decoration: InputDecoration(
                hintText: 'New password',
                border: const OutlineInputBorder(),
              ),
            ),
            SizedBox(
              height: 24,
            ),
            TextField(
              decoration: InputDecoration(
                hintText: 'Confirm new password',
                border: const OutlineInputBorder(),
              ),
            ),
            SizedBox(
              height: 32,
            ),
            FilledButton(
              onPressed: () {
                // clear stage
                // sign auto
                context.go('/myhomepage');
              },
              child: Container(width: double.infinity, height: 48, alignment: Alignment.center, child: Text('Ok')),
            ),
          ],
        ),
      ),
    );
  }
}
