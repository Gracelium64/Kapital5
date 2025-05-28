import 'package:kapital_5/src/data/databaserepository.dart';

Future<bool> addToCart(DataBaseRepository repository) async {
  await Future.delayed(Duration(seconds: 2));
  int randomNumber = DateTime.now().microsecondsSinceEpoch % 3;

  try {
    if (randomNumber == 0) {
      repository.addInternets('+1 Internets, use it wisely');
      return true;
    } else if (randomNumber == 1) {
      return false;
    } else {
      repository.removeInternets();
      repository.addInternets('-1 Internets, oopsie');
      1 ~/ 0;
      return false;
    }
  } on RangeError catch (e) {
    print('error e1: $e');
    rethrow;
  } catch (e) {
    return false;
  }
}
