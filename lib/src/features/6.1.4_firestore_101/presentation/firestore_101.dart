import 'dart:io' show Platform;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kapital_5/src/data/databaserepository.dart';
import 'package:kapital_5/src/features/6.1.5_Serialization/domain/serialization.dart';
import 'package:kapital_5/src/features/6.1.4_firestore_101/presentation/widgets/my_text_form_field.dart';

class Firestore101 extends StatefulWidget {
  final DataBaseRepository repository;

  const Firestore101(this.repository, {super.key});

  @override
  State<Firestore101> createState() => _Firestore101State();
}

class _Firestore101State extends State<Firestore101> {
  TextEditingController userInput1 = TextEditingController(text: '');
  TextEditingController userInput2 = TextEditingController(text: '');
  TextEditingController userInput3 = TextEditingController(text: '');

  String? debugPrintout;
  double horizontalPadding = 0;
  double verticallPadding = 0;

  Future<void> _listCollectionsOnly() async {
    final input = userInput3.text;
    final baseDocPath = 'users/grace64${input.isNotEmpty ? '/$input' : ''}';

    final knownCollections = [
      'tasks',
      'userSettings',
      'current',
      'dailyTasks',
      'weeklyTasks',
    ];

    final buffer = StringBuffer();
    buffer.writeln('Path: $baseDocPath/');

    try {
      for (final colName in knownCollections) {
        final collectionPath = '$baseDocPath/$colName';

        final segments = collectionPath.split('/');
        if (segments.length.isOdd) {
          final snapshot =
              await FirebaseFirestore.instance
                  .collection(collectionPath)
                  .limit(1)
                  .get();

          if (snapshot.docs.isNotEmpty) {
            buffer.writeln('+ $colName');
          } else {
            buffer.writeln('- $colName (empty or not found)');
          }
        } else {
          buffer.writeln('Skipped invalid collection path: $collectionPath');
        }
      }
    } catch (e) {
      buffer.writeln('Error: $e');
    }

    setState(() {
      debugPrintout = buffer.toString();
    });
  }

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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            spacing: 4,
            children: [
              Text(
                'Enter Path of Collection or Document',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              SizedBox(
                height: 8,
              ),
              MyTextFormField(
                helperText: '/users/grace64/...',
                userInput: userInput3,
                hintText: 'List Sub-Collections in a Document',
              ),
              ElevatedButton(
                onPressed: _listCollectionsOnly,
                child: Text('List Sub-Collections in Document'),
              ),
              SizedBox(
                height: 32,
              ),
              MyTextFormField(
                helperText: '/users/grace64/...',
                userInput: userInput2,
                hintText: 'List Documents in a Collection',
              ),
              ElevatedButton(
                onPressed: () {
                  _countDocuments();
                },
                child: Text('List Documents in Collection'),
              ),
              SizedBox(
                height: 32,
              ),
              MyTextFormField(
                helperText: '/users/grace64/...',
                userInput: userInput1,
                hintText: 'Read a Document',
              ),
              ElevatedButton(
                onPressed: () {
                  _readDocument();
                },
                child: Text('Read Document'),
              ),

              SizedBox(height: 32),

              Text('$debugPrintout'),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    userInput1.dispose();
    userInput2.dispose();
    userInput3.dispose();
    super.dispose();
  }
}
