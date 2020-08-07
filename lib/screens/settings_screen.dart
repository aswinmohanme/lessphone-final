import 'package:flutter/material.dart';

import '../styles.dart';
import '../utils/platform_intents.dart';
import '../widgets/footer.dart';
import '../widgets/text.dart';
import '../models/custom_app.dart';

class SettingsScreen extends StatelessWidget {
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
              HeadingText("Settings"),
              SizedBox(height: s_12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SettingBigBodyText("Change Theme"),
                  Container(
                    padding:
                        EdgeInsets.symmetric(vertical: s_1, horizontal: s_4),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.secondaryVariant,
                      borderRadius: BorderRadius.circular(s_4),
                    ),
                    child: ButtonText("light"),
                  ),
                ],
              ),
              SizedBox(height: s_4),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SettingBigBodyText("Number of Custom Apps"),
                  Container(
                    padding:
                        EdgeInsets.symmetric(vertical: s_1, horizontal: s_4),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.secondaryVariant,
                      borderRadius: BorderRadius.circular(s_4),
                    ),
                    child: ButtonText("4"),
                  ),
                ],
              ),
              SizedBox(height: s_4),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SettingBigBodyText("Font Size"),
                  Container(
                    padding:
                        EdgeInsets.symmetric(vertical: s_1, horizontal: s_4),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.secondaryVariant,
                      borderRadius: BorderRadius.circular(s_4),
                    ),
                    child: ButtonText("medium"),
                  ),
                ],
              ),
              SizedBox(height: s_12),
              ListView.builder(
                shrinkWrap: true,
                itemCount: CustomApp.count(),
                itemBuilder: (BuildContext context, int index) {
                  CustomApp customApp = CustomApp.get(index);
                  return Container(
                      padding: EdgeInsets.symmetric(vertical: s_3),
                      child: SettingBigBodyText(customApp.name));
                },
              ),
              SizedBox(height: s_12),
              SettingBigBodyText("Launcher Settings",
                  onTap: PlatformIntents.launchHomeSettings),
              SizedBox(height: s_4),
              SettingBigBodyText("Settings",
                  onTap: PlatformIntents.launchDeviceSettings),
              SizedBox(height: s_12),
              CaptionText("for every star you take away a bunny dies"),
              SettingBigBodyText("Rate us on the Play Store",
                  onTap: PlatformIntents.launchPlayStorePage),
              Spacer(),
              Footer(
                leftText: "back",
                leftFunction: () {
                  Navigator.of(context).pop();
                },
                rightText: "feedback",
                rightFunction: () {
                  PlatformIntents.sendEmailToDeveloper();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SettingBigBodyText extends StatelessWidget {
  final String text;
  final Function onTap;

  const SettingBigBodyText(this.text, {Key key, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: BigBodyText(text),
    );
  }
}
