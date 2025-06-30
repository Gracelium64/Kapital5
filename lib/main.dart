import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:kapital_5/firebase_options.dart';
import 'package:kapital_5/src/app.dart';
import 'package:kapital_5/src/data/databaserepository.dart';
import 'package:kapital_5/src/data/mockdatabaserepository.dart';
import 'package:device_preview/device_preview.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  DataBaseRepository repository = MockDataRepository();

  //  runApp(
  //     DevicePreview(
  //       enabled: !kReleaseMode,
  //       builder: (context) => App(repository),
  //     ),
  //   );

  runApp(App(repository));
}
