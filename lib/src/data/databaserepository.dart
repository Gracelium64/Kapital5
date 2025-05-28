import 'package:kapital_5/src/features/5.3.1_user_input/domain/app_user.dart';

abstract class DataBaseRepository {

  void createAppUser (AppUser appUser);
  AppUser? getUser(String name, password);
  void addInternets (String data);
  List<String> getInternets();
  void removeInternets();
}