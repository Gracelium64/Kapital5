import 'package:flutter/material.dart';
import 'package:kapital_5/src/data/authrepository.dart';
import 'package:kapital_5/src/data/databaserepository.dart';
import 'package:kapital_5/src/features/5.1.4_input_validation/domain/validators.dart';
// import 'package:kapital_5/src/features/5.3.1_user_input/domain/app_user.dart';
// import 'package:kapital_5/src/features/5.3.1_user_input/presentation/login_screen.dart';
import 'package:kapital_5/src/theme/palette.dart';
import 'dart:io' show Platform;

class Register extends StatefulWidget {
  final DataBaseRepository repository;
  final Authrepository auth;

  const Register(this.repository, this.auth, {super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController userName = TextEditingController(text: '');
  TextEditingController userEmail = TextEditingController(text: '');
  TextEditingController userPassword = TextEditingController(text: '');

  final formKey = GlobalKey<FormState>();
  bool isButtonEnabled = true;

  double horizontalPadding = 0;
  double verticallPadding = 0;

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS) {
      horizontalPadding = 90;
      verticallPadding = 50;
    } else if (Platform.isAndroid) {
      horizontalPadding = 100;
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
          child: Text('5.1.4'),
        ),
        title: Text('Input Validation'),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: formKey,
          onChanged: () {
            setState(() {
              final bool isFormValid = formKey.currentState!.validate();
              isButtonEnabled = !isFormValid;
            });
          },
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              spacing: 12,
              children: [
                SizedBox(height: 8),
                Text(
                  'Registration',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: userNameValidation,
                  controller: userName,
                  decoration: InputDecoration(
                    labelText: 'User Name',
                    hintText: 'Enter User Name',
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Palette.darkTeal, width: 1),
                    ),
                  ),
                ),
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: userEmailValitation,
                  controller: userEmail,
                  decoration: InputDecoration(
                    labelText: 'E-Mail',
                    hintText: 'Enter a valid E-Mail',
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Palette.darkTeal, width: 1),
                    ),
                  ),
                ),
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: userPasswordValidation,
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
                  onPressed:
                      isButtonEnabled
                          ? null
                          : () async {
                            setState(() {
                              isLoading = true;
                            });

                            await Future.delayed(Duration(seconds: 3));
                            //// without this delay it loads almost automatically although in the async function there is a 3 seconds delay
                            final tempRegister =
                                widget.repository.createAppUser;

                            setState(() {
                              bool isFormValid =
                                  formKey.currentState!.validate();
                              isButtonEnabled = !isFormValid;

                              tempRegister(
                                AppUser(
                                  userName: userName.text,
                                  email: userEmail.text,
                                  password: userPassword.text,
                                ),
                              );
                              isLoading = false;
                              Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                  builder:
                                      (context) => LoginScreen(
                                        widget.repository,
                                        widget.auth,
                                      ),
                                ),
                              );
                            });
                          },

                  child: Row(
                    spacing: 4,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [Text('Register')],
                  ),
                ),
                SizedBox(height: 100),
                isLoading ? CircularProgressIndicator() : SizedBox(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    userName.dispose();
    userEmail.dispose();
    userPassword.dispose();
    super.dispose();
  }
}
