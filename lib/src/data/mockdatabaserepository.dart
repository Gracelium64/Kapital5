import 'package:kapital_5/src/data/databaserepository.dart';
import 'package:kapital_5/src/features/5.3.1_user_input/domain/app_user.dart';

class MockDataRepository implements DataBaseRepository {
  final List<AppUser> userList = [
    AppUser(name: 'Grace', password: 'TheGame'),
    AppUser(name: 'Grace2', password: 'no'),
  ];

  @override
  void createAppUser(AppUser appUser) {
    userList.add(appUser);
  }

  @override
  AppUser? getUser(String name, password) {
    try {
      return userList.firstWhere(
        (user) => user.name == name && user.password == password,
      );
    } catch (e) {
      return null;
    }
  }
}
