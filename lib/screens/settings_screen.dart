import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../styles.dart';
import '../utils/platform_intents.dart';
import '../widgets/footer.dart';
import '../widgets/text.dart';
import '../models/custom_app.dart';
import '../models/settings_box.dart';
import 'select_custom_app_screen.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(kScreenPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: s_4),
              HeadingText("Settings"),
              SizedBox(height: s_2),
              Expanded(
                child: ListView(
                  children: <Widget>[
                    SizedBox(height: s_8),
                    SettingBigBodyText("Change Theme"),
                    SizedBox(height: s_1),
                    SegmentedChoice(
                        choices: {
                          0: "light",
                          1: "black",
                          2: "yellow",
                          3: "blue",
                          // 4: "wall",
                        },
                        defaultValue: SettingsBox.themeToSegmentValue(
                            SettingsBox.currentTheme),
                        afterValueChanged: (value) {
                          SettingsBox.currentTheme =
                              SettingsBox.segmentValueToTheme(value);
                        }),
                    SizedBox(height: s_4),
                    SettingBigBodyText("Number of Custom Apps"),
                    SizedBox(height: s_1),
                    SegmentedChoice(
                      choices: {
                        2: "2",
                        3: "3",
                        4: "4",
                        5: "5",
                        6: "6",
                        7: "7",
                        8: "8"
                      },
                      defaultValue: CustomApp.count(),
                      afterValueChanged: (value) {
                        CustomApp.setNumberOfApps(value);
                      },
                    ),
                    SizedBox(height: s_4),
                    SettingBigBodyText("Font Size"),
                    SizedBox(height: s_1),
                    SegmentedChoice(
                        choices: {0.8: "small", 1.0: "medium", 1.2: "large"},
                        defaultValue: SettingsBox.currentFontFactor,
                        afterValueChanged: (factor) {
                          SettingsBox.currentFontFactor = factor;
                        }),
                    SizedBox(height: s_10),
                    CaptionText("custom apps"),
                    ValueListenableBuilder(
                        valueListenable: CustomApp.listenable(),
                        builder: (context, box, _) {
                          return ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: CustomApp.count(),
                            itemBuilder: (BuildContext context, int index) {
                              CustomApp customApp = CustomApp.getAt(index);
                              return Container(
                                  padding: EdgeInsets.symmetric(vertical: s_3),
                                  child: GestureDetector(
                                      onTap: () {
                                        Navigator.of(context).push(
                                          MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                                SelectCustomAppScreen(
                                                    customApp: customApp),
                                          ),
                                        );
                                      },
                                      child:
                                          SettingBigBodyText(customApp.name)));
                            },
                          );
                        }),
                    SizedBox(height: s_10),
                    SettingBigBodyText("Launcher Settings",
                        onTap: PlatformIntents.launchHomeSettings),
                    SizedBox(height: s_4),
                    SettingBigBodyText("Settings",
                        onTap: PlatformIntents.launchDeviceSettings),
                    SizedBox(height: s_10),
                    CaptionText("for every star you take away a bunny dies"),
                    SettingBigBodyText("Rate us on the Play Store",
                        onTap: PlatformIntents.launchPlayStorePage),
                    SizedBox(height: s_4),
                  ],
                ),
              ),
              SizedBox(height: s_2),
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
  final Map<dynamic, dynamic> choices;
  final Function afterValueChanged;
  final defaultValue;

  const SegmentedChoice({
    Key key,
    this.choices,
    this.afterValueChanged,
    this.defaultValue,
  }) : super(key: key);

  @override
  _SegmentedChoiceState createState() => _SegmentedChoiceState();
}

class _SegmentedChoiceState extends State<SegmentedChoice> {
  var groupValue;

  @override
  void initState() {
    groupValue = widget.defaultValue ?? 0;
    super.initState();
  }

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
        widget.afterValueChanged(value);
      },
      children: Map.fromIterable(widget.choices.entries,
          key: (entry) => entry.key, value: (entry) => ButtonText(entry.value)),
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
