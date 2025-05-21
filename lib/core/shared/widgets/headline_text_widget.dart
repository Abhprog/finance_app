import 'package:flutter/material.dart';

class HeadlineTextWidget extends StatelessWidget {
  final String text;
  final TextAlign? textAlign;
  final Color? color;
  final double? fontSize;
  final FontWeight? fontWeight;
  final int? maxLines;
  final TextOverflow? overflow;

  const HeadlineTextWidget({
    super.key,
    required this.text,
    this.textAlign,
    this.color,
    this.fontSize,
    this.fontWeight,
    this.maxLines = 1,
    this.overflow,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign ?? TextAlign.center,
      maxLines: maxLines,
      overflow: overflow,
      style: Theme.of(context).textTheme.displayMedium,
      // style: Theme.of(context).textTheme.displayMedium?.copyWith(
      //   color: color ?? Theme.of(context).textTheme.headlineMedium!.color,
      //   fontSize:
      //       fontSize ?? Theme.of(context).textTheme.headlineMedium!.fontSize,
      //   fontWeight: fontWeight ?? FontWeight.w600,
      // ),
    );
  }
}
