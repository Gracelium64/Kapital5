import 'package:kapital_5/src/features/5.3.1_user_input/domain/app_user.dart';

abstract class DataBaseRepository {

  Future<void> createAppUser (AppUser appUser);
  Future<AppUser?> getUser(String name, password);
  Future<void> addInternets (String data);
  Future<List<String>> getInternets();
  Future<void> removeInternets();
}