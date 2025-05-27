Future<String> threeTimesTony(String data) async {
  await Future.delayed(Duration(seconds: 3));

  try {
    return '$data$data$data';
  } catch (e1) {
    return 'Error';
  }
}
