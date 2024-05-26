import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

late final SharedPreferences prefs;
late final String appDocumentsDir;
late final String tempDir;

Future<void> initialize() async {
  prefs = await SharedPreferences.getInstance();
  appDocumentsDir = (await getApplicationDocumentsDirectory()).path;
  tempDir = (await getTemporaryDirectory()).path;
}

final RegExp regex = RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$');

const int nullAliasInt = 0;
const String nullAliasString = 'null';
const String apiKey = 'A46442B3454C93571153AB45137A2';

const FlutterSecureStorage flutterSecureStorage = FlutterSecureStorage();

const int processing = 102;
const int preconditionRequired = 428;

const String cdnDomainName = 'https://d27r257vlsyci.cloudfront.net/';
