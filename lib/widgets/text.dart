import 'package:flutter/material.dart';

class BigBodyText extends StatelessWidget {
  final String text;

  const BigBodyText(this.text);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.bodyText1.copyWith(
            color: Theme.of(context).colorScheme.primary,
          ),
    );
  }
}

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

class CaptionText extends StatelessWidget {
  final String text;

  const CaptionText(this.text);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.caption.copyWith(
            color: Theme.of(context).colorScheme.primaryVariant,
          ),
    );
  }
}

class ButtonText extends StatelessWidget {
  final String text;

  const ButtonText(this.text);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.caption.copyWith(
            color: Theme.of(context).colorScheme.primary,
          ),
    );
  }
}
