import 'dart:io' show Platform;
import 'package:flutter/material.dart';
import 'package:kapital_5/src/features/6.1.4_firestore_101/presentation/widgets/my_text_form_field.dart';
import 'package:kapital_5/src/features/6.1.5_Serialization/domain/serialization.dart';

class FirestoreVsSql extends StatefulWidget {
  const FirestoreVsSql({super.key});

  @override
  State<FirestoreVsSql> createState() => _FirestoreVsSqlState();
}

class _FirestoreVsSqlState extends State<FirestoreVsSql> {
  double horizontalPadding = 0;
  double verticallPadding = 0;

  List<String> outputLines = [];

  TextEditingController dailyUsersInput = TextEditingController(text: '');
  TextEditingController userDailyReadsInput = TextEditingController(text: '');
  TextEditingController userDailyWritesInput = TextEditingController(text: '');
  TextEditingController userDailyDeletesInput = TextEditingController(text: '');
  TextEditingController dailyTrafficMBInput = TextEditingController(text: '');
  TextEditingController dailyDataMBInput = TextEditingController(text: '');

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
            MyTextFormField(
              userInput: dailyUsersInput,
              hintText: 'Number of users',
              helperText: 'Number of users',
            ),
            MyTextFormField(
              userInput: userDailyReadsInput,
              hintText: 'Amount of reads per User',
              helperText: 'Amount of reads per User',
            ),
            MyTextFormField(
              userInput: userDailyWritesInput,
              hintText: 'Amount of writes per User',
              helperText: 'Amount of writes per User',
            ),
            MyTextFormField(
              userInput: userDailyDeletesInput,
              hintText: 'Amount of deletes per User',
              helperText: 'Amount of deletes per User',
            ),
            MyTextFormField(
              userInput: dailyTrafficMBInput,
              hintText: 'Traffic in MB daily',
              helperText: 'Traffic in MB daily',
            ),
            MyTextFormField(
              userInput: dailyDataMBInput,
              hintText: 'Data in MB daily',
              helperText: 'Data in MB daily',
            ),

            ElevatedButton(
              onPressed: () async {
                try {
                  final int dailyUsers = int.parse(dailyUsersInput.text);
                  final int dailyReads = int.parse(userDailyReadsInput.text);
                  final int dailyWrites = int.parse(userDailyWritesInput.text);
                  final int dailyDeletes = int.parse(
                    userDailyDeletesInput.text,
                  );
                  final int trafficMB = int.parse(dailyTrafficMBInput.text);
                  final int dataMB = int.parse(dailyDataMBInput.text);

                  final results = await serialization(
                    dailyUsers,
                    dailyReads,
                    dailyWrites,
                    dailyDeletes,
                    trafficMB,
                    dataMB,
                  );

                  setState(() {
                    outputLines = results;
                  });
                } catch (e) {
                  setState(() {
                    outputLines = [
                      'Error: All fields must have a valid number',
                    ];
                  });
                }
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

  @override
  void dispose() {
    dailyUsersInput.dispose();
    userDailyReadsInput.dispose();
    userDailyWritesInput.dispose();
    userDailyDeletesInput.dispose();
    dailyTrafficMBInput.dispose();
    dailyDataMBInput.dispose();
    super.dispose();
  }
}
