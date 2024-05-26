import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../initialize.dart';

class HelpAndSupportDrawer extends StatefulHookConsumerWidget {
  const HelpAndSupportDrawer({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HelpAndSupportDrawerState();
}

class _HelpAndSupportDrawerState extends ConsumerState<HelpAndSupportDrawer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(16.0),
        child: CachedNetworkImage(
          imageUrl: '${cdnDomainName}plates/plates-52d3be64-c3f8-4ec9-b718-96efbca54889.jpg',
          placeholder: (context, url) => CircularProgressIndicator(),
          errorWidget: (context, url, error) => Icon(Icons.error),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
      ),
    );
  }
}
