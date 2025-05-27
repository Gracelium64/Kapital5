import 'dart:io' show Platform;
import 'package:flutter/material.dart';
import 'package:kapital_5/src/features/5.2.2_futures/domain/functions.dart';

class Futures extends StatefulWidget {
  const Futures({super.key});

  @override
  State<Futures> createState() => _FuturesState();
}

class _FuturesState extends State<Futures> {
  double horizontalPadding = 0;
  double verticallPadding = 0;
  String tony = 'Go';
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS) {
      horizontalPadding = 144;
      verticallPadding = 50;
    } else if (Platform.isAndroid) {
      horizontalPadding = 156;
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
          child: Text('5.3.2'),
        ),
        title: Text('Futures'),
      ),
      body: Center(
        child: Column(
          spacing: 32,
          children: [
            SizedBox(),
            Text(tony),
            ElevatedButton(
              onPressed: () async {
                setState(() {
                  isLoading = true;
                });
                String result = await threeTimesTony('Go');
                setState(() {
                  tony = result;
                  isLoading = false;
                });
                isLoading = true;
                await Future.delayed(Duration(seconds: 2)).then((_) {
                  setState(() {
                    tony = 'Go';
                    isLoading = false;
                  });
                });
              },

              child: isLoading ? Text('Loading') : Text('Click me!'),
            ),
          ],
        ),
      ),
    );
  }
}
