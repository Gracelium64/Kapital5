import 'package:flutter/material.dart';
import 'package:kapital_5/src/theme/palette.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SaveWidget extends StatefulWidget {
  final TextEditingController userInput;

  const SaveWidget({
    super.key,
    required this.userInput,
  });

  @override
  State<SaveWidget> createState() => _SaveWidgetState();
}

class _SaveWidgetState extends State<SaveWidget> {
  String? name = '';

  Future<void> sayMyName() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('name', widget.userInput.text);
  }

  Future<void> getName() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      name = prefs.getString('name');
    });
  }

  @override
  void initState() {
    super.initState();
    getName();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 16,
      children: [
        SizedBox(
          height: 16,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: TextFormField(
            controller: widget.userInput,
            decoration: InputDecoration(
              labelText: 'Tell me of the waters of your homeworld, Usul',
              labelStyle: TextStyle(fontSize: 14),
              hintText: 'Enter Name',
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Palette.darkTeal, width: 1),
              ),
            ),
          ),
        ),
        FilledButton(
          onPressed: () {
            setState(() {
              sayMyName();
              getName();
            });
          },
          child: Text('Save point'),
        ),
        name == '' ? SizedBox() : Text('Last saved name is $name'),
      ],
    );
  }
}
