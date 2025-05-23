import 'package:flutter/material.dart';
import 'package:kapital_5/src/features/5.1.2_callback_functions/presentation/widgets/counter_box.dart';
import 'package:kapital_5/src/theme/palette.dart';
import 'dart:io' show Platform;

class CallbackFunctions extends StatefulWidget {
  const CallbackFunctions({super.key});

  @override
  State<CallbackFunctions> createState() => _CallbackFunctionsState();
}

class _CallbackFunctionsState extends State<CallbackFunctions> {
  int box1 = 0;
  int box2 = 0;
  int box3 = 0;

  double horizontalPadding = 0;
  double verticallPadding = 0;

  @override
  Widget build(BuildContext context) {
    int finalCount = box1 + box2 + box3;

    if (Platform.isIOS) {
      horizontalPadding = 76;
      verticallPadding = 50;
    } else if (Platform.isAndroid) {
      horizontalPadding = 84;
      verticallPadding = 40;
    }

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        flexibleSpace: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: horizontalPadding,
            vertical: verticallPadding,
          ),
          child: Text('5.1.2'),
        ),
        title: Text('Callback Functions'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            spacing: 16,
            children: [
              CounterBox(
                boxColor: Palette.monarchPurple1,
                onChanged: (int count) {
                  setState(() {
                    box1 = count;
                  });
                },
                buttonText: 'Never gonna',
              ),
              CounterBox(
                boxColor: Palette.monarchPurple2,
                onChanged: (int count) {
                  setState(() {
                    box2 = count;
                  });
                },
                buttonText: 'Give you',
              ),
              CounterBox(
                boxColor: Palette.lightTeal,
                onChanged: (int count) {
                  setState(() {
                    box3 = count;
                  });
                },
                buttonText: 'Up',
              ),

              Text(
                finalCount < 15
                    ? 'Box1[$box1] + Box2[$box2] + Box3[$box3] = $finalCount'
                    : 'You just lost The Game [$finalCount]',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
