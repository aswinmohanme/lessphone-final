import 'package:flutter/material.dart';

import 'text.dart';
import '../styles.dart';

class Footer extends StatelessWidget {
  final String leftText;
  final String rightText;

  final Function leftFunction;
  final Function rightFunction;

  const Footer({
    Key key,
    this.leftText,
    this.rightText,
    this.leftFunction,
    this.rightFunction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        GestureDetector(
          onTap: leftFunction,
          child: Container(
            padding: EdgeInsets.symmetric(vertical: s_2),
            child: BodyText(leftText),
          ),
        ),
        GestureDetector(
          onTap: rightFunction,
          child: Container(
            padding: EdgeInsets.symmetric(vertical: s_2),
            child: BodyText(rightText),
          ),
        ),
      ],
    );
  }
}
