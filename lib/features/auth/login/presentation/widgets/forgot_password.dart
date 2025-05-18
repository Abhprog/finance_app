import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ForgotPasswordTextButton extends StatelessWidget {
  final void Function()? onPressed;
  final TextStyle? textStyle;

  const ForgotPasswordTextButton({
    super.key,
    required this.onPressed,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          padding: EdgeInsets.all(10.w),
          minimumSize: Size.zero,
        ),
        child: Text(
          'Forgot Password?',
          style: textStyle ?? Theme.of(context).textTheme.bodyMedium,
        ),
      ),
    );
  }
}
