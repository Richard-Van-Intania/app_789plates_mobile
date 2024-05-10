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
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends HookConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Locale locale = ref.watch(localeUpdateProvider);
    final ThemeMode themeMode = ref.watch(themeModeUpdateProvider);
    final routingConfig = ref.watch(routingConfigProvider);
    return MaterialApp.router(
      title: '789plates',
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: locale,
      themeMode: themeMode,
      theme: ThemeData(fontFamily: 'Noto Sans Thai', useMaterial3: true, colorScheme: lightColorScheme),
      darkTheme: ThemeData(fontFamily: 'Noto Sans Thai', useMaterial3: true, colorScheme: darkColorScheme),
      routerConfig: switch (routingConfig) {
        AsyncData(:final value) => value.router,
        AsyncError() => errorRoute,
        _ => loadingRoute,
      },
    );
  }
}
