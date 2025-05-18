import 'package:flutter/material.dart' show BuildContext;
import 'package:go_router/go_router.dart';

class AppRouterManager {
  AppRouterManager._();

  static void push(BuildContext context, String pageName, {Object? extra}) =>
      context.push(pageName, extra: extra);

  static void pushNamed(
    BuildContext context,
    String pageName, {
    Object? extra,
  }) => context.pushNamed(pageName, extra: extra);

  static void pushReplacementNamed(
    BuildContext context,
    String pageName, {
    Object? extra,
  }) => context.pushReplacementNamed(pageName, extra: extra);

  static void goNamed(BuildContext context, String pageName, {Object? extra}) =>
      context.goNamed(pageName, extra: extra);

  static void pop(BuildContext context) => context.pop();
}
