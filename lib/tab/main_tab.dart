import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MainTab extends HookConsumerWidget {
  const MainTab({super.key, required this.navigationShell});
  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // here
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: NavigationBar(
        selectedIndex: navigationShell.currentIndex,
        onDestinationSelected: (int index) {
          navigationShell.goBranch(index, initialLocation: index == navigationShell.currentIndex);
        },
        destinations: <Widget>[
          NavigationDestination(
            icon: const Icon(Icons.home_outlined),
            selectedIcon: const Icon(Icons.home),
            label: AppLocalizations.of(context)!.home,
          ),
          NavigationDestination(
            icon: const Icon(Icons.explore_outlined),
            selectedIcon: const Icon(Icons.explore),
            label: AppLocalizations.of(context)!.explore,
          ),
          NavigationDestination(
            icon: const Icon(Icons.bookmark_border_outlined),
            selectedIcon: const Icon(Icons.bookmark_outlined),
            label: AppLocalizations.of(context)!.saved,
          ),
          NavigationDestination(
            icon: const Icon(Icons.chat_outlined),
            selectedIcon: const Icon(Icons.chat),
            label: AppLocalizations.of(context)!.chats,
          ),
          NavigationDestination(
            icon: const Icon(Icons.store_outlined),
            selectedIcon: const Icon(Icons.store),
            label: AppLocalizations.of(context)!.store,
          ),
        ],
      ),
    );
  }
}
