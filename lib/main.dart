import 'package:flutter/material.dart';
import 'package:kapital_5/src/app.dart';
import 'package:kapital_5/src/data/databaserepository.dart';
import 'package:kapital_5/src/data/mockdatabaserepository.dart';

void main() {
  DataBaseRepository repository = MockDataRepository();

  runApp(App(repository));
}
