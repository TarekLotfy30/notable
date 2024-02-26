import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
