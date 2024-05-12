import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'drawer/account_drawer.dart';
import 'drawer/help_and_support_drawer.dart';
import 'drawer/liked_drawer.dart';
import 'drawer/settings_drawer.dart';
import 'drawer/store_drawer.dart';
import 'screen/change_password_screen.dart';
import 'screen/create_new_account/check_availability_email_screen.dart';
import 'screen/create_new_account/check_verification_code_screen.dart';
import 'screen/create_new_account/create_new_account_screen.dart';
import 'screen/delete_account_screen.dart';
import 'screen/new_password_screen.dart';
import 'screen/reset_password/check_verification_code_forgot_screen.dart';
import 'screen/reset_password/forgot_password_screen.dart';
import 'screen/reset_password/reset_password_screen.dart';
import 'screen/sign_in_screen.dart';
import 'tab/chat_tab.dart';
import 'tab/explore_tab.dart';
import 'tab/home_tab.dart';
import 'tab/main_tab.dart';
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
        return MainTab(navigationShell: navigationShell);
      },
      branches: <StatefulShellBranch>[
        StatefulShellBranch(
          routes: <RouteBase>[
            GoRoute(
              path: '/',
              builder: (context, state) => HomeTab(),
              routes: <RouteBase>[],
            ),
          ],
        ),
        StatefulShellBranch(
          routes: <RouteBase>[
            GoRoute(
              path: '/explore_tab',
              builder: (context, state) => ExploreTab(),
              routes: <RouteBase>[],
            ),
          ],
        ),
        StatefulShellBranch(
          routes: <RouteBase>[
            GoRoute(
              path: '/saved_tab',
              builder: (context, state) => SavedTab(),
              routes: <RouteBase>[],
            ),
          ],
        ),
        StatefulShellBranch(
          routes: <RouteBase>[
            GoRoute(
              path: '/chat_tab',
              builder: (context, state) => ChatTab(),
              routes: <RouteBase>[],
            ),
          ],
        ),
        StatefulShellBranch(
          routes: <RouteBase>[
            StatefulShellRoute.indexedStack(
              builder: (BuildContext context, GoRouterState state, StatefulNavigationShell navigationShell) {
                return StoreTab(navigationShell: navigationShell);
              },
              branches: <StatefulShellBranch>[
                StatefulShellBranch(
                  routes: <RouteBase>[
                    GoRoute(
                      path: '/store_drawer',
                      builder: (context, state) => StoreDrawer(),
                      routes: <RouteBase>[],
                    ),
                  ],
                ),
                StatefulShellBranch(
                  routes: <RouteBase>[
                    GoRoute(
                      path: '/liked_drawer',
                      builder: (context, state) => LikedDrawer(),
                      routes: <RouteBase>[],
                    ),
                  ],
                ),
                StatefulShellBranch(
                  routes: <RouteBase>[
                    GoRoute(
                      path: '/account_drawer',
                      builder: (context, state) => AccountDrawer(),
                      routes: <RouteBase>[
                        GoRoute(
                          path: 'change_password_screen',
                          builder: (context, state) => ChangePasswordScreen(),
                          routes: <RouteBase>[
                            GoRoute(
                              path: 'new_password_screen',
                              builder: (context, state) => NewPasswordScreen(),
                            ),
                          ],
                        ),
                        GoRoute(
                          path: 'delete_account_screen',
                          builder: (context, state) => DeleteAccountScreen(),
                        ),
                      ],
                    ),
                  ],
                ),
                StatefulShellBranch(
                  routes: <RouteBase>[
                    GoRoute(
                      path: '/settings_drawer',
                      builder: (context, state) => SettingsDrawer(),
                      routes: <RouteBase>[],
                    ),
                  ],
                ),
                StatefulShellBranch(
                  routes: <RouteBase>[
                    GoRoute(
                      path: '/help_and_support_drawer',
                      builder: (context, state) => HelpAndSupportDrawer(),
                      routes: <RouteBase>[],
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ],
    ),
  ],
);

final ValueNotifier<RoutingConfig> routeConfig = ValueNotifier<RoutingConfig>(loadingRoute);

final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();

final GoRouter goRouter = GoRouter.routingConfig(
  debugLogDiagnostics: true,
  navigatorKey: _navigatorKey,
  routingConfig: routeConfig,
  initialLocation: '/',
  // errorBuilder: (context, state) => SignInScreen(),
);
