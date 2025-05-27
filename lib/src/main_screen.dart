import 'package:flutter/material.dart';
import 'package:kapital_5/src/bunny.dart';
import 'package:kapital_5/src/data/databaserepository.dart';
import 'package:kapital_5/src/features/5.1.2_callback_functions/presentation/callback_functions.dart';
import 'package:kapital_5/src/features/5.2.2_futures/presentation/futures.dart';
import 'package:kapital_5/src/features/5.3.1_user_input/presentation/login_screen.dart';
import 'package:kapital_5/src/features/5.3.1_user_input/presentation/text_input_app.dart';
import 'package:kapital_5/src/features/5.1.4_input_validation/presentation/input_validation.dart';
import 'package:kapital_5/src/theme/palette.dart';

class MainScreen extends StatelessWidget {
  final DataBaseRepository repository;

  const MainScreen(this.repository, {super.key});

  @override
  Widget build(BuildContext context) {
    List<Widget> screensList = [
      Bunny(),
      LoginScreen(repository),
      TextInputApp(),
      InputValidation(repository),
      CallbackFunctions(),
      Futures(),
    ];

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Kapital 5'),
        backgroundColor: Palette.darkTeal,
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: screensList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => screensList[index],
                        ),
                      );
                    },
                    leading: Icon(Icons.assignment),

                    title: Text('${screensList[index]}'),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
