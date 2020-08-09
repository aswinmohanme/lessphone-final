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
              HeadingText("Select Custom App"),
              SizedBox(height: s_2),
              Expanded(
                child: FutureBuilder(
                  future: DeviceApps.getInstalledApplications(),
                  builder: (BuildContext context, var snapshot) {
                    if (snapshot.hasData) {
                      return Text("This should work, but it's not");
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
