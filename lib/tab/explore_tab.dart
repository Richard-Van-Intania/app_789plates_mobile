import 'package:app_789plates_mobile/constants.dart';
import 'package:app_789plates_mobile/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:go_router/go_router.dart';
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
    final search = ref.watch(searchProvider);
    // final fetchProfile = ref.watch(fetchProfileProvider('hello from fetch'));
    final pendingFetch = useState<Future<void>?>(null);
    final snapshot = useFuture(pendingFetch.value);
    final isErrored = snapshot.hasError && snapshot.connectionState != ConnectionState.waiting;
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
            onPressed: () async {
              // pendingFetch.value = ref.read(testProvider.notifier).fetch();
              // final users_id = await flutterSecureStorage.read(key: 'users_id');
              // print(users_id);
            },
            icon: const Icon(Icons.settings),
          )
        ],
      ),
      // body: search.when(
      //   data: (data) => Center(
      //     child: Text(
      //       data,
      //       style: const TextStyle(
      //         fontSize: 25.0,
      //       ),
      //     ),
      //   ),
      //   error: (e, s) => const Center(child: Text('Uh oh. Something went wrong!')),
      //   loading: () => const Center(child: CircularProgressIndicator()),
      // ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        context.go('/home');
      }),
    );
  }
}
