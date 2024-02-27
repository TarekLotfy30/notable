import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../styles/text_style.dart';

/// Returns a vertical spacing box with [height].
SizedBox verticalSpacing(double height) => SizedBox(height: height.h);

/// Returns a horizontal spacing box with [width].
SizedBox horizontalSpacing(double width) => SizedBox(width: width.w);

/// Shows a date picker dialog and returns the selected date.
Future<DateTime?> datePicker({required BuildContext context}) {
  return showDatePicker(
    context: context,
    initialDate: DateTime.now(),
    firstDate: DateTime(2019, 5, 21),
    lastDate: DateTime.now().add(const Duration(days: 365 * 5)),
  );
}

/// Shows a SnackBar with the provided [message] and optional [action].
Future<void> showSnackBar(
    BuildContext context, String message, Color backgroundColor,
    {String? action}) async {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        message,
        style: TextStyles.font16Regular,
      ),
      backgroundColor: backgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      behavior: SnackBarBehavior.floating,
      elevation: 0,
      duration: const Duration(seconds: 1),
      margin: EdgeInsets.symmetric(
        horizontal: 20.w,
        vertical: 20.h,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 20.w,
        vertical: 10.h,
      ),
      dismissDirection: DismissDirection.horizontal,
      action: action != null
          ? SnackBarAction(
              label: action,
              onPressed: () =>
                  ScaffoldMessenger.of(context).hideCurrentSnackBar(),
            )
          : null,
    ),
  );
}

/*

Future<DateTime?> datePicker({
  required BuildContext context,
  required TextEditingController textEditingController,
}) {
  return showDatePicker(
    context: context,
    initialDate: DateTime.now(),
    firstDate: DateTime(2019, 5, 21),
    lastDate: DateTime.now().add(const Duration(days: 365 * 5)),
    builder: (BuildContext context, Widget? child) {
      return Theme(
        data: ThemeData.light().copyWith(
          colorScheme: ColorScheme.light(
            primary: Colors.red,  // change to your desired color
            onPrimary: Colors.white,  // change to your desired color
          ),
          buttonTheme: ButtonThemeData(
              textTheme: ButtonTextTheme.primary
          ),
        ),
        child: child!,
      );
    },
  ).then((value) {
    if (value != null) {
      textEditingController.text = DateFormat.yMMMd().format(value);
    }
  });
}
*/
/*/// Shows a toast message with [msg] and returns a future that completes
/// when the toast is hidden.
Future<bool?> showToast({required String msg}) {
  return Fluttertoast.showToast(
    msg: msg,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 2,
    backgroundColor: AppColors.primaryColor,
    textColor: Colors.white,
    fontSize: 16.0,
  );
}*/
