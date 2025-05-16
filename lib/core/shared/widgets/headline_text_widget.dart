import 'package:flutter/material.dart';

class HeadlineTextWidget extends StatelessWidget {
  final String text;

  const HeadlineTextWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: Theme.of(context).textTheme.displayMedium,
    );
  }
}
