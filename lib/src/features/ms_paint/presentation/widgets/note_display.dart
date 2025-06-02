import 'package:flutter/material.dart';
import 'package:kapital_5/src/theme/palette.dart';

class NoteDisplay extends StatelessWidget {
  const NoteDisplay({super.key});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Column(
      spacing: 12,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(flex: 2, child: SizedBox(height: 10)),
        Expanded(
          flex: 1,
          child: Container(
            color: Palette.darkTeal,
            height: 50,
            width: screenSize.width / 1.86,
            child: Text(
              'saved messages here',
              style: Theme.of(
                context,
              ).textTheme.titleLarge?.copyWith(fontSize: 36),
            ),
          ),
        ),
        Expanded(
          flex: 20,
          child: Container(
            color: Palette.peasantGrey2,
            height: 950,
            width: screenSize.width / 1.86,
          ),
        ),
        Row(
          children: [
            Expanded(flex: 7, child: SizedBox()),
            Expanded(
              flex: 2,
              child: SizedBox(
                height: screenSize.height / 16,
                child: ElevatedButton(onPressed: () {}, child: Text('Delete')),
              ),
            ),
            Expanded(flex: 1, child: SizedBox()),
          ],
        ),
      ],
    );
  }
}
