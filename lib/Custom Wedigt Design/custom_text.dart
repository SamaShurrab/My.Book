import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomText extends StatelessWidget {
  final String textData;
  final TextAlign textAlign;
  final double fontSize;
  final Color textColor;
  final double? height;
  final FontWeight fontWeight;
  const CustomText(
      {super.key,
      required this.textData,
      this.height,
      required this.textAlign,
      required this.fontSize,
      required this.textColor,
      required this.fontWeight});
  @override
  Widget build(BuildContext context) {
    return Text(
      textData,
      textAlign: textAlign,
      style: TextStyle(
        height: height,
        fontSize: ScreenUtil().setSp(fontSize),
        color: textColor,
        fontWeight: fontWeight,
      ),
    );
  } //build()
}//CustomText class