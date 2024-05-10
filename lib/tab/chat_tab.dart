import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../screen/chat_room_screen.dart';

class ChatTab extends StatefulHookConsumerWidget {
  const ChatTab({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ChatTabState();
}

class _ChatTabState extends ConsumerState<ChatTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            SearchAnchor(builder: (BuildContext context, SearchController controller) {
              return IconButton(
                icon: const Icon(Icons.search),
                onPressed: () {
                  controller.openView();
                },
              );
            }, suggestionsBuilder: (BuildContext context, SearchController controller) {
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
            }),
          ],
        ),
        body: ListView(
          children: [
            ListTile(
              leading: CircleAvatar(child: Text('A')),
              title: Text('Headline'),
              subtitle: Text('Supporting text'),
              trailing: Text('Supporting text'),
              isThreeLine: true,
            ),
            ListTile(
              leading: CircleAvatar(child: Text('A')),
              title: Text('Headline'),
              subtitle: Text('Supporting text'),
              trailing: Icon(Icons.favorite_rounded),
              isThreeLine: true,
              onTap: () {},
            ),
          ],
        ));
  }
}
