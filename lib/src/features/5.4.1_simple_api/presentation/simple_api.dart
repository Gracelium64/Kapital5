import 'dart:io';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class SimpleApi extends StatefulWidget {
  const SimpleApi({super.key});

  @override
  State<SimpleApi> createState() => _SimpleApiState();
}

class _SimpleApiState extends State<SimpleApi> {
  Future<String>? bullshit;

  Future<String> bullshitLoader() async {
    final response = await http.get(
      Uri.parse(
        'https://corporatebs-generator.sameerkumar.website',
      ),
    );

    String jsonString = response.body;
    final jsonConverted = jsonDecode(jsonString);
    return jsonConverted['phrase'];
  }

  double horizontalPadding = 0;
  double verticallPadding = 0;

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
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            spacing: 16,
            children: [
              SizedBox(),
              Text(
                'Welcome to Bullshit Generator',
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

                      return Text(
                        snapshot.data!,
                        textAlign: TextAlign.center,
                      );
                    },
                  ),
            ],
          ),
        ),
      ),
    );
  }
}
