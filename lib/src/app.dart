import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:kapital_5/src/data/databaserepository.dart';
import 'package:kapital_5/src/main_screen.dart';
import 'package:kapital_5/src/theme/app_theme.dart';

class App extends StatelessWidget {
  final DataBaseRepository repository;

  const App(this.repository, {super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,

      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.dark,

      // home: UsernameValidBox(),
      home: MainScreen(repository),
    );
  }
}
