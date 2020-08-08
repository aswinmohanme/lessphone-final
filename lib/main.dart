import 'package:flutter/material.dart';

import './screens/home_screen.dart';
import 'themes.dart';
import 'utils/hive_repo.dart';
import './models/settings_box.dart';

void main() async {
  await HiveRepo.initHive();
  runApp(Lessphone());
}

class Lessphone extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: SettingsBox.listenable,
        builder: (context, box, _) {
          return MaterialApp(
            theme: buildLessphoneTheme(SettingsBox.currentTheme),
            home: HomeScreen(),
          );
        });
  }
}
