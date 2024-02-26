import 'package:flutter/material.dart';

/// `Navigation` is a utility class that provides static methods to handle
/// navigation tasks such as pushing a new screen onto the stack, replacing
/// the current screen, and popping a screen from the stack.
class Navigation {
  /// Pushes [screen] onto the navigation stack.
  ///
  /// The [push] method adds [screen] onto the stack of screens managed by
  /// the [Navigator]. This causes [screen] to slide in from the right and
  /// cover the current screen.
  static void push(BuildContext context, Widget screen) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => screen),
    );
  }

  /// Replaces the current screen with [screen].
  ///
  /// The [pushAndRemove] method adds [screen] to the stack and then removes
  /// all the previous screens from the stack. This is useful when you want
  /// to start a new flow and remove all the previous screens.
  static void pushAndRemove(BuildContext context, Widget screen) {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => screen),
      (route) => false,
    );
  }

  /// Replaces the current screen with [screen].
  ///
  /// The [pushAndRemove] method adds [screen] to the stack and then removes
  /// all the previous screens from the stack. This is useful when you want
  /// to start a new flow and remove all the previous screens.
  static void pushReplacement(BuildContext context, Widget screen) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => screen),
    );
  }

  /// Pops the current screen from the navigation stack.
  ///
  /// The [pop] method removes the current screen from the stack and reveals
  /// the previous screen. This is typically used to navigate back to the
  /// previous screen.
  static void pop(BuildContext context) {
    Navigator.pop(context);
  }
}
