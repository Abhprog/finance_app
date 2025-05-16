import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PrimaryButtonWidget extends StatelessWidget {
  final String text;
  final double? width;
  final double? height;
  final Function()? onPressed;
  final Color? color;
  final Color? textColor;
  final TextStyle? textstyle;

  const PrimaryButtonWidget({
    super.key,
    this.onPressed,
    required this.text,
    this.color,
    this.textColor,
    this.width,
    this.height,
    this.textstyle,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: Theme.of(context).elevatedButtonTheme.style?.copyWith(
        backgroundColor: WidgetStatePropertyAll(
          color ?? Theme.of(context).colorScheme.primary,
        ),
        fixedSize: WidgetStatePropertyAll(Size(width ?? 150.w, height ?? 42.h)),
      ),
      child: Text(
        text,
        style: textstyle ?? Theme.of(context).textTheme.headlineSmall,
      ),
    );
  }
}
