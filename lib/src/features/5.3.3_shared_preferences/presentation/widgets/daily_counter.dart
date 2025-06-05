import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DailyCounter extends StatefulWidget {
  const DailyCounter({
    super.key,
  });

  @override
  State<DailyCounter> createState() => _DailyCounterState();
}

class _DailyCounterState extends State<DailyCounter> {
  int counter = 0;

  Future<void> setCounter() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      prefs.setInt('counter', counter);
    });
  }

  Future<void> setDate() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('lastCount', DateTime.now().toIso8601String());
  }

  Future<void> loadCounter() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      counter = prefs.getInt('counter') ?? 0;
    });
  }

  Future<void> resetCounterDaily() async {
    final prefs = await SharedPreferences.getInstance();
    final lastCount = prefs.getString('lastCount');
    final now = DateTime.now();

    if (lastCount != null) {
      final lastCounted = DateTime.parse(lastCount);
      final isSameDay =
          lastCounted.year == now.year &&
          lastCounted.month == now.month &&
          lastCounted.day == now.day;

      if (!isSameDay) {
        setState(() {
          counter = 0;
        });
        prefs.setInt('counter', 0);
        prefs.setString('lastCount', now.toIso8601String());
      }
    }
  }

  @override
  void initState() {
    super.initState();
    loadCounter();
    resetCounterDaily();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('Count to potato'),
          Text(
            '$counter',
            style: Theme.of(context).textTheme.displaySmall,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 16,
            children: [
              FilledButton(
                onPressed: () {
                  setState(() {
                    counter++;
                  });
                  setCounter();
                  setDate();
                },
                child: Text('potat'),
              ),
              FilledButton(
                onPressed: () {
                  setState(() {
                    counter = 0;
                  });
                  setCounter();
                  setDate();
                },
                child: Text('Reset'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
