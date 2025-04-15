import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButtonForm extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  final String buttonName;
  final double fontSize;
  final FontWeight fontWeight;
  final Color textColor;
  final TextAlign textAlign;
  final ShapeBorder shapeBorder;
  final Color background;
  final double elevation;
  final double width;
  final double height;
  final VoidCallback? onPressed;
  const CustomButtonForm(
      {super.key,
      required this.formKey,
      required this.buttonName,
      required this.fontSize,
      required this.fontWeight,
      required this.textColor,
      required this.textAlign,
      required this.shapeBorder,
      required this.elevation,
      required this.background,
      required this.height,
      required this.width,
      this.onPressed});
  @override
  State<StatefulWidget> createState() {
    return CustomButtonFormState();
  } //createState()
} //CustomButtonForm class

class CustomButtonFormState extends State<CustomButtonForm> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: ScreenUtil().setWidth(widget.width),
      height: ScreenUtil().setHeight(widget.height),
      child: MaterialButton(
        elevation: widget.elevation,
        color: widget.background,
        shape: widget.shapeBorder,
        onPressed: widget.onPressed,
        child: Text(
          widget.buttonName,
          textAlign: widget.textAlign,
          style: TextStyle(
              fontSize: ScreenUtil().setSp(widget.fontSize),
              fontWeight: widget.fontWeight,
              color: widget.textColor),
        ),
      ),
    );
  } //build()
}
