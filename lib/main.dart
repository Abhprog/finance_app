import 'package:finance_app/core/routing/router_generation_config.dart';
import 'package:flutter/material.dart'
    show
        BuildContext,
        MaterialApp,
        SafeArea,
        Size,
        StatelessWidget,
        ThemeMode,
        Widget,
        runApp;
import 'package:flutter_screenutil/flutter_screenutil.dart' show ScreenUtilInit;

import 'core/shared/theme/styles/theme_data_dark.dart';
import 'core/shared/theme/styles/theme_data_light.dart';

void main() {
  runApp(const FinanceApp());
}

class FinanceApp extends StatelessWidget {
  const FinanceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return SafeArea(
          child: MaterialApp.router(
            title: 'Finance App',
            debugShowCheckedModeBanner: false,
            theme: themeDataLight,
            darkTheme: themeDataDark,
            themeMode: ThemeMode.light,
            routerConfig: router,
          ),
        );
      },
    );
  }
}
