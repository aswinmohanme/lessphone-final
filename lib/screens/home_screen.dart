import 'package:flutter/material.dart';

import '../styles.dart';
import '../utils/platform_intents.dart';
import '../widgets/footer.dart';
import '../widgets/text_clock.dart';
import '../widgets/battery_indicator.dart';
import '../models/custom_app.dart';
import 'task_screen.dart';
import 'settings_screen.dart';
import 'select_custom_app_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(kScreenPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  TextClock(),
                  BatteryIndicator(),
                ],
              ),
              Spacer(),
              ValueListenableBuilder(
                  valueListenable: CustomApp.listenable(),
                  builder: (context, box, _) {
                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: CustomApp.count(),
                      itemBuilder: (BuildContext context, int index) {
                        CustomApp customApp = CustomApp.getAt(index);
                        return Container(
                          padding: EdgeInsets.symmetric(vertical: s_4),
                          child: GestureDetector(
                            onTap: () {
                              if (customApp.isTaskApp)
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        TaskScreen(),
                                  ),
                                );
                              else if (customApp.isSelectCustomApp) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        SelectCustomAppScreen(
                                            customApp: customApp),
                                  ),
                                );
                              } else
                                PlatformIntents.launchApp(
                                    customApp.packageName);
                            },
                            child: Text(customApp.name,
                                style: Theme.of(context).textTheme.headline6),
                          ),
                        );
                      },
                    );
                  }),
              Spacer(),
              Footer(
                leftText: "dialer",
                leftFunction: () {
                  PlatformIntents.launchDailerIntent();
                },
                rightText: "settings",
                rightFunction: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => SettingsScreen(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
