import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HelpAndSupportDrawer extends StatefulHookConsumerWidget {
  const HelpAndSupportDrawer({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HelpAndSupportDrawerState();
}

class _HelpAndSupportDrawerState extends ConsumerState<HelpAndSupportDrawer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('HelpAndSupportDrawer'),
      ),
    );
  }
}
