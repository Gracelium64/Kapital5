import 'package:kapital_5/src/features/5.2.2_futures/domain/functions.dart';

Future<List<String>> serialization() async {
  final List<String> output = [];
  double? a;
  double? b;
  String? c;
  String? d;

  bunny();

  final int dailyUsers = 5000;

  final int userDailyReads = 100;
  final int userDailyWrites = 40;
  final int userDailyDeletes = 20;

  final int dailyTrafficMB = 100;
  final int dailyDataMB = 225;

  int dailyReads = userDailyReads * dailyUsers;
  int dailyWrites = userDailyWrites * dailyUsers;
  int dailyDeletes = userDailyDeletes * dailyUsers;

  int monthlyReads = dailyReads * 30;
  int monthlyWrites = dailyWrites * 30;
  int monthlyDeletes = dailyDeletes * 30;
  int monthlyTrafficMB = dailyTrafficMB * 30;
  int monthlyDataMB = dailyDataMB * 30;

  double readOperationsCosts = (0.06 / 100000) * monthlyReads;
  double writeOperationsCosts = (0.18 / 100000) * monthlyWrites;
  double deleteOperationsCosts = (0.02 / 100000) * monthlyDeletes;
  double dataCosts = (0.18 / 1000) * monthlyDataMB;
  double trafficCosts =
      monthlyTrafficMB < 10000 ? 0 : (0.12 / 1000) * (monthlyTrafficMB - 10000);

  a =
      readOperationsCosts +
      writeOperationsCosts +
      deleteOperationsCosts +
      dataCosts +
      trafficCosts;

  output.add('A) FireStore monthly cost is ${a.toStringAsFixed(3)}€');

  int serverMonthlyCosts = 400;
  int licenseMonthlyCosts = 200;
  int electricMonthlyCosts = 100;
  int maintenanceMonthlyCosts = 300;
  double dataMonthlyCosts = (0.1 / 1000) * monthlyDataMB;
  double trafficMonthlyCosts = (0.05 / 1000) * monthlyTrafficMB;

  b =
      serverMonthlyCosts +
      licenseMonthlyCosts +
      electricMonthlyCosts +
      maintenanceMonthlyCosts +
      dataMonthlyCosts +
      trafficMonthlyCosts;

  output.add('B) SQL-Server monthly cost is ${b.toStringAsFixed(3)}€');

  c =
      a < b
          ? 'C) FireStore is the better choice for this Product'
          : 'C) SQL-Server is the better choice for this product';

  output.add(c);

  d = "D) The prices can rise for both due to supplier chain and infrastructure costs, what matters is the volume of data created by volume of users";

  output.add(d);

  return output;
}
