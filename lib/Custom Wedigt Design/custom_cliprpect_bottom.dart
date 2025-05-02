import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// A widget that clips its child with rounded corners only at the bottom.
class CustomClipRRectBottom extends StatelessWidget {
  final Widget child;
  const CustomClipRRectBottom({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        /// responsive to screen size using ScreenUtil.
        bottomLeft: Radius.circular(ScreenUtil().radius(20.r)),
        bottomRight: Radius.circular(ScreenUtil().radius(20.r)),
      ),
      child: child,
    );
  } //build()
} //CustomClipRRectBottom  class
