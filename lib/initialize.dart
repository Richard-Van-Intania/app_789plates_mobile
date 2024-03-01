import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

late final SharedPreferences prefs;
late final String appDocumentsDir;
late final String tempDir;

Future<void> initialize() async {
  prefs = await SharedPreferences.getInstance();
  appDocumentsDir = (await getApplicationDocumentsDirectory()).path;
  tempDir = (await getTemporaryDirectory()).path;
}
