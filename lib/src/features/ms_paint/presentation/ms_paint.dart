import 'package:flutter/material.dart';
import 'package:kapital_5/src/features/ms_paint/presentation/widgets/note_display.dart';
import 'package:kapital_5/src/features/ms_paint/presentation/widgets/note_pad.dart';


class MsPaint2172x1152 extends StatelessWidget {
  const MsPaint2172x1152({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text('Ms Paint 2176x1152')),

        body: Row(
          children: [
            SizedBox(width: 10),
            Flexible(flex: 2, child: NotePad()),
            Flexible(flex: 3, child: NoteDisplay()),
          ],
        ),
      ),
    );
  }
}
