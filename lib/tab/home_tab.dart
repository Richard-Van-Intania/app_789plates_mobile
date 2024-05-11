import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../provider.dart';
import '../provider/settings.dart';
import '../screen/reset_password/forgot_password_screen.dart';

class HomeTab extends StatefulHookConsumerWidget {
  const HomeTab({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeTabState();
}

class _HomeTabState extends ConsumerState<HomeTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
          onPressed: () {
            final Locale myLocale = Localizations.localeOf(context);
            ref.read(localeUpdateProvider.notifier).updateLocale(myLocale == const Locale('en') ? const Locale('th') : const Locale('en'));
          },
          child: Text(
            AppLocalizations.of(context)!.helloWorld,
            style: const TextStyle(
              fontSize: 40.0,
            ),
          ),
        ),
      ),
    );
  }
}
