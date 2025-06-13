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
  late Future<String> ipFuture;
  late Future<String> cityFuture;
  late Future<String> countryFuture;

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

  Future<String> ipDisplay() async {
    final reponseIp = await http.get(
      Uri.parse('https://api.ipify.org/?format=json'),
    );
    String jsonStringIp = reponseIp.body;
    final jsonConvertedIp = jsonDecode(jsonStringIp);
    return jsonConvertedIp['ip'];
  }

  Future<String> ipCity(String ip) async {
    final responseIpCity = await http.get(
      Uri.parse('https://ipinfo.io/$ip/geo'),
    );
    String jsonStringIpCity = responseIpCity.body;
    final jsonConvertedIpCity = jsonDecode(jsonStringIpCity);
    return jsonConvertedIpCity['city'];
  }

  Future<String> ipCountry(String ip) async {
    final responseIpCountry = await http.get(
      Uri.parse('https://ipinfo.io/$ip/geo'),
    );
    String jsonStringIpCountry = responseIpCountry.body;
    final jsonConvertedIpCountry = jsonDecode(jsonStringIpCountry);
    return jsonConvertedIpCountry['country'];
  }

  double horizontalPadding = 0;
  double verticallPadding = 0;

  @override
  void initState() {
    super.initState();
    ipFuture = ipDisplay();
    cityFuture = ipFuture.then((ip) {
      return ipCity(ip);
    });
    countryFuture = ipFuture.then((ip) {
      return ipCountry(ip);
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
              Spacer(),
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
                  FutureBuilder<String>(
                    future: countryFuture,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Text('Looking up your location');
                      } else if (snapshot.hasError) {
                        return Text('Error: ${snapshot.error}');
                      } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                        return Text('No IP found');
                      }

                      return Text(snapshot.data.toString());
                    },
                  ),
                  FutureBuilder<String>(
                    future: cityFuture,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Text('Looking up your location');
                      } else if (snapshot.hasError) {
                        return Text('Error: ${snapshot.error}');
                      } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                        return Text('No IP found');
                      }

                      return Text(snapshot.data.toString());
                    },
                  ),

                  SizedBox(
                    height: 50,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
