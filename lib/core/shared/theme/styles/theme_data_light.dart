import 'dart:ui';

import 'package:flutter/material.dart'
    show
        AppBarTheme,
        BorderRadius,
        BorderSide,
        ButtonStyle,
        ButtonThemeData,
        ColorScheme,
        EdgeInsets,
        ElevatedButton,
        ElevatedButtonThemeData,
        FontWeight,
        IconButtonThemeData,
        IconThemeData,
        InputDecorationTheme,
        MaterialTapTargetSize,
        OutlineInputBorder,
        OutlinedBorder,
        OutlinedButtonThemeData,
        RoundedRectangleBorder,
        TextButton,
        TextButtonThemeData,
        TextStyle,
        TextTheme,
        ThemeData,
        WidgetStatePropertyAll;
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../colors/app_colors_light.dart';

ThemeData themeDataLight = ThemeData(
  useMaterial3: true,
  colorScheme: _getColorScheme(),
  scaffoldBackgroundColor: AppColorsLight.scaffoldBackgroundColor,
  appBarTheme: _getAppBarTheme(),
  textTheme: TextTheme(
    bodyLarge: _getBody16PrimarySubtitlesLargeStyle(),
    bodyMedium: _getBody14MediumStyle(),
    bodySmall: _getBody12SmallStyle(),
    displayLarge: _getDisplay32LargeStyle(),
    displayMedium: _getDisplay28MediumStyle(),
    displaySmall: _getDisplay24SmallStyle(),
    headlineLarge: _getHeadlinePrimary24LargeStyle(),
    headlineMedium: _getHeadline21MediumStyle(),
    headlineSmall: _getHeadline18SmallStyle(),
  ),
  buttonTheme: _getButtonTextTheme(),
  iconTheme: IconThemeData(color: AppColorsLight.secondaryColor),
  iconButtonTheme: _getIconButtonTheme(),
  elevatedButtonTheme: _getElevatedButtonTheme(),
  outlinedButtonTheme: _getOutlinedButtonTheme(),
  inputDecorationTheme: _getInputDecorationTheme(),
  textButtonTheme: _getTextButtonTheme(),
);

TextButtonThemeData _getTextButtonTheme() {
  return TextButtonThemeData(
    style: TextButton.styleFrom(
      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      minimumSize: Size.zero,
    ),
  );
}

InputDecorationTheme _getInputDecorationTheme() {
  return InputDecorationTheme(
    filled: true, // default is false
    fillColor: AppColorsLight.primaryColor.withAlpha(10),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.r),
      borderSide: BorderSide(color: AppColorsLight.secondaryColor, width: 1.5),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.r),
      borderSide: BorderSide(color: AppColorsLight.primaryColor, width: 1.5),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.r),
      borderSide: BorderSide(color: AppColorsLight.errorColor, width: 1.5),
    ),
    hintStyle: TextStyle(
      color: AppColorsLight.secondaryColor, // dark grey
    ),
  );
}

OutlinedButtonThemeData _getOutlinedButtonTheme() {
  return OutlinedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: WidgetStatePropertyAll<Color>(
        AppColorsLight.secondaryColor.withAlpha(10),
      ),
      side: WidgetStatePropertyAll<BorderSide?>(
        BorderSide(color: AppColorsLight.primaryColor, width: 1.5),
      ),
      shape: WidgetStatePropertyAll<OutlinedBorder?>(
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
      ),
      padding: WidgetStatePropertyAll<EdgeInsets>(
        EdgeInsets.symmetric(vertical: 16.h, horizontal: 35.w),
      ),
    ),
  );
}

ElevatedButtonThemeData _getElevatedButtonTheme() {
  return ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: AppColorsLight.primaryColor,
      foregroundColor: AppColorsLight.secondaryColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
      padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 35.w),
    ),
  );
}

IconButtonThemeData _getIconButtonTheme() {
  return IconButtonThemeData(
    style: ButtonStyle(
      iconColor: WidgetStatePropertyAll(AppColorsLight.secondaryColor),
    ),
  );
}

extension CustomColorScheme on ColorScheme {
  Color get darkGrey => const Color(0xFF424242);
}

ColorScheme _getColorScheme() {
  return ColorScheme.light(
    primary: AppColorsLight.primaryColor,
    secondary: AppColorsLight.secondaryColor,
    surface: AppColorsLight.scaffoldBackgroundColor,
    error: const Color.fromARGB(255, 199, 35, 65),
  );
}

AppBarTheme _getAppBarTheme() {
  return AppBarTheme(
    backgroundColor: AppColorsLight.primaryColor,
    foregroundColor: AppColorsLight.white,
  );
}

ButtonThemeData _getButtonTextTheme() {
  return ButtonThemeData(
    buttonColor: AppColorsLight.primaryColor,
    disabledColor: AppColorsLight.secondaryColor,
  );
}

_getHeadline18SmallStyle() {
  return TextStyle(
    fontSize: 18.sp,
    fontWeight: FontWeight.bold,
    color: AppColorsLight.foregroundColor,
  );
}

_getHeadline21MediumStyle() {
  return TextStyle(
    fontSize: 21.sp,
    fontWeight: FontWeight.bold,
    color: AppColorsLight.foregroundColor,
  );
}

_getBody14MediumStyle() {
  return TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.normal,
    color: AppColorsLight.foregroundColor,
  );
}

TextStyle _getBody12SmallStyle() {
  return TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeight.normal,
    color: AppColorsLight.foregroundColor,
  );
}

TextStyle _getBody16PrimarySubtitlesLargeStyle() {
  // the default for the textfields
  return TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w500,
    color: AppColorsLight.foregroundColor,
  );
}

_getDisplay24SmallStyle() {
  return TextStyle(
    fontSize: 24.sp,
    fontWeight: FontWeight.bold,
    color: AppColorsLight.foregroundColor,
  );
}

_getDisplay28MediumStyle() {
  return TextStyle(
    fontSize: 28.sp,
    fontWeight: FontWeight.bold,
    color: AppColorsLight.foregroundColor,
  );
}

_getDisplay32LargeStyle() {
  return TextStyle(
    fontSize: 32.sp,
    fontWeight: FontWeight.bold,
    color: AppColorsLight.foregroundColor,
  );
}

TextStyle _getHeadlinePrimary24LargeStyle() {
  return TextStyle(
    fontSize: 24.sp,
    fontWeight: FontWeight.bold,
    color: AppColorsLight.primaryColor,
  );
}

// This code defines a dark theme for a Flutter application using the ThemeData class.
// It sets the color scheme, app bar theme, and text styles for various text elements.
