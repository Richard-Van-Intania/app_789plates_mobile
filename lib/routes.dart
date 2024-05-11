import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'screen/create_new_account/check_availability_email_screen.dart';
import 'screen/create_new_account/check_verification_code_screen.dart';
import 'screen/create_new_account/create_new_account_screen.dart';
import 'screen/reset_password/check_verification_code_forgot_screen.dart';
import 'screen/reset_password/forgot_password_screen.dart';
import 'screen/reset_password/reset_password_screen.dart';
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
    GoRoute(
      path: '/',
      builder: (context, state) => SignInScreen(),
      routes: <RouteBase>[
        GoRoute(
          path: 'check_availability_email_screen',
          builder: (context, state) => CheckAvailabilityEmailScreen(),
          routes: <RouteBase>[
            GoRoute(
              path: 'check_verification_code_screen',
              builder: (context, state) => const CheckVerificationCodeScreen(),
              routes: <RouteBase>[
                GoRoute(
                  path: 'create_new_account_screen',
                  builder: (context, state) => const CreateNewAccountScreen(),
                ),
              ],
            ),
          ],
        ),
        GoRoute(
          path: 'forgot_password_screen',
          builder: (context, state) => const ForgotPasswordScreen(),
          routes: <RouteBase>[
            GoRoute(
              path: 'check_verification_code_forgot_screen',
              builder: (context, state) => const CheckVerificationCodeForgotScreen(),
              routes: <RouteBase>[
                GoRoute(
                  path: 'reset_password_screen',
                  builder: (context, state) => const ResetPasswordScreen(),
                ),
              ],
            ),
          ],
        ),
      ],
    ),
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
  // errorBuilder: (context, state) => SignInScreen(),
);
