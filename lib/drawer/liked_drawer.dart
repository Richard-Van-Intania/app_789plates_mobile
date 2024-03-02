import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LikedDrawer extends StatefulHookConsumerWidget {
  const LikedDrawer({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LikedDrawerState();
}

class _LikedDrawerState extends ConsumerState<LikedDrawer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('LikedDrawer'),
      ),
    );
  }
}
