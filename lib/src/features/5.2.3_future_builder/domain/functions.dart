import 'package:kapital_5/src/data/databaserepository.dart';

Future<bool> addToCart(DataBaseRepository repository) async {
  await Future.delayed(Duration(seconds: 2));
  int randomNumber = DateTime.now().microsecondsSinceEpoch % 3;

  if (randomNumber == 0) {
    repository.addInternets('+1 Internets, use it wisely');
    return true;
  } else if (randomNumber == 1) {
    return false;
  } else {
    repository.addInternets('-1 Internets, oopsie');
    repository.removeInternets();
    1 ~/ 0;
    return false;
  }
}
