import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AccountDrawer extends StatefulHookConsumerWidget {
  const AccountDrawer({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AccountDrawerState();
}

class _AccountDrawerState extends ConsumerState<AccountDrawer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('AccountDrawer'),
      ),
    );
  }
}
