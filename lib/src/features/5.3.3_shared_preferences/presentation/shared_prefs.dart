import 'dart:io' show Platform;
import 'package:flutter/material.dart';
import 'package:kapital_5/src/data/databaserepository.dart';
import 'package:kapital_5/src/features/5.3.3_shared_preferences/presentation/widgets/daily_counter.dart';
import 'package:kapital_5/src/features/5.3.3_shared_preferences/presentation/widgets/save_widget.dart';

class SharedPrefs extends StatefulWidget {
  final DataBaseRepository repository;

  const SharedPrefs(this.repository, {super.key});

  @override
  State<SharedPrefs> createState() => _SharedPrefsState();
}

class _SharedPrefsState extends State<SharedPrefs> {
  TextEditingController userInput = TextEditingController(text: '');

  double horizontalPadding = 0;
  double verticallPadding = 0;

  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS) {
      horizontalPadding = 74;
      verticallPadding = 50;
    } else if (Platform.isAndroid) {
      horizontalPadding = 78;
      verticallPadding = 40;
    }

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        flexibleSpace: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: horizontalPadding,
            vertical: verticallPadding,
          ),
          child: Text('5.3.3'),
        ),
        title: Text('Shared Preferences'),
      ),
      body: Column(
        spacing: 16,
        children: [
          SaveWidget(userInput: userInput),
          Divider(),
          DailyCounter(),
        ],
      ),
    );
  }

  @override
  void dispose() {
    userInput.dispose();
    super.dispose();
  }
}
