import 'package:flutter/material.dart';

class FutureBuilderIpDetails extends StatelessWidget {
  final String whatDetail;
  final String loadingMsg;

  const FutureBuilderIpDetails({
    super.key,
    required this.ipFutureDetails,
    required this.whatDetail,
    required this.loadingMsg,
  });

  final Future<Map<String, dynamic>> ipFutureDetails;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map<String, dynamic>>(
      future: ipFutureDetails,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text(loadingMsg);
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Text('No IP found');
        }
        final data = snapshot.data!;

        return Text(data[whatDetail]);
      },
    );
  }
}
