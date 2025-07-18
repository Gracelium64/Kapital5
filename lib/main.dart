import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:kapital_5/firebase_options.dart';
import 'package:kapital_5/src/app.dart';
import 'package:kapital_5/src/data/authrepository.dart';
import 'package:kapital_5/src/data/databaserepository.dart';
import 'package:kapital_5/src/data/firebase_auth_repository.dart';
import 'package:kapital_5/src/data/mockdatabaserepository.dart';
import 'package:device_preview/device_preview.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: 'black_speech.env');
  try {
    await Firebase.initializeApp(options: FirebaseEnvOptions.currentPlatform);
  } catch (e) {
    if (e.toString().contains('already exists')) {
    } else {
      rethrow;
    }
  }
  final Authrepository auth = FirebaseAuthRepository();
  final DataBaseRepository repository = MockDataRepository();

  runApp(App(repository, auth));

  //  runApp(
  //     DevicePreview(
  //       enabled: !kReleaseMode,
  //       builder: (context) => App(repository),
  //     ),
  //   );
}


// Column(
//                   children: [
//                     ?_errorOutput,
//                   ],
//                 ),