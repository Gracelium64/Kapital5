import 'package:flutter/material.dart';

class CutomButton extends StatelessWidget {
  final String buttonText;
  final void Function()? onPressed;

  const CutomButton({
    super.key,
    required this.buttonText,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,

      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color:
              onPressed == null
                  ? Theme.of(context).disabledColor
                  : Theme.of(context).colorScheme.primary,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          child: Text(
            buttonText,
            style: TextStyle(color: Theme.of(context).colorScheme.onTertiary),
          ),
        ),
      ),
    );
  }
}
