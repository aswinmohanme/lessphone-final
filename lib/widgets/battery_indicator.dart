import 'package:battery/battery.dart';
import 'package:flutter/material.dart';

import '../utils/platform_intents.dart';
import 'text.dart';

class BatteryIndicator extends StatefulWidget {
  @override
  _BatteryIndicatorState createState() => _BatteryIndicatorState();
}

class _BatteryIndicatorState extends State<BatteryIndicator> {
  final Battery _battery = Battery();
  BatteryState _batteryState;
  int _batteryLevel = 50;

  @override
  void initState() {
    super.initState();

    _battery.batteryLevel.then((level) {
      this.setState(() {
        _batteryLevel = level;
      });
    });

    _battery.onBatteryStateChanged.listen((BatteryState state) {
      _battery.batteryLevel.then((level) {
        this.setState(() {
          _batteryLevel = level;
          _batteryState = state;
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => PlatformIntents.launchBatteryIntent(),
      child: BodyText(
          "${_batteryState == BatteryState.charging ? '+' : ''} $_batteryLevel%"),
    );
  }
}
