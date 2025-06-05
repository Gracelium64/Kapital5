import 'dart:io' show Platform;
import 'package:flutter/material.dart';
import 'package:kapital_5/src/data/databaserepository.dart';
import 'package:kapital_5/src/features/5.3.3_shared_preferences/presentation/widgets/daily_counter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs extends StatefulWidget {
  final DataBaseRepository repository;

  const SharedPrefs(this.repository, {super.key});

  @override
  State<SharedPrefs> createState() => _SharedPrefsState();
}

class _SharedPrefsState extends State<SharedPrefs> {
  double horizontalPadding = 0;
  double verticallPadding = 0;

  int counter = 0;

  @override
  void initState() {
    super.initState();
    loadCounter();
    resetCounterDaily();
  }

  Future<void> resetCounterDaily() async {
    final prefs = await SharedPreferences.getInstance();
    final lastCount = prefs.getString('lastCount');
    final now = DateTime.now();

    if (lastCount != null) {
      final lastCounted = DateTime.parse(lastCount);
      final isSameDay =
          lastCounted.year == now.year &&
          lastCounted.month == now.month &&
          lastCounted.day == now.day;

      if (!isSameDay) {
        setState(() {
          counter = 0;
        });
        prefs.setInt('counter', 0);
        prefs.setString('lastCount', now.toIso8601String());
      }
    }
  }

  Future<void> setDate() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('lastCount', DateTime.now().toIso8601String());
  }

  Future<void> loadCounter() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      counter = prefs.getInt('counter') ?? 0;
    });
  }

  Future<void> setCounter() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      prefs.setInt('counter', counter);
    });
  }

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
        children: [
          DailyCounter(counter: counter),
        ],
      ),
    );
  }
}
