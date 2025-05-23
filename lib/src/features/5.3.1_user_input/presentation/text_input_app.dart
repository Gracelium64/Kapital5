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
    "Hallo Batch #9",
    "Willkommen in Kapitel 5!",
    "Viel Erfolg",
  ];

  double horizontalPadding = 0;
  double verticallPadding = 0;

  TextEditingController textInput = TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS) {
      horizontalPadding = 112;
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
                labelText: 'Text eingeben',
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
              child: const Text('Absenden'),
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
