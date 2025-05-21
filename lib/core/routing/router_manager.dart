import 'package:flutter/material.dart' show BuildContext;
import 'package:go_router/go_router.dart';

/// A utility class for managing app navigation using named routes.
///
/// The [AppRouterManager] class provides static methods to simplify navigation
/// throughout the app. It wraps common navigation actions such as pushing new
/// routes, replacing routes, and popping routes, using the provided [BuildContext].
///
/// This class cannot be instantiated.
class AppRouterManager {
  /// Private constructor to prevent instantiation.
  AppRouterManager._();

  /// Pushes a new route onto the navigation stack using the given [pagePath].
  ///
  /// Optionally, an [extra] object can be passed to the new route.
  ///
  /// Example:
  /// ```dart
  /// AppRouterManager.push(context, '/details', extra: myData);
  /// ```
  static void push(BuildContext context, String pagePath, {Object? extra}) =>
      context.push(pagePath, extra: extra);

  /// Pushes a named route onto the navigation stack.
  ///
  /// [pageName] is the name of the route to push.
  /// Optionally, an [extra] object can be passed to the new route.
  ///
  /// Example:
  /// ```dart
  /// AppRouterManager.pushNamed(context, 'home', extra: myData);
  /// ```
  static void pushNamed(
    BuildContext context,
    String pageName, {
    Object? extra,
  }) => context.pushNamed(pageName, extra: extra);

  /// Replaces the current route by pushing a named route and removing the previous one.
  ///
  /// [pageName] is the name of the route to push.
  /// Optionally, an [extra] object can be passed to the new route.
  ///
  /// Example:
  /// ```dart
  /// AppRouterManager.pushReplacementNamed(context, 'login', extra: myData);
  /// ```
  static void pushReplacementNamed(
    BuildContext context,
    String pageName, {
    Object? extra,
  }) => context.pushReplacementNamed(pageName, extra: extra);

  /// Replaces the current route by pushing a path route and removing the previous one.
  ///
  /// [pagepath] is the path of the route to push.
  /// Optionally, an [extra] object can be passed to the new route.
  ///
  /// Example:
  /// ```dart
  /// AppRouterManager.pushReplacement(context, '/login', extra: myData);
  /// ```
  static void pushReplacement(
    BuildContext context,
    String pagepath, {
    Object? extra,
  }) => context.pushReplacement(pagepath, extra: extra);

  /// Navigates directly to a named route, replacing the current route stack.
  ///
  /// [pageName] is the name of the route to navigate to.
  /// Optionally, an [extra] object can be passed to the new route.
  ///
  /// Example:
  /// ```dart
  /// AppRouterManager.goNamed(context, 'dashboard', extra: myData);
  /// ```
  static void goNamed(BuildContext context, String pageName, {Object? extra}) =>
      context.goNamed(pageName, extra: extra);

  /// Navigates directly to a a path route, replacing the current route stack.
  ///
  /// [pagePath] is the path of the route to navigate to.
  /// Optionally, an [extra] object can be passed to the new route.
  ///
  /// Example:
  /// ```dart
  /// AppRouterManager.go(context, '/dashboard', extra: myData);
  /// ```
  static void go(BuildContext context, String pagePath, {Object? extra}) =>
      context.go(pagePath, extra: extra);

  /// Pops the top-most route off the navigation stack.
  ///
  /// Example:
  /// ```dart
  /// AppRouterManager.pop(context);
  /// ```
  static void pop(BuildContext context) => context.pop();
}
