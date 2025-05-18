import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PrimaryOutlinedButtonWidget extends StatelessWidget {
  final String text;
  final double? width;
  final double? height;
  final Function() onPressed;
  final Color? color;
  final TextStyle? textstyle;

  const PrimaryOutlinedButtonWidget({
    super.key,
    required this.text,
    required this.onPressed,
    this.color,
    this.width,
    this.height,
    this.textstyle,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: Theme.of(context).outlinedButtonTheme.style?.copyWith(
        fixedSize: WidgetStatePropertyAll(Size(width ?? 150.w, height ?? 42.h)),
        side: WidgetStatePropertyAll<BorderSide>(
          BorderSide(color: color ?? Theme.of(context).colorScheme.primary),
        ),
      ),
      child: Text(
        text,
        style: textstyle ?? Theme.of(context).textTheme.headlineSmall,
      ),
    );
  }
}
