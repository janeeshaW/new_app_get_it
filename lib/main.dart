import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:news_app/app.dart';
import 'package:news_app/flavors.dart';
import 'package:path_provider/path_provider.dart';
import 'package:news_app/core/services/dependency_injection.dart' as di;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var path = await getApplicationDocumentsDirectory();
  Hive.init(path.path);
  Hive.initFlutter();
  // await Hive.openBox(favoritesBox);
  await di.setupLocator();
  F.appFlavor = Flavor.DEV;
  runApp(const App());
}
