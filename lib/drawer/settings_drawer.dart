import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../provider.dart';

class SettingsDrawer extends StatefulHookConsumerWidget {
  const SettingsDrawer({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SettingsDrawerState();
}

class _SettingsDrawerState extends ConsumerState<SettingsDrawer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Switch(
            value: Theme.of(context).brightness == Brightness.dark,
            onChanged: (bool newValue) {
              ref.read(themeModeUpdateProvider.notifier).updateThemeMode(newValue ? ThemeMode.dark : ThemeMode.light);
            }),
      ),
    );
  }
}
