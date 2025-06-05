import 'package:flutter/material.dart';

class DailyCounter extends StatelessWidget {
  const DailyCounter({
    super.key,
    required this.counter,
  });

  final int counter;

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
                  // setState(() {
                  //   counter++;
                  // });
                  // setCounter();
                  // setDate();
                },
                child: Text('potat'),
              ),
              FilledButton(
                onPressed: () {
                  // setState(() {
                  //   counter = 0;
                  // });
                  // setCounter();
                  // setDate();
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
