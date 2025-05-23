import 'package:flutter/material.dart';
import 'package:kapital_5/src/features/5.1.4_input_validation/domain/validators.dart';
import 'package:kapital_5/src/features/5.1.4_input_validation/domain/validators_advanced.dart';
import 'package:kapital_5/src/theme/palette.dart';

class UsernameValidBox extends StatefulWidget {
  const UsernameValidBox({super.key});

  @override
  State<UsernameValidBox> createState() => _UsernameValidBoxState();
}

class _UsernameValidBoxState extends State<UsernameValidBox> {
  @override
  Widget build(BuildContext context) {
    IconData lengthMin = isUserLengthMin ? Icons.check : Icons.error;
    IconData lengthMax = !isUserLengthMax ? Icons.check : Icons.error;
    IconData space = !isUserSpace ? Icons.check : Icons.error;
    IconData start = !isUserCharacter ? Icons.check : Icons.error;
    IconData english = !isUserEnglish ? Icons.check : Icons.error;
    TextEditingController userName = TextEditingController(text: '');

    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          height: 220,
          width: 365,
          child: Column(
            children: [
              TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: userNameValidation,
                controller: userName,
                onChanged: (value) {
                  // setState(() {
                  getUserNameValidation(value);
                  // });
                },
                decoration: InputDecoration(
                  labelText: 'User Name',
                  hintText: 'Enter User Name',
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Palette.darkTeal, width: 1),
                  ),
                ),
              ),

              Row(
                spacing: 8,
                children: [
                  Icon(lengthMin),
                  Text('User Name must have at least 3 characters'),
                ],
              ),
              Row(
                spacing: 8,
                children: [
                  Icon(lengthMax),
                  Text('User Name can only be 20 characters long'),
                ],
              ),
              Row(
                spacing: 8,
                children: [
                  Icon(space),
                  Text('Empty spaces are not allowed in the User Name'),
                ],
              ),
              Row(
                spacing: 8,
                children: [
                  Icon(start),
                  Text('User Name must begin with a letter'),
                ],
              ),
              Row(
                spacing: 8,
                children: [
                  Icon(english),
                  Text('Amtliche Sprache dieser App is Englisch'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
