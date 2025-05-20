import 'package:flutter/material.dart';
import 'package:kapital_5/src/data/databaserepository.dart';
import 'package:kapital_5/src/features/5.3.1_user_input/presentation/logged_in.dart';
import 'package:kapital_5/src/theme/palette.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class LoginScreen extends StatefulWidget {
  final DataBaseRepository repository;

  const LoginScreen(this.repository, {super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController userName = TextEditingController(text: '');
  TextEditingController userPassword = TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kapital 5.3.1'),
              ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          spacing: 12,
          children: [
            SizedBox(height: 8),
            Text(
              'Follow the white rabbit',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            TextFormField(
              controller: userName,
              decoration: InputDecoration(
                labelText: 'Name',
                hintText: 'Enter Name',
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Palette.darkTeal, width: 1),
                ),
              ),
            ),
            TextFormField(
              controller: userPassword,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
                hintText: 'Enter Password',

                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Palette.darkTeal, width: 1),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  final tempUser = widget.repository.getUser(
                    userName.text,
                    userPassword.text,
                  );

                  if (tempUser != null) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:
                            (context) => LoggedIn(widget.repository, tempUser),
                      ),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Align(
                          alignment: Alignment.center,
                          child: Text(
                            'Computer says "No"',
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                        ),
                        backgroundColor: Palette.darkTeal,
                      ),
                    );
                  }
                  userName.text = '';
                  userPassword.text = '';
                });
              },
              child: Row(
                spacing: 4,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    MdiIcons.rabbitVariantOutline,
                    color: Palette.basicBitchWhite,
                  ),
                  Text('Login'),
                  Icon(
                    MdiIcons.rabbitVariantOutline,
                    color: Palette.basicBitchWhite,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    userName.dispose();
    userPassword.dispose();
    super.dispose();
  }
}
