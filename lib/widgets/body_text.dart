import 'package:flutter/material.dart';

class BodyText extends StatelessWidget {
  final String text;

  const BodyText(this.text);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.bodyText2.copyWith(
            color: Theme.of(context).colorScheme.primary,
          ),
    );
  }
}
