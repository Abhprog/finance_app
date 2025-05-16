import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextField extends StatefulWidget {
  final void Function(String val)? onChanged;
  final String hintText;
  final double? width;
  final double? height;
  final TextEditingController? controller;
  final TextInputType textFieldType;
  final Icon? prefixIcon;
  final String? Function(String?)? validator;

  const CustomTextField({
    super.key,
    this.hintText = '',
    this.textFieldType = TextInputType.text,
    this.width,
    this.height,
    this.controller,
    this.prefixIcon,
    required this.onChanged,
    required this.validator,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool isShownPassword = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width ?? 250.w,
      height: widget.height ?? 70.h,
      child: TextFormField(
        onChanged: widget.onChanged,
        validator: widget.validator,
        controller: widget.controller,
        keyboardType: widget.textFieldType,
        obscureText:
            widget.textFieldType == TextInputType.visiblePassword &&
            !isShownPassword,
        decoration: InputDecoration(
          prefixIcon:
              widget.prefixIcon ??
              Icon(
                widget.textFieldType == TextInputType.visiblePassword
                    ? Icons.lock
                    : Icons.person,
                color: Theme.of(context).iconTheme.color,
              ),
          suffixIcon:
              widget.textFieldType == TextInputType.visiblePassword
                  ? IconButton(
                    onPressed:
                        () =>
                            setState(() => isShownPassword = !isShownPassword),
                    icon: Icon(
                      isShownPassword ? Icons.visibility_off : Icons.visibility,
                    ),
                  )
                  : null,
          contentPadding: Theme.of(context).inputDecorationTheme.contentPadding,
          border: Theme.of(context).inputDecorationTheme.border,
          errorStyle: Theme.of(context).inputDecorationTheme.errorStyle,
          hintText: widget.hintText,
          hintStyle: Theme.of(context).inputDecorationTheme.hintStyle,
        ),
      ),
    );
  }
}
