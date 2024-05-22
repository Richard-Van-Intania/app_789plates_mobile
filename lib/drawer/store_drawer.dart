import 'dart:io';
import 'package:app_789plates_mobile/provider/profile.dart';
import 'package:http/http.dart' as http;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import '../constants.dart';

class StoreDrawer extends HookConsumerWidget {
  const StoreDrawer({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final fetchProfile = ref.watch(fetchProfileProvider);
    final editName = ref.watch(editNameProvider);
    final editInformation = ref.watch(editInformationProvider);
    return Scaffold(
      body: Center(
        child: fetchProfile.when(
          data: (data) => data.statusCode == 200
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(data.model.email, style: const TextStyle(fontSize: 24.0)),
                    Text(data.model.name, style: const TextStyle(fontSize: 24.0)),
                    Text(data.model.information ?? 'empty', style: const TextStyle(fontSize: 24.0)),
                    TextButton(
                        onPressed: () {
                          ref.read(editNameProvider.notifier).fetch('hello, Richard!');
                        },
                        child: Text('editName')),
                    TextButton(
                        onPressed: () {
                          ref.read(editInformationProvider.notifier).fetch('chok dee tabien');
                        },
                        child: Text('editInformation')),
                  ],
                )
              : const Text('Uh oh. Something went wrong!'),
          error: (error, stackTrace) => const Text('Uh oh. Something went wrong!'),
          loading: () => const CircularProgressIndicator(),
        ),
      ),
    );
  }
}
