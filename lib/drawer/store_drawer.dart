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
      body: Container(
        padding: EdgeInsets.all(16.0),
        // without middleware
        // child: Image.network(
        //   'http://10.0.2.2:8700/assets/1509044_10200514446903724_1885352073_n.jpg',
        //   errorBuilder: (context, error, stackTrace) => Image.asset('assets/images/Image.png'),
        // ),
        // with middleware
        child: Column(
          children: [
            Image(
              image: CachedNetworkImageProvider(
                'http://10.0.2.2:8700/assets/$img',
                headers: <String, String>{'Content-Type': 'image/jpeg', HttpHeaders.authorizationHeader: 'Bearer $keyToken'},
              ),
              errorBuilder: (context, error, stackTrace) => Image.asset('assets/images/Image.png'),
            ),
            TextButton(onPressed: () {}, child: Text("refresh"))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () async {
        final imagePicker = ImagePicker();
        final pickedImage = await imagePicker.pickImage(source: ImageSource.camera);
        if (pickedImage != null) {
          final file = File(pickedImage.path);

          final bytes = await file.readAsBytes();

          final Uri uri = Uri(
            scheme: 'http',
            host: '10.0.2.2',
            port: 8700,
            path: '/test_bytes',
            queryParameters: {'file_name': pickedImage.name},
          );

          final response = await http.post(
            uri,
            headers: <String, String>{'Content-Type': 'image/jpeg', HttpHeaders.authorizationHeader: 'Bearer $keyToken'},
            body: bytes,
          );
          if (response.statusCode == 200) {
            img = response.body;
            setState(() {});
          }
        }
      }),
    );
  }
}
