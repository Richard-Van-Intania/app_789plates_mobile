import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../drawer/account_drawer.dart';
import '../drawer/help_and_support_drawer.dart';
import '../drawer/liked_drawer.dart';
import '../drawer/settings_drawer.dart';
import '../drawer/store_drawer.dart';

import '../provider/authentication.dart';
import '../screen/sign_in_screen.dart';

class StoreTab extends HookConsumerWidget {
  const StoreTab({super.key, required this.navigationShell});
  final StatefulNavigationShell navigationShell;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(switch (navigationShell.currentIndex) {
          0 => AppLocalizations.of(context)!.store,
          1 => AppLocalizations.of(context)!.liked,
          2 => AppLocalizations.of(context)!.account,
          3 => AppLocalizations.of(context)!.settings,
          4 => AppLocalizations.of(context)!.helpAndSupport,
          _ => 'null',
        }),
      ),
      body: navigationShell,
      drawer: NavigationDrawer(
        selectedIndex: navigationShell.currentIndex,
        onDestinationSelected: (int index) {
          navigationShell.goBranch(index, initialLocation: index == navigationShell.currentIndex);
          context.pop();
        },
        children: [
          const DrawerHeader(
            child: Text('789plates'),
          ),
          NavigationDrawerDestination(
            icon: const Icon(Icons.store_outlined),
            selectedIcon: const Icon(Icons.store),
            label: Text(AppLocalizations.of(context)!.store),
          ),
          NavigationDrawerDestination(
            icon: const Icon(Icons.favorite_border_outlined),
            selectedIcon: const Icon(Icons.favorite_outlined),
            label: Text(AppLocalizations.of(context)!.liked),
          ),
          NavigationDrawerDestination(
            icon: const Icon(Icons.account_circle_outlined),
            selectedIcon: const Icon(Icons.account_circle),
            label: Text(AppLocalizations.of(context)!.account),
          ),
          NavigationDrawerDestination(
            icon: const Icon(Icons.settings_outlined),
            selectedIcon: const Icon(Icons.settings),
            label: Text(AppLocalizations.of(context)!.settings),
          ),
          NavigationDrawerDestination(
            icon: const Icon(Icons.help_outline_outlined),
            selectedIcon: const Icon(Icons.help_outlined),
            label: Text(AppLocalizations.of(context)!.helpAndSupport),
          ),
          const Divider(indent: 28.0, endIndent: 28.0),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextButton.icon(
              onPressed: () async {
                // pop up confirm
                context.go('/');
                await ref.read(credentialProvider.notifier).deleteAll();
                ref.invalidate(dynamicRouteConfigProvider);
              },
              icon: const Icon(Icons.logout_outlined),
              label: Text(AppLocalizations.of(context)!.logOut),
            ),
          )
        ],
      ),
    );
  }
}
