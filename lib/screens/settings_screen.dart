import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

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
              ListView(
                shrinkWrap: true,
                children: <Widget>[
                  SizedBox(height: s_12),
                  SettingBigBodyText("Change Theme"),
                  SizedBox(height: s_1),
                  SegmentedChoice(
                      choices: ["light", "black", "yellow", "blue"]),
                  SizedBox(height: s_4),
                  SettingBigBodyText("Number of Custom Apps"),
                  SizedBox(height: s_1),
                  SegmentedChoice(choices: ["2", "3", "4", "5", "6", "7", "8"]),
                  SizedBox(height: s_4),
                  SettingBigBodyText("Font Size"),
                  SizedBox(height: s_1),
                  SegmentedChoice(choices: ["small", "medium", "large"]),
                  SizedBox(height: s_12),
                  CaptionText("custom apps"),
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
                ],
              ),
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

class SegmentedChoice extends StatefulWidget {
  final List<String> choices;
  const SegmentedChoice({
    Key key,
    this.choices,
  }) : super(key: key);

  @override
  _SegmentedChoiceState createState() => _SegmentedChoiceState();
}

class _SegmentedChoiceState extends State<SegmentedChoice> {
  int groupValue = 0;

  @override
  Widget build(BuildContext context) {
    return CupertinoSlidingSegmentedControl(
      backgroundColor: Theme.of(context).colorScheme.secondaryVariant,
      thumbColor: Theme.of(context).colorScheme.background,
      groupValue: groupValue,
      onValueChanged: (value) {
        setState(() {
          groupValue = value;
        });
      },
      children:
          widget.choices.map((choice) => ButtonText(choice)).toList().asMap(),
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
      child: BodyText(text),
    );
  }
}
