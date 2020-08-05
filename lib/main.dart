import 'package:flutter/material.dart';

void main() {
  runApp(Lessphone());
}

class Lessphone extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: <Widget>[Text("Hello")],
        ),
      ),
    );
  }
}
