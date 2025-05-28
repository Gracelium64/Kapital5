import 'dart:io' show Platform;

import 'package:flutter/material.dart';

class MyFutureBuilder extends StatefulWidget {
  const MyFutureBuilder({super.key});

  @override
  State<MyFutureBuilder> createState() => _MyFutureBuilderState();
}

class _MyFutureBuilderState extends State<MyFutureBuilder> {
  double horizontalPadding = 0;
  double verticallPadding = 0;
  List<String> internetsWon = [];
  Future<bool>? itemFuture;
  bool hasUpdated = false;

  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS) {
      horizontalPadding = 100;
      verticallPadding = 50;
    } else if (Platform.isAndroid) {
      horizontalPadding = 108;
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
          child: Text('5.2.3'),
        ),
        title: Text('Future Builder'),
      ),
      body: Center(
        child: Column(
          spacing: 8,
          children: [
            SizedBox(),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  itemFuture = addToCart('Pizza');
                  hasUpdated = false;
                });
              },
              child: Text('Click me!'),
            ),
            SizedBox(
              height: 102,
              child: Column(
                spacing: 12,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  itemFuture != null
                      ? FutureBuilder(
                        future: itemFuture,
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.done) {
                            if (snapshot.hasError) {
                              return Column(
                                children: [
                                  Icon(Icons.error, size: 50),
                                  Text(snapshot.error.toString()),
                                ],
                              );
                            } else {
                              if (snapshot.data == true && !hasUpdated) {
                                WidgetsBinding.instance.addPostFrameCallback((
                                  _,
                                ) {
                                  setState(() {
                                    hasUpdated = true;
                                  });
                                });
                              }
                              return Text(
                                'Internets won - ${snapshot.data.toString() == 'true' ? 'Yes!' : 'No!'}',
                              );
                            }
                          } else {
                            return CircularProgressIndicator();
                          }
                        },
                      )
                      : SizedBox(),

                  Text('Wallet:'),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: ListView.builder(
                itemCount: internetsWon.length,
                itemBuilder: (context, index) {
                  String currentItem = internetsWon[index];
                  return ListTile(title: Text(currentItem));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<bool> addToCart(String data) async {
    await Future.delayed(Duration(seconds: 2));
    int randomNumber = DateTime.now().microsecondsSinceEpoch % 3;

    if (randomNumber == 0) {
      internetsWon.add('1 Internets, use it wisely');
      return true;
    } else if (randomNumber == 1) {
      return false;
    } else {
      1 ~/ 0;
      return false;
    }
  }
}
