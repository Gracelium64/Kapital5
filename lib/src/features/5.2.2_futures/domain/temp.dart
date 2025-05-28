Future<int> myFunction1() async {
  await Future.delayed(Duration(seconds: 5));
  //await                       this counts
  return 200;
}

Future<int> myFunction2() async {
  Future.delayed(Duration(seconds: 3));
  //no await              this doesn't count
  return 500;
}

Future<void> myFunction3() async {
  Future.delayed(Duration(seconds: 12));
  //no await              this doesn't count
  print("Ready!");
}

Future<String> myFunction4() async {
  int x = await myFunction1();
  int y = await myFunction2();
  await myFunction3();
  return "${x + y}";
}

void main() async {
  final Future<String> myFuture = myFunction4();
  String a = await myFuture;
  print(a);
  // print(threeTimesTony('tony'));
}
// String threeTimesTony(String data) {
//   return '$data$data$data';
// }