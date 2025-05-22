import 'package:flutter/material.dart';
import 'package:kapital_5/src/data/databaserepository.dart';
import 'package:kapital_5/src/features/5.1.4_input_validation/domain/validators.dart';
import 'package:kapital_5/src/features/5.3.1_user_input/domain/app_user.dart';
import 'package:kapital_5/src/features/5.3.1_user_input/presentation/logged_in.dart';
import 'package:kapital_5/src/features/5.3.1_user_input/presentation/login_screen.dart';
import 'package:kapital_5/src/theme/palette.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class InputValidation extends StatefulWidget {
  final DataBaseRepository repository;

  const InputValidation(this.repository, {super.key});

  @override
  State<InputValidation> createState() => _InputValidationState();
}

class _InputValidationState extends State<InputValidation> {
  TextEditingController userName = TextEditingController(text: '');
  TextEditingController userEmail = TextEditingController(text: '');
  TextEditingController userPassword = TextEditingController(text: '');

  final formKey = GlobalKey<FormState>();
  // bool isFormValid = false;
  bool isButtonEnabled = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('5.1.4 Input Validation')),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          onChanged: () {
            setState(() {
              final bool isFormValid = formKey.currentState!.validate();
              isButtonEnabled = !isFormValid;
            });
          },
          key: formKey,
          child: Column(
            spacing: 12,
            children: [
              SizedBox(height: 8),
              Text(
                'Registeration',
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
                        : () {
                          setState(() {
                            bool isFormValid = formKey.currentState!.validate();
                            isButtonEnabled = !isFormValid;

                            widget.repository.createAppUser(
                              AppUser(
                                userName: userName.text,
                                email: userEmail.text,
                                password: userPassword.text,
                              ),
                            );
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder:
                                    (context) => LoginScreen(widget.repository),
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
            ],
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

// AutovalidateMode: AutovalidateMode.always
// validator: userNameValidation
