import 'dart:io' show Platform;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kapital_5/src/data/databaserepository.dart';
import 'package:kapital_5/src/theme/palette.dart';

class Firestore101 extends StatefulWidget {
  final DataBaseRepository repository;

  const Firestore101(this.repository, {super.key});

  @override
  State<Firestore101> createState() => _Firestore101State();
}

class _Firestore101State extends State<Firestore101> {
  TextEditingController userInput1 = TextEditingController(text: '');
  TextEditingController userInput2 = TextEditingController(text: '');

  String? debugPrintout;
  double horizontalPadding = 0;
  double verticallPadding = 0;

  Future<void> _countDocuments() async {
    final input = userInput2.text;
    final fullPath = 'users/grace64/$input';
    try {
      final querySnap =
          await FirebaseFirestore.instance.collection(fullPath).get();

      final count = querySnap.size;
      final docNames = querySnap.docs.map((doc) => doc.id).toList();

      final buffer = StringBuffer();
      buffer.writeln('PATH: $fullPath');
      buffer.writeln('Number of documents: $count');
      buffer.writeln('Documents:');
      for (final name in docNames) {
        buffer.writeln('- $name');
      }

      setState(() {
        debugPrintout = buffer.toString();
      });
    } catch (e) {
      setState(() {
        debugPrintout = e.toString();
      });
    }
  }

  Future<void> _readDocument() async {
    final input = userInput1.text;
    final fullPath = 'users/grace64/$input';

    try {
      final docSnap = await FirebaseFirestore.instance.doc(fullPath).get();

      if (docSnap.exists) {
        final Map<String, dynamic>? docData = docSnap.data();
        final buffer = StringBuffer();
        buffer.writeln('DOCUMENT: ${docSnap.id}');

        docData?.forEach((key, value) {
          buffer.writeln('$key: $value');
        });

        setState(() {
          debugPrintout = buffer.toString();
        });
      } else {
        debugPrintout = ('No such document found.');
      }
    } catch (e) {
      setState(() {
        debugPrintout = 'Error: $e';
      });
    }
  }

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
          child: Text('6.1.4'),
        ),
        title: Text('Firestore 101'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          spacing: 4,
          children: [
            TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              style: TextStyle(color: Palette.basicBitchBlack),
              controller: userInput1,
              decoration: InputDecoration(
                filled: true,
                fillColor: Palette.basicBitchWhite,
                hintText: 'Read a document, enter path',
                helperText: '/users/grace64/...',
                contentPadding: EdgeInsets.only(bottom: 14),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(15),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Palette.basicBitchBlack,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
                hintStyle: TextStyle(
                  color: Palette.basicBitchBlack,
                  fontFamily: 'Inter',
                  fontSize: 12,
                ),
              ),
              textAlign: TextAlign.center,
              textAlignVertical: TextAlignVertical.center,
            ),
            ElevatedButton(
              onPressed: () {
                _readDocument();
              },
              child: Text('Read document'),
            ),
            SizedBox(
              height: 32,
            ),
            TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              controller: userInput2,
              style: TextStyle(color: Palette.basicBitchBlack),
              decoration: InputDecoration(
                filled: true,
                fillColor: Palette.basicBitchWhite,
                hintText: 'Enter path',
                helperText: '/users/grace64/...',
                contentPadding: EdgeInsets.only(bottom: 14),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(15),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Palette.basicBitchBlack,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
                hintStyle: TextStyle(
                  color: Palette.basicBitchBlack,
                  fontFamily: 'Inter',
                  fontSize: 12,
                ),
              ),
              textAlign: TextAlign.center,
              textAlignVertical: TextAlignVertical.center,
            ),
            ElevatedButton(
              onPressed: () {
                _countDocuments();
              },
              child: Text('List documents in directory'),
            ),
            Text('$debugPrintout'),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    userInput1.dispose();
    userInput2.dispose();
    super.dispose();
  }
}
