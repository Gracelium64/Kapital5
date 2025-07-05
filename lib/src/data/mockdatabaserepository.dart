import 'package:kapital_5/src/data/databaserepository.dart';
// import 'package:kapital_5/src/features/5.3.1_user_input/domain/app_user.dart';

class MockDataRepository implements DataBaseRepository {
  // final List<AppUser> userList = [
  //   AppUser(userName: 'Grace', email: 'decoy@icloud.com', password: 'TheGame'),
  //   AppUser(userName: 'Grace2', email: 'decoy@gmail.com', password: 'no'),
  // ];

  List<String> internetsWon = [
    'Grace Savings and Risk Assessments',
    'The first 3 Internets are on us',
    'Your money is safe with us ;)',
  ];

  @override
  Future<void> addInternets(String data) async {
    await Future.delayed(Duration(seconds: 3));
    internetsWon.add(data);
  }

  @override
  Future<void> removeInternets() async {
    await Future.delayed(Duration(seconds: 3));
    internetsWon.removeAt(0);
    internetsWon.removeAt(0);
  }

  @override
  Future<List<String>> getInternets() async {
    await Future.delayed(Duration(seconds: 3));
    return internetsWon;
  }

  @override
  Future<void> createAppUser(AppUser appUser) async {
    await Future.delayed(Duration(seconds: 3));
    userList.add(appUser);
  }

  @override
  Future<AppUser?> getUser(String name, password) async {
    await Future.delayed(Duration(seconds: 3));
    try {
      return userList.firstWhere(
        (user) => user.userName == name && user.password == password,
      );
    } catch (e) {
      return null;
    }
  }
}
