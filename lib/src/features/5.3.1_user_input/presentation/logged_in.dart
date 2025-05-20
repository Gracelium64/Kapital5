import 'package:flutter/material.dart';
import 'package:kapital_5/src/data/databaserepository.dart';
import 'package:kapital_5/src/features/5.3.1_user_input/domain/app_user.dart';
import 'package:kapital_5/src/theme/palette.dart';

class LoggedIn extends StatelessWidget {
  final DataBaseRepository repository;
  final AppUser user;

  const LoggedIn(this.repository, this.user, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome!'),
        backgroundColor: Palette.darkTeal,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.check, size: 64, color: Palette.neonGreen),
            Text('Welcome back ${user.name}!'),
          ],
        ),
      ),
    );
  }
}
