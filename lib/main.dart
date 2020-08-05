import 'package:flutter/material.dart';

import './screens/home_screen.dart';
import 'themes.dart';

void main() {
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
