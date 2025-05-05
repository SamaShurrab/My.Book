import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// This class is for designing text to suit each interface.
class CustomText extends StatelessWidget {
  final String text;
  final TextAlign textAlign;
  final double fontSize;
  final Color textColor;
  final double? height;
  final FontWeight fontWeight;
  const CustomText(
      {super.key,
      required this.text,
      this.height,
      required this.textAlign,
      required this.fontSize,
      required this.textColor,
      required this.fontWeight});
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: TextStyle(
        height: height,
        fontSize: ScreenUtil().setSp(fontSize.sp),
        color: textColor,
        fontWeight: fontWeight,
      ),
    );
  } //build()
}//CustomText class