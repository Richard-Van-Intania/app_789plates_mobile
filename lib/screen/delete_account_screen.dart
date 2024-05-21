import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../provider/authentication.dart';

class DeleteAccountScreen extends HookConsumerWidget {
  const DeleteAccountScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final deleteAccount = ref.watch(deleteAccountProvider);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  context.pop();
                  ref.read(deleteAccountProvider.notifier).fetch();
                },
                child: Text('Delete')),
          ],
        ),
      ),
    );
  }
}
