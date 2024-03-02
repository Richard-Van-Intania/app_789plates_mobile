import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class StoreDrawer extends StatefulHookConsumerWidget {
  const StoreDrawer({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _StoreDrawerState();
}

class _StoreDrawerState extends ConsumerState<StoreDrawer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('StoreDrawer'),
      ),
    );
  }
}
