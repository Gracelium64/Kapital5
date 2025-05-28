Future<String> threeTimesTony(String data) async {
  try {
    await Future.delayed(Duration(seconds: 3));
    return data * 3;
  } catch (e1) {
    return 'Error e1';
  }
}
