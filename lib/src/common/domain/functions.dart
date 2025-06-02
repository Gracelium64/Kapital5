Future<String> spongeBob(String data) async {
  String spongeOutput = data.toLowerCase();
  String result = '';
  for (var i = 0; i < spongeOutput.length; i++) {
    i % 2 == 0
        ? result += data[i].toLowerCase()
        : result += data[i].toUpperCase();
  }
  return result;
}