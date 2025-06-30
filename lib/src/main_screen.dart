import 'package:flutter/material.dart';
import 'package:kapital_5/src/bunny.dart';
import 'package:kapital_5/src/data/databaserepository.dart';
import 'package:kapital_5/src/features/5.1.2_callback_functions/presentation/callback_functions.dart';
import 'package:kapital_5/src/features/5.2.2_futures/presentation/futures.dart';
import 'package:kapital_5/src/features/5.2.3_future_builder/presentation/my_future_builder.dart';
import 'package:kapital_5/src/features/5.3.1_user_input/presentation/login_screen.dart';
import 'package:kapital_5/src/features/5.3.1_user_input/presentation/text_input_app.dart';
import 'package:kapital_5/src/features/5.1.4_input_validation/presentation/input_validation.dart';
import 'package:kapital_5/src/features/5.3.3_shared_preferences/presentation/shared_prefs.dart';
import 'package:kapital_5/src/features/5.4.1_simple_api/presentation/simple_api.dart';
import 'package:kapital_5/src/features/ms_paint/presentation/ms_paint.dart';
import 'package:kapital_5/src/theme/palette.dart';

class MainScreen extends StatelessWidget {
  final DataBaseRepository repository;

  const MainScreen(this.repository, {super.key});

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    List<Widget> screensList = [
      MsPaint2172x1152(),
      Bunny(),
      LoginScreen(repository),
      TextInputApp(),
      InputValidation(repository),
      CallbackFunctions(),
      Futures(),
      MyFutureBuilder(repository),
      SharedPrefs(repository),
      SimpleApi(),
    ];

    return SizedBox(
      width: screenSize.width / 2,
      height: screenSize.height / 3,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Kapital 5 + 6'),
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
      ),
    );
  }
}
