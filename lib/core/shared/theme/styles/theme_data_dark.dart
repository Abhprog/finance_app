import 'package:flutter/material.dart'
    show
        ActionIconThemeData,
        AppBarTheme,
        BorderRadius,
        BorderSide,
        BuildContext,
        ButtonStyle,
        ButtonThemeData,
        Color,
        ColorScheme,
        EdgeInsets,
        ElevatedButton,
        ElevatedButtonThemeData,
        FontWeight,
        Icon,
        IconButtonThemeData,
        IconThemeData,
        Icons,
        InputDecorationTheme,
        MaterialTapTargetSize,
        OutlineInputBorder,
        OutlinedBorder,
        OutlinedButtonThemeData,
        RoundedRectangleBorder,
        Size,
        TextButton,
        TextButtonThemeData,
        TextStyle,
        TextTheme,
        ThemeData,
        WidgetStatePropertyAll;
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../colors/app_colors_dark.dart';

ThemeData themeDataDark = ThemeData(
  useMaterial3: true,
  colorScheme: _getColorScheme(),
  scaffoldBackgroundColor: AppColorsDark.scaffoldBackgroundColor,
  appBarTheme: _getAppBarTheme(),
  textTheme: TextTheme(
    bodyLarge: _getBody16PrimaryWhiteSubtitlesLargeStyle(),
    bodyMedium: _getBody14WhiteMediumStyle(),
    bodySmall: _getBody12WhiteSmallStyle(),
    headlineLarge: _getHeadline24LargeStyle(),
    headlineMedium: _getHeadline21MediumStyle(),
    headlineSmall: _getHeadline18SmallStyle(),
    displayLarge: _getDisplay32PrimaryWhiteLargeStyle(),
    displayMedium: _getDisplay28WhiteMediumStyle(),
    displaySmall: _getDisplay24WhiteSmallStyle(),
  ),
  buttonTheme: _getButtonThemeStyle(),
  iconTheme: IconThemeData(color: AppColorsDark.secondaryColor),
  actionIconTheme: ActionIconThemeData(
    backButtonIconBuilder: (BuildContext context) {
      return Icon(Icons.arrow_back_ios, color: AppColorsDark.white);
    },
  ),
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

ButtonThemeData _getButtonThemeStyle() {
  return ButtonThemeData(
    buttonColor: AppColorsDark.primaryColor,
    disabledColor: AppColorsDark.secondaryColor,
  );
}

IconButtonThemeData _getIconButtonTheme() {
  return IconButtonThemeData(
    style: ButtonStyle(
      iconColor: WidgetStatePropertyAll(AppColorsDark.secondaryColor),
    ),
  );
}

ElevatedButtonThemeData _getElevatedButtonTheme() {
  return ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: AppColorsDark.primaryColor,
      foregroundColor: AppColorsDark.secondaryColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
      padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 35.w),
    ),
  );
}

OutlinedButtonThemeData _getOutlinedButtonTheme() {
  return OutlinedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: WidgetStatePropertyAll<Color>(
        AppColorsDark.secondaryColor.withAlpha(70),
      ),
      side: WidgetStatePropertyAll<BorderSide?>(
        BorderSide(color: AppColorsDark.primaryColor, width: 1.5),
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

InputDecorationTheme _getInputDecorationTheme() {
  return InputDecorationTheme(
    filled: true, // default is false
    fillColor: AppColorsDark.primaryColor.withAlpha(10),
    contentPadding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 15.w),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.r),
      borderSide: BorderSide(
        color: AppColorsDark.primaryColor.shade200,
        width: 1.5,
      ),
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.r),
      borderSide: BorderSide(color: AppColorsDark.secondaryColor, width: 1.5),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.r),
      borderSide: BorderSide(color: AppColorsDark.primaryColor, width: 3),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.r),
      borderSide: BorderSide(color: AppColorsDark.primaryColor, width: 3),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.r),
      borderSide: BorderSide(color: AppColorsDark.errorColor, width: 1.5),
    ),
    hintStyle: TextStyle(
      color: AppColorsDark.secondaryColor, // dark grey
    ),
  );
}

extension CustomColorScheme on ColorScheme {
  Color get darkGrey => const Color(0xFF424242);
}

ColorScheme _getColorScheme() {
  return ColorScheme.dark(
    primary: AppColorsDark.primaryColor,
    onPrimary: AppColorsDark.white,
    secondary: AppColorsDark.secondaryColor,
    surface: AppColorsDark.scaffoldBackgroundColor,
    error: AppColorsDark.errorColor,
  );
}

AppBarTheme _getAppBarTheme() {
  return AppBarTheme(
    backgroundColor: AppColorsDark.primaryColor,
    foregroundColor: AppColorsDark.white,
    iconTheme: IconThemeData(color: AppColorsDark.white),
  );
}

TextStyle _getDisplay24WhiteSmallStyle() {
  return TextStyle(
    fontSize: 24.sp,
    fontWeight: FontWeight.bold,
    color: AppColorsDark.white,
  );
}

TextStyle _getDisplay28WhiteMediumStyle() {
  return TextStyle(
    fontSize: 28.sp,
    fontWeight: FontWeight.bold,
    color: AppColorsDark.white,
  );
}

TextStyle _getDisplay32PrimaryWhiteLargeStyle() {
  return TextStyle(
    fontSize: 32.sp,
    fontWeight: FontWeight.bold,
    color: AppColorsDark.white,
  );
}

TextStyle _getHeadline24LargeStyle() {
  return TextStyle(
    fontSize: 24.sp,
    fontWeight: FontWeight.bold,
    color: AppColorsDark.primaryColor.shade300,
  );
}

TextStyle _getHeadline21MediumStyle() {
  return TextStyle(
    fontSize: 21.sp,
    fontWeight: FontWeight.bold,
    color: AppColorsDark.white,
  );
}

TextStyle _getHeadline18SmallStyle() {
  return TextStyle(
    fontSize: 18.sp,
    fontWeight: FontWeight.bold,
    color: AppColorsDark.white,
  );
}

TextStyle _getBody12WhiteSmallStyle() {
  return TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeight.w500, // medium
    color: AppColorsDark.white,
  );
}

TextStyle _getBody14WhiteMediumStyle() {
  return TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w500, // medium
    color: AppColorsDark.white,
  );
}

TextStyle _getBody16PrimaryWhiteSubtitlesLargeStyle() {
  return TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w500, // medium
    color: AppColorsDark.foregroundColor,
  );
}

// This code defines a dark theme for a Flutter application using the ThemeData class.
// It sets the color scheme, app bar theme, and text styles for various text elements.
