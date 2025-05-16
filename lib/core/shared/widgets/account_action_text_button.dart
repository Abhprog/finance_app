import 'package:flutter/material.dart'
    show
        BuildContext,
        FontWeight,
        StatelessWidget,
        Text,
        TextButton,
        TextStyle,
        Theme,
        VoidCallback,
        Widget,
        Wrap,
        WrapAlignment;

class AccountTextActionButton extends StatelessWidget {
  final String text;
  final String actionText;
  final VoidCallback onPressed;
  final TextStyle? textStyle;
  final TextStyle? actionStyle;

  const AccountTextActionButton({
    super.key,
    required this.text,
    required this.actionText,
    required this.onPressed,
    this.textStyle,
    this.actionStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.center,
      children: [
        Text(
          text,
          style:
              textStyle ??
              Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Theme.of(context).colorScheme.secondary,
              ),
        ),
        TextButton(
          onPressed: onPressed,
          style: Theme.of(context).textButtonTheme.style,
          child: Text(
            actionText,
            style:
                actionStyle ??
                Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Theme.of(context).colorScheme.onPrimary,
                  fontWeight: FontWeight.bold,
                ),
          ),
        ),
      ],
    );
  }
}
