import 'package:flutter/material.dart';

import 'package:device_apps/device_apps.dart';
import '../models/custom_app.dart';
import '../styles.dart';
import '../widgets/text.dart';
import '../widgets/footer.dart';

class SelectCustomAppScreen extends StatefulWidget {
  final CustomApp customApp;

  const SelectCustomAppScreen({Key key, this.customApp}) : super(key: key);
  @override
  _SelectCustomAppScreenState createState() => _SelectCustomAppScreenState();
}

class _SelectCustomAppScreenState extends State<SelectCustomAppScreen> {
  int selectedIndex;

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
              SizedBox(height: s_4),
              HeadingText(widget.customApp.name),
              SizedBox(height: s_8),
              Expanded(
                child: FutureBuilder(
                  future: DeviceApps.getInstalledApplications(
                    includeSystemApps: true,
                    onlyAppsWithLaunchIntent: true,
                  ),
                  builder: (BuildContext context, var snapshot) {
                    if (snapshot.hasData) {
                      List<Application> installedApps = snapshot.data;
                      installedApps
                          .sort((a, b) => a.appName.compareTo(b.appName));
                      return ListView.builder(
                        itemCount: installedApps.length,
                        itemBuilder: (BuildContext context, int index) {
                          Application installedApp = installedApps[index];
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedIndex = index;
                              });
                              widget.customApp.setCustomApp(
                                  installedApp.appName,
                                  installedApp.packageName);
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(s_2),
                                border: selectedIndex == index
                                    ? Border.all(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary,
                                        width: 2,
                                      )
                                    : null,
                              ),
                              padding: EdgeInsets.symmetric(
                                  vertical: s_3,
                                  horizontal:
                                      selectedIndex == index ? s_2 : s_0),
                              child: BigBodyText(installedApp.appName),
                            ),
                          );
                        },
                      );
                    } else {
                      return Center(child: CircularProgressIndicator());
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
