import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'screen/sign_in_screen.dart';
import 'tab/chat_tab.dart';
import 'tab/explore_tab.dart';
import 'tab/home_tab.dart';
import 'tab/saved_tab.dart';
import 'tab/store_tab.dart';

final loadingRoute = RoutingConfig(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (context, state) => const Scaffold(body: Center(child: CircularProgressIndicator())),
    ),
  ],
);

final signInRoute = RoutingConfig(
  routes: <RouteBase>[
    GoRoute(path: '/', builder: (context, state) => SignInScreen()),
  ],
);

final mainRoute = RoutingConfig(
  routes: <RouteBase>[
    StatefulShellRoute.indexedStack(
      builder: (BuildContext context, GoRouterState state, StatefulNavigationShell navigationShell) {
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
      },
      branches: <StatefulShellBranch>[
        StatefulShellBranch(
          routes: <RouteBase>[
            GoRoute(
              path: '/',
              builder: (context, state) => HomeTab(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: <RouteBase>[
            GoRoute(
              path: '/explore',
              builder: (context, state) => ExploreTab(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: <RouteBase>[
            GoRoute(
              path: '/saved',
              builder: (context, state) => SavedTab(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: <RouteBase>[
            GoRoute(
              path: '/chats',
              builder: (context, state) => ChatTab(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: <RouteBase>[
            GoRoute(
              path: '/store',
              builder: (context, state) => StoreTab(),
            ),
          ],
        ),
      ],
    ),
  ],
);

final ValueNotifier<RoutingConfig> routeConfig = ValueNotifier<RoutingConfig>(loadingRoute);

final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');

final GoRouter goRouter = GoRouter.routingConfig(
  debugLogDiagnostics: true,
  navigatorKey: _navigatorKey,
  routingConfig: routeConfig,
  initialLocation: '/',
  errorBuilder: (context, state) => SignInScreen(),
);
