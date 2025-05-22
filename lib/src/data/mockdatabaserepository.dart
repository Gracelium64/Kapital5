import 'package:kapital_5/src/data/databaserepository.dart';
import 'package:kapital_5/src/features/5.3.1_user_input/domain/app_user.dart';

class MockDataRepository implements DataBaseRepository {
  final List<AppUser> userList = [
    AppUser(userName: 'Grace', email: 'decoy@icloud.com', password: 'TheGame'),
    AppUser(userName: 'Grace2', email: 'decoy@gmail.com', password: 'no'),
  ];

  @override
  void createAppUser(AppUser appUser) {
    userList.add(appUser);
  }

  @override
  AppUser? getUser(String name, password) {
    try {
      return userList.firstWhere(
        (user) => user.userName == name && user.password == password,
      );
    } catch (e) {
      return null;
    }
  }

}
