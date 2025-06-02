import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:kapital_5/src/app.dart';
import 'package:kapital_5/src/data/databaserepository.dart';
import 'package:kapital_5/src/data/mockdatabaserepository.dart';
import 'package:device_preview/device_preview.dart';

void main() {
  DataBaseRepository repository = MockDataRepository();

//  runApp(
//     DevicePreview(
//       enabled: !kReleaseMode,
//       builder: (context) => App(repository),
//     ),
//   );


  runApp(App(repository));
}
