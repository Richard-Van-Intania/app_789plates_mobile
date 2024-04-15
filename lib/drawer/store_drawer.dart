import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class StoreDrawer extends StatefulHookConsumerWidget {
  const StoreDrawer({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _StoreDrawerState();
}

class _StoreDrawerState extends ConsumerState<StoreDrawer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(16.0),
        // without middleware
        // child: Image.network(
        //   'http://10.0.2.2:8700/assets/1509044_10200514446903724_1885352073_n.jpg',
        //   errorBuilder: (context, error, stackTrace) => Image.asset('assets/images/Image.png'),
        // ),
        // with middleware
        child: Image(
          image: CachedNetworkImageProvider(
            'http://10.0.2.2:8700/assets/capture (1).png',
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
              HttpHeaders.authorizationHeader: 'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJhcHA3ODlwbGF0ZXMiLCJzdWIiOiIxOCIsImV4cCI6MTcxMzE4MDM4MCwiaWF0IjoxNzEzMTc2NzgwfQ.bEfNa3gVNgIrLpOGLCZmiZldni1vRpdNKUBigo81xB8',
            },
          ),
          errorBuilder: (context, error, stackTrace) => Image.asset('assets/images/Image.png'),
        ),
      ),
    );
  }
}
