import 'package:flutter/material.dart';
import 'package:kapital_5/src/features/5.1.2_callback_functions/presentation/widgets/cutom_button.dart';

class CounterBox extends StatefulWidget {
  final Color boxColor;
  final void Function(int count) onChanged;
  final String buttonText;

  const CounterBox({
    super.key,
    required this.boxColor,
    required this.onChanged, required this.buttonText,
  });

  @override
  State<CounterBox> createState() => _CounterBoxState();
}

class _CounterBoxState extends State<CounterBox> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: 250,
      decoration: BoxDecoration(
        color: widget.boxColor,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Column(
        spacing: 8,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CutomButton(
            buttonText: widget.buttonText,
            onPressed: () {
              setState(() {
                counter++;
                widget.onChanged(counter);
              });
            },
          ),
          Text('$counter'),
          
        ],
      ),
    );
  }
}
