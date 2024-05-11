import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';

import '../constants.dart';

class StoreDrawer extends StatefulHookConsumerWidget {
  const StoreDrawer({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _StoreDrawerState();
}

class _StoreDrawerState extends ConsumerState<StoreDrawer> {
  String img = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('StoreDrawer'),
      ),
    );
  }
}
