import 'package:flutter/material.dart';
import 'dart:io' show Platform;

class TextInputApp extends StatefulWidget {
  const TextInputApp({super.key});

  @override
  State<TextInputApp> createState() => _TextInputAppState();
}

class _TextInputAppState extends State<TextInputApp> {
  // State
  List<String> messages = [
    "Hello Batch #9",
    "Welcome to Kapitel 5!",
    "Live long, and prosper",
  ];

  double horizontalPadding = 0;
  double verticallPadding = 0;

  TextEditingController textInput = TextEditingController(text: '');

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
          child: Text('5.3.1'),
        ),
        title: Text('Text Input App'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: messages.length,
                itemBuilder: (context, index) {
                  final String message = messages[index];
                  return Text(message);
                },
              ),
            ),
            SizedBox(height: 64),
            TextField(
              controller: textInput,
              decoration: const InputDecoration(
                labelText: 'Enter text',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  messages.add(textInput.text);
                  textInput.text = '';
                });
              },
              child: const Text('Send'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    textInput.dispose();
    super.dispose();
  }
}