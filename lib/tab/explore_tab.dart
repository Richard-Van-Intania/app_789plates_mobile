import 'package:app_789plates_mobile/provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ExploreTab extends StatefulHookConsumerWidget {
  const ExploreTab({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ExploreTabState();
}

class _ExploreTabState extends ConsumerState<ExploreTab> {
  @override
  Widget build(BuildContext context) {
    print(DateTime.now().toIso8601String());
    final AsyncValue<String> test = ref.watch(testProvider);
    return Scaffold(
      appBar: AppBar(
        leading: SearchAnchor(
          builder: (BuildContext context, SearchController controller) {
            return IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {
                controller.openView();
              },
            );
          },
          suggestionsBuilder: (BuildContext context, SearchController controller) {
            return List<ListTile>.generate(5, (int index) {
              final String item = 'item $index';
              return ListTile(
                title: Text(item),
                onTap: () {
                  setState(() {
                    controller.closeView(item);
                  });
                },
              );
            });
          },
        ),
        actions: [
          IconButton(
            onPressed: () {
              ref.read(testProvider.notifier).fetch();
            },
            icon: const Icon(Icons.settings),
          )
        ],
      ),
      body: switch (test) {
        AsyncValue(:final error?) => Center(
              child: Text(
            'Error: $error',
            style: const TextStyle(
              fontSize: 25.0,
            ),
          )),
        AsyncValue(:final valueOrNull?) => Center(
              child: Text(
            '$valueOrNull',
            style: const TextStyle(
              fontSize: 25.0,
            ),
          )),
        _ => Center(child: const CircularProgressIndicator()),
      },
    );
  }
}
