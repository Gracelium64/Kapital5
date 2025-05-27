import 'dart:io' show Platform;
import 'package:flutter/material.dart';
import 'package:kapital_5/src/features/5.2.2_futures/domain/functions.dart';
import 'package:kapital_5/src/theme/palette.dart';

class Futures extends StatefulWidget {
  const Futures({super.key});

  @override
  State<Futures> createState() => _FuturesState();
}

class _FuturesState extends State<Futures> {
  TextEditingController userInput = TextEditingController(text: 'Go');

  double horizontalPadding = 0;
  double verticallPadding = 0;
  String tony = 'Go';
  bool isLoading = false;
  String buttonText = 'Click me!';

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
            Stack(
              children: [
                ElevatedButton(
                  onPressed:
                      isLoading
                          ? null
                          : () async {
                            setState(() {
                              isLoading = true;
                            });
                            String result = await threeTimesTony(
                              userInput.text,
                            );
                            setState(() {
                              tony = result;
                              isLoading = false;
                              buttonText = 'Click me not!';
                            });
                            await Future.delayed(Duration(seconds: 2)).then((
                              _,
                            ) {
                              setState(() {
                                tony = 'Hold on..';
                              });
                            });
                            isLoading = true;
                            await Future.delayed(Duration(seconds: 2)).then((
                              _,
                            ) {
                              setState(() {
                                tony = '...';
                              });
                            });
                            await Future.delayed(Duration(seconds: 2)).then((
                              _,
                            ) {
                              setState(() {
                                tony = 'Go';
                                buttonText = 'Click me!';
                                isLoading = false;
                              });
                            });
                          },

                  child: isLoading ? Text('Loading') : Text(buttonText),
                ),
                Positioned(
                  top: 4,
                  left: 32,
                  child: isLoading ? CircularProgressIndicator() : SizedBox(),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 116),
              child: TextFormField(
                controller: userInput,
                decoration: InputDecoration(
                  labelText: 'Test me',
                  hintText: 'If you dare',
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Palette.darkTeal, width: 1),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    userInput.dispose();
    super.dispose();
  }
}
