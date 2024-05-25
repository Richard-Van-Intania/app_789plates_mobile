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
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(16.0),
        child: Image.network('https://d27r257vlsyci.cloudfront.net/profile/IMG_9394.JPG'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
      ),
    );
  }
}
