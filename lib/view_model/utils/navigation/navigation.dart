import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

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

  /// Navigates to the specified [screen] and removes all previous screens
  /// from the history.
  ///
  /// This method is ideal for starting a completely new flow within the app,
  /// preventing users from navigating back to previous screens.
  /// It's commonly used for login flows, onboarding processes, or isolated
  /// tasks that shouldn't be intermixed with the main navigation stack.

  static void pushAndRemove(BuildContext context, Widget screen) {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => screen),
      (route) => false,
    );
  }

  /// Navigates to the specified [screen], replacing the current screen in the history.
  ///
  /// This method maintains a backward navigation path while ensuring that
  /// returning to the previous screen won't lead back to the screen that was
  /// replaced. It's suitable for scenarios where you want to maintain a linear
  /// flow with the ability to go back one step but prevent returning to specific
  /// screens within the flow.
  ///
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

  static void navigateToWithoutNavBar(BuildContext context, Widget screen,
      {bool withNavBar = false}) {
    pushNewScreen(
      context,
      screen: screen,
      // replace this with the screen you want to navigate to
      withNavBar: withNavBar,
      // OPTIONAL VALUE. True by default.
      pageTransitionAnimation: PageTransitionAnimation.cupertino,
    );
  }

  static void navigateToLoginScreen(BuildContext context, Widget screen) {
    Navigator.of(context, rootNavigator: true).pushAndRemoveUntil(
      MaterialPageRoute(
        builder: (BuildContext context) {
          return screen;
        },
      ),
      (_) => false,
    );
  }

/*
  * pushWithoutNavBar(
  context,
  MaterialPageRoute(builder: (context) => ...)
);*/

/*
ElevatedButton(
  onPressed: () => navigateToMainScreen(context),
  child: Text('Go to Main Screen'),
)
*/
}
