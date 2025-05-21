import 'package:finance_app/core/shared/widgets/headline_text_widget.dart'
    show HeadlineTextWidget;
import 'package:flutter/material.dart'
    show
        BuildContext,
        Column,
        CrossAxisAlignment,
        EdgeInsets,
        EdgeInsetsGeometry,
        Padding,
        SizedBox,
        StatelessWidget,
        Text,
        TextAlign,
        Theme,
        Widget;
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AuthDescriptiveTextWidget extends StatelessWidget {
  final String title;
  final String description;
  final TextAlign textAlign;
  final EdgeInsetsGeometry padding;

  const AuthDescriptiveTextWidget({
    super.key,
    required this.title,
    required this.description,
    this.textAlign = TextAlign.center,
    this.padding = const EdgeInsets.symmetric(horizontal: 0.0, vertical: 16.0),
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          HeadlineTextWidget(text: title),
          SizedBox(height: 20.h),
          AuthSubtitleTextDescriptionWidget(description: description),
        ],
      ),
    );
  }
}

class AuthSubtitleTextDescriptionWidget extends StatelessWidget {
  final String description;
  final TextAlign textAlign;

  const AuthSubtitleTextDescriptionWidget({
    super.key,
    required this.description,
    this.textAlign = TextAlign.center,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Text(
      description,
      textAlign: textAlign,
      style: theme.textTheme.titleMedium?.copyWith(
        color: theme.colorScheme.secondary,
      ),
    );
  }
}
