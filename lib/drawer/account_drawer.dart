import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AccountDrawer extends HookConsumerWidget {
  const AccountDrawer({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  context.go('/account_drawer/change_password_screen');
                },
                child: Text('Change Password')),
            SizedBox(height: 32.0),
            ElevatedButton(
                onPressed: () {
                  context.go('/account_drawer/delete_account_screen');
                },
                child: Text('Delete Account')),
          ],
        ),
      ),
    );
  }
}
