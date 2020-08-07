import 'dart:async';
import 'package:flutter/material.dart';
import 'package:date_format/date_format.dart';

import '../utils/platform_intents.dart';
import 'text.dart';

class TextClock extends StatefulWidget {
  @override
  _TextClockState createState() => _TextClockState();
}

class _TextClockState extends State<TextClock> {
  Timer timer;

  @override
  void initState() {
    timer = Timer.periodic(Duration(seconds: 1), (Timer t) => setState(() {}));
    super.initState();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        GestureDetector(
            onTap: () => PlatformIntents.launchAlarmClockIntent(),
            child: BodyText("${TimeOfDay.now().format(context)},  ")),
        GestureDetector(
            onTap: () => PlatformIntents.launchCalenderIntent(),
            child: BodyText("${formatDate(DateTime.now(), [M, ' ', d])}")),
      ],
    );
  }
}
