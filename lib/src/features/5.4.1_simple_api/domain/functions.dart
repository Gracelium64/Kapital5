import 'dart:convert';
import 'package:http/http.dart' as http;

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
  await Future.delayed(Duration(milliseconds: 500));
  final reponseIp = await http.get(
    Uri.parse('https://api.ipify.org/?format=json'),
  );
  String jsonStringIp = reponseIp.body;
  final jsonConvertedIp = jsonDecode(jsonStringIp);
  return jsonConvertedIp['ip'];
}

Future<Map<String, dynamic>> ipDetails(String ip) async {
  await Future.delayed(Duration(milliseconds: 750));
  final responseipDetails = await http.get(
    Uri.parse('https://ipinfo.io/$ip/geo'),
  );
  String jsonStringIpDetails = responseipDetails.body;
  final jsonConvertedIpDetails = jsonDecode(jsonStringIpDetails);
  return jsonConvertedIpDetails;
}
