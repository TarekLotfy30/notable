import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Skeleton extends StatelessWidget {
  const Skeleton({super.key, this.height, this.width});

  final double? height, width;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      padding: const EdgeInsets.symmetric(
        horizontal: 11,
        vertical: 20,
      ),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.04),
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(
          color: Colors.black.withOpacity(0.1),
          width: 3,
        ),
      ),
    );
  }
}

/*


2- هتعمل ال shimmer effect

بعد بقي مت customize ال screen بتاعتك باستخدام
 الresuable skelton و circleSkelton هتراب كل الي عملتوا
ب shimmer.fromColors وهتديها الbaseColor و ال
 highlightColor
 وهتضيف الي عملته بدل
ال CircularProgressIndicator
 وعشان تستخدم الeffect هتحتاج
 تعمل install للpackage


*/
