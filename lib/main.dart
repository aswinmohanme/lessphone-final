import 'package:flutter/material.dart';

import './screens/home_screen.dart';
import 'themes.dart';
import 'utils/hive_repo.dart';

void main() async {
  await HiveRepo.initHive();
  runApp(Lessphone());
}

class Lessphone extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: buildLessphoneLightTheme(),
      home: HomeScreen(),
    );
  }
}
