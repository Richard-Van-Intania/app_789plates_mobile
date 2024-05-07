import 'package:app_789plates_mobile/constants.dart';
import 'package:app_789plates_mobile/model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'color_schemes.g.dart';
import 'initialize.dart';
import 'provider.dart';
import 'screen/create_new_account/create_new_account_screen.dart';
import 'screen/create_new_account/check_availability_email_screen.dart';
import 'screen/reset_password/forgot_password_screen.dart';

import 'screen/reset_password/reset_password_screen.dart';
import 'screen/sign_in_screen.dart';

import 'tab/chat_tab.dart';
import 'tab/explore_tab.dart';
import 'tab/home_tab.dart';
import 'tab/saved_tab.dart';
import 'tab/store_tab.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  LicenseRegistry.addLicense(() async* {
    final license = await rootBundle.loadString('assets/fonts/OFL.txt');
    yield LicenseEntryWithLineBreaks(['google_fonts'], license);
  });
  await initialize();
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends HookConsumerWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Locale locale = ref.watch(localeUpdateProvider);
    final ThemeMode themeMode = ref.watch(themeModeUpdateProvider);
    // final autoSignIn = ref.watch(autoSignInProvider);
    // return MaterialApp(
    // title: '789plates',
    // localizationsDelegates: AppLocalizations.localizationsDelegates,
    // supportedLocales: AppLocalizations.supportedLocales,
    // locale: locale,
    // themeMode: themeMode,
    // theme: ThemeData(fontFamily: 'Noto Sans Thai', useMaterial3: true, colorScheme: lightColorScheme),
    // darkTheme: ThemeData(fontFamily: 'Noto Sans Thai', useMaterial3: true, colorScheme: darkColorScheme),
    //   home: switch (autoSignIn) {
    //     AsyncData(:final value) => (value.statusCode == 200) ? const MyHomePage() : const SignInScreen(),
    //     AsyncError() => const Scaffold(body: Center(child: Text('Oops, something unexpected happened!'))),
    //     _ => const Scaffold(body: Center(child: CircularProgressIndicator())),
    //   },
    // );

    // should use redirect
    final routeConfig = ref.watch(routeConfigProvider);
    return MaterialApp.router(
      title: '789plates',
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: locale,
      themeMode: themeMode,
      theme: ThemeData(fontFamily: 'Noto Sans Thai', useMaterial3: true, colorScheme: lightColorScheme),
      darkTheme: ThemeData(fontFamily: 'Noto Sans Thai', useMaterial3: true, colorScheme: darkColorScheme),
      routerConfig: switch (routeConfig) {
        AsyncData(:final value) => value,
        AsyncError() => GoRouter(
            routes: [
              GoRoute(
                path: '/on_error',
                builder: (context, state) => const Scaffold(body: Center(child: Text('Oops, something unexpected happened!'))),
              ),
            ],
          ),
        _ => GoRouter(
            routes: [
              GoRoute(
                path: '/on_loading',
                builder: (context, state) => const Scaffold(body: Center(child: CircularProgressIndicator())),
              ),
            ],
          ),
      },
    );
  }
}

final GoRouter goRouter = GoRouter(
  navigatorKey: _rootNavigatorKey,
  // initialLocation: switch (autoSignIn) {
  //   AsyncData(:final value) => (value.statusCode == 200) ? '/home' : '/sign_in',
  //   AsyncError() => 'error',
  //   _ => 'loading',
  // },
  // should use redirect
  // initialLocation: autoSignIn.when( data: (data) , error: error, loading: loading)
  initialLocation: '/home',
  redirect: (context, state) {
    return null;
  },
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
          navigatorKey: _homeNavigatorKey,
          routes: <RouteBase>[
            GoRoute(
              path: '/home',
              builder: (context, state) => HomeTab(),
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _exploreNavigatorKey,
          routes: <RouteBase>[
            GoRoute(
              path: '/explore',
              builder: (context, state) => ExploreTab(),
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _savedNavigatorKey,
          routes: <RouteBase>[
            GoRoute(
              path: '/saved',
              builder: (context, state) => SavedTab(),
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _chatsNavigatorKey,
          routes: <RouteBase>[
            GoRoute(
              path: '/chats',
              builder: (context, state) => ChatTab(),
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _storeNavigatorKey,
          routes: <RouteBase>[
            GoRoute(
              path: '/store',
              builder: (context, state) => StoreTab(),
            ),
          ],
        ),
      ],
    ),
    GoRoute(
      path: '/sign_in',
      builder: (context, state) => SignInScreen(),
    ),
    GoRoute(
      path: '/loading',
      builder: (context, state) => const Scaffold(body: Center(child: CircularProgressIndicator())),
    ),
    GoRoute(
      path: '/error',
      builder: (context, state) => const Scaffold(body: Center(child: Text('Oops, something unexpected happened!'))),
    ),
  ],
);

class MyHomePage extends StatefulHookConsumerWidget {
  const MyHomePage({super.key});

  @override
  ConsumerState<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends ConsumerState<MyHomePage> {
  final List<GlobalKey<NavigatorState>> _tabNavigatorKeys = [GlobalKey<NavigatorState>(), GlobalKey<NavigatorState>(), GlobalKey<NavigatorState>(), GlobalKey<NavigatorState>(), GlobalKey<NavigatorState>()];

  @override
  Widget build(BuildContext context) {
    final int tabIndex = ref.watch(tabIndexProvider);
    return PopScope(
      canPop: false,
      child: Scaffold(
        body: IndexedStack(
          index: tabIndex,
          children: [
            Navigator(
                key: _tabNavigatorKeys[0],
                onGenerateRoute: (RouteSettings settings) {
                  return MaterialPageRoute<void>(
                      settings: settings,
                      builder: (BuildContext context) {
                        return const HomeTab();
                      });
                }),
            Navigator(
                key: _tabNavigatorKeys[1],
                onGenerateRoute: (RouteSettings settings) {
                  return MaterialPageRoute<void>(
                      settings: settings,
                      builder: (BuildContext context) {
                        return const ExploreTab();
                      });
                }),
            Navigator(
                key: _tabNavigatorKeys[2],
                onGenerateRoute: (RouteSettings settings) {
                  return MaterialPageRoute<void>(
                      settings: settings,
                      builder: (BuildContext context) {
                        return const SavedTab();
                      });
                }),
            Navigator(
                key: _tabNavigatorKeys[3],
                onGenerateRoute: (RouteSettings settings) {
                  return MaterialPageRoute<void>(
                      settings: settings,
                      builder: (BuildContext context) {
                        return const ChatTab();
                      });
                }),
            Navigator(
                key: _tabNavigatorKeys[4],
                onGenerateRoute: (RouteSettings settings) {
                  return MaterialPageRoute<void>(
                      settings: settings,
                      builder: (BuildContext context) {
                        return const StoreTab();
                      });
                })
          ],
        ),
        bottomNavigationBar: NavigationBar(
          selectedIndex: tabIndex,
          onDestinationSelected: (int index) {
            ref.read(tabIndexProvider.notifier).updateTabIndex(index);
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
      ),
    );
  }
}

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');
final GlobalKey<NavigatorState> _homeNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'home');
final GlobalKey<NavigatorState> _exploreNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'explore');
final GlobalKey<NavigatorState> _savedNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'saved');
final GlobalKey<NavigatorState> _chatsNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'chats');
final GlobalKey<NavigatorState> _storeNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'store');
