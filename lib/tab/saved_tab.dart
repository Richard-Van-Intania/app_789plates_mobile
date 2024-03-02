import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SavedTab extends StatefulHookConsumerWidget {
  const SavedTab({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SavedTabState();
}

class _SavedTabState extends ConsumerState<SavedTab> {
  @override
  Widget build(BuildContext context) {
    final TabController tabController = useTabController(initialLength: 2);
    return Scaffold(
      appBar: AppBar(
        bottom: TabBar(
          controller: tabController,
          tabs: <Widget>[
            Tab(text: AppLocalizations.of(context)!.plates, icon: const Icon(Icons.pin_outlined)),
            Tab(text: AppLocalizations.of(context)!.store, icon: const Icon(Icons.store_outlined)),
          ],
        ),
      ),
      body: TabBarView(
        controller: tabController,
        children: const <Widget>[
          Center(
            child: Text('plates'),
          ),
          Center(
            child: Text('store'),
          ),
        ],
      ),
    );
  }
}
