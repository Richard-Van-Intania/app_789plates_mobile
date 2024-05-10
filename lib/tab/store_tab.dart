import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../drawer/account_drawer.dart';
import '../drawer/help_and_support_drawer.dart';
import '../drawer/liked_drawer.dart';
import '../drawer/settings_drawer.dart';
import '../drawer/store_drawer.dart';
import '../provider.dart';
import '../screen/sign_in_screen.dart';

class StoreTab extends StatefulHookConsumerWidget {
  const StoreTab({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _StoreTabState();
}

class _StoreTabState extends ConsumerState<StoreTab> {
  final List<GlobalKey<NavigatorState>> _drawerNavigatorKeys = [
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
  ];

  @override
  Widget build(BuildContext context) {
    final int drawerIndex = ref.watch(drawerIndexProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text(switch (drawerIndex) {
          0 => AppLocalizations.of(context)!.store,
          1 => AppLocalizations.of(context)!.liked,
          2 => AppLocalizations.of(context)!.account,
          3 => AppLocalizations.of(context)!.settings,
          4 => AppLocalizations.of(context)!.helpAndSupport,
          _ => 'null',
        }),
      ),
      body: IndexedStack(
        index: drawerIndex,
        children: [
          Navigator(
              key: _drawerNavigatorKeys[0],
              onGenerateRoute: (RouteSettings settings) {
                return MaterialPageRoute<void>(
                    settings: settings,
                    builder: (BuildContext context) {
                      return const StoreDrawer();
                    });
              }),
          Navigator(
              key: _drawerNavigatorKeys[1],
              onGenerateRoute: (RouteSettings settings) {
                return MaterialPageRoute<void>(
                    settings: settings,
                    builder: (BuildContext context) {
                      return const LikedDrawer();
                    });
              }),
          Navigator(
              key: _drawerNavigatorKeys[2],
              onGenerateRoute: (RouteSettings settings) {
                return MaterialPageRoute<void>(
                    settings: settings,
                    builder: (BuildContext context) {
                      return const AccountDrawer();
                    });
              }),
          Navigator(
              key: _drawerNavigatorKeys[3],
              onGenerateRoute: (RouteSettings settings) {
                return MaterialPageRoute<void>(
                    settings: settings,
                    builder: (BuildContext context) {
                      return const SettingsDrawer();
                    });
              }),
          Navigator(
              key: _drawerNavigatorKeys[4],
              onGenerateRoute: (RouteSettings settings) {
                return MaterialPageRoute<void>(
                    settings: settings,
                    builder: (BuildContext context) {
                      return const HelpAndSupportDrawer();
                    });
              }),
        ],
      ),
      drawer: NavigationDrawer(
        selectedIndex: drawerIndex,
        onDestinationSelected: (int index) {
          ref.read(drawerIndexProvider.notifier).updateDrawerIndex(index);
          Navigator.pop(context);
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
                // // pop up confirm
                // Navigator.pop(context);
                // await ref.read(credentialProvider.notifier).deleteAll();
                // ref.invalidate(autoSignInProvider);
                // ref.invalidate(routeConfigProvider);

                Navigator.pop(context);
                await ref.read(credentialProvider.notifier).deleteAll();
                ref.invalidate(routingConfigProvider);
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
