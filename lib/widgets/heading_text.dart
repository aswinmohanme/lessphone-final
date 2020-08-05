import 'package:flutter/material.dart';

class HeadingText extends StatelessWidget {
  final String text;

  const HeadingText(this.text);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.headline6.copyWith(
            color: Theme.of(context).colorScheme.primary,
          ),
    );
  }
}
