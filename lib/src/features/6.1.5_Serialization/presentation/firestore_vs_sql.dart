import 'dart:io' show Platform;

import 'package:flutter/material.dart';
import 'package:kapital_5/src/features/6.1.5_Serialization/domain/serialization.dart';

class FirestoreVsSql extends StatefulWidget {
  const FirestoreVsSql({super.key});

  @override
  State<FirestoreVsSql> createState() => _FirestoreVsSqlState();
}

List<String> outputLines = [];

class _FirestoreVsSqlState extends State<FirestoreVsSql> {
  double horizontalPadding = 0;
  double verticallPadding = 0;

  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS) {
      horizontalPadding = 116;
      verticallPadding = 50;
    } else if (Platform.isAndroid) {
      horizontalPadding = 120;
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
          child: Text('6.1.5'),
        ),
        title: Text('Firestore 101'),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () async {
                final results = await serialization();
                setState(() {
                  outputLines = results;
                });
              },
              child: Text('FireStore vs SQL Case Study'),
            ),
            SizedBox(height: 20),
            Text(
              outputLines.join(
                '\n',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
