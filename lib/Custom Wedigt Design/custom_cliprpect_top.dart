import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// A widget that clips its child with rounded corners only at the top.
class CustomClipRRectTop extends StatelessWidget {
  final Widget child;
  const CustomClipRRectTop({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        /// responsive to screen size using ScreenUtil.
        topLeft: Radius.circular(ScreenUtil().radius(20.r)),
        topRight: Radius.circular(ScreenUtil().radius(20.r)),
      ),
      child: child,
    );
  } //build()
} //CustomClipRRectTop class
