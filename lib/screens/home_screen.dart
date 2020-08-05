import 'package:flutter/material.dart';

import '../styles.dart';
import '../widgets/body_text.dart';
import '../widgets/text_clock.dart';
import '../widgets/battery_indicator.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(kScreenPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  TextClock(),
                  BatteryIndicator(),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  BodyText("dialer"),
                  BodyText("settings"),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
