import 'dart:io' show Platform;

import 'package:flutter/material.dart';
import 'package:kapital_5/src/data/databaserepository.dart';
import 'package:kapital_5/src/features/5.2.3_future_builder/domain/functions.dart';
import 'package:kapital_5/src/theme/palette.dart';

class MyFutureBuilder extends StatefulWidget {
  final DataBaseRepository repository;

  const MyFutureBuilder(this.repository, {super.key});

  @override
  State<MyFutureBuilder> createState() => _MyFutureBuilderState();
}

class _MyFutureBuilderState extends State<MyFutureBuilder> {
  double horizontalPadding = 0;
  double verticallPadding = 0;
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
                  itemFuture = addToCart(widget.repository);
                  hasUpdated = false;
                });
              },
              child: Text('Click me!'),
            ),
            SizedBox(
              height: 158,
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
                              WidgetsBinding.instance.addPostFrameCallback((_) {
                                if (!hasUpdated) {
                                  setState(() {
                                    hasUpdated = true;
                                  });
                                }
                              });

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
                                    debugPrint(
                                      'Number of Internets ${widget.repository.getInternets().length.toString()}',
                                    );
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(widget.repository.getInternets().length.toString()),
                      Icon(Icons.star_rounded, color: Palette.lightTeal),
                    ],
                  ),
                ],
              ),
            ),
            Spacer(),
            Expanded(
              flex: 1,
              child: ListView.builder(
                itemCount: widget.repository.getInternets().length,
                itemBuilder: (context, index) {
                  String currentItem = widget.repository.getInternets()[index];
                  return ListTile(
                    minTileHeight: 40,
                    textColor:
                        currentItem.contains('-1')
                            ? Palette.neonRed
                            : Palette.neonGreen,
                    tileColor: Palette.lightTeal,
                    shape: Border.all(
                      style: BorderStyle.solid,
                      color: Palette.highlight,
                      width: 1,
                    ),

                    title: Text(currentItem),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
