import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ConfirmationPasswordScreen extends StatefulHookConsumerWidget {
  const ConfirmationPasswordScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ConfirmationPasswordScreenState();
}

class _ConfirmationPasswordScreenState extends ConsumerState<ConfirmationPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text('Password'),
        ),
        resizeToAvoidBottomInset: false,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              SizedBox(
                height: 96,
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
              ElevatedButton(
                  onPressed: () {
                    // clear stage
                    context.go('/myhomepage');
                  },
                  child: Text('Ok')),
            ],
          ),
        ),
      ),
    );
  }
}
