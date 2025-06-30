import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kapital_5/src/features/5.4.1_simple_api/presentation/widgets/future_builder_ip_details.dart';
import 'package:kapital_5/src/theme/palette.dart';
import 'package:kapital_5/src/features/5.4.1_simple_api/domain/functions.dart';

class SimpleApi extends StatefulWidget {
  const SimpleApi({super.key});

  @override
  State<SimpleApi> createState() => _SimpleApiState();
}

class _SimpleApiState extends State<SimpleApi> {
  Future<String>? bullshit;
  late Future<String> ipFuture;
  late Future<Map<String, dynamic>> ipFutureDetails;
  List<String> bullshitList = [];
  final ScrollController getDown = ScrollController();

  double horizontalPadding = 0;
  double verticallPadding = 0;

  @override
  void initState() {
    super.initState();
    ipFuture = ipDisplay();
    ipFutureDetails = ipFuture.then((ip) {
      return ipDetails(ip);
    });
  }

  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS) {
      horizontalPadding = 124;
      verticallPadding = 50;
    } else if (Platform.isAndroid) {
      horizontalPadding = 128;
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
          child: Text('5.4.1'),
        ),
        title: Text('Simple API'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          spacing: 16,
          children: [
            SizedBox(),
            Text(
              'Welcome to Corporate Bullshit Generator',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  bullshit = bullshitLoader();
                });
              },
              child: Text('Bullshit me'),
            ),
            bullshit == null
                ? SizedBox()
                : FutureBuilder<String>(
                  future: bullshit,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return CircularProgressIndicator();
                    } else if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                      return Text('No bullshit available');
                    }

                    final phrase = snapshot.data!;

                    if (!bullshitList.contains(phrase)) {
                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        setState(() {
                          bullshitList.add(phrase);
                        });
                      });

                      getDown.animateTo(
                        getDown.position.maxScrollExtent,
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeOut,
                      );
                    }

                    return Text(
                      phrase,
                      textAlign: TextAlign.center,
                    );
                  },
                ),
            Spacer(),
            SizedBox(
              height: 200,
              child: ListView.builder(
                controller: getDown,
                itemCount: bullshitList.length,
                itemBuilder: (context, index) {
                  String currentItem = bullshitList[index];
                  return Container(
                    margin: const EdgeInsets.symmetric(vertical: 0),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: Palette.lightTeal,
                      border: Border.all(
                        color: Palette.highlight,
                        width: 1,
                      ),
                    ),
                    child: GestureDetector(
                      onTap: () {
                        Clipboard.setData(ClipboardData(text: currentItem));
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            duration: Duration(milliseconds: 500),
                            content: Text(
                              'Copied to clipboard',
                              style: TextStyle(color: Palette.basicBitchWhite),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        );
                      },
                      child: Text(
                        currentItem,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  );
                },
              ),
            ),
            Column(
              children: [
                FutureBuilder<String>(
                  future: ipFuture,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Text('Looking up your IP');
                    } else if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                      return Text('No IP found');
                    }

                    return Text(snapshot.data.toString());
                  },
                ),
                FutureBuilderIpDetails(
                  ipFutureDetails: ipFutureDetails,
                  whatDetail: 'country',
                  loadingMsg: 'Looking up your location',
                ),
                FutureBuilderIpDetails(
                  ipFutureDetails: ipFutureDetails,
                  whatDetail: 'city',
                  loadingMsg: '',
                ),
                SizedBox(
                  height: 50,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
