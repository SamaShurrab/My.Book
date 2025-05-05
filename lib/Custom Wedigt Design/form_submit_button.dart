import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// This class is for designing the button for the form.
class FormSubmitButton extends StatefulWidget {
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
  const FormSubmitButton(
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
    return FormSubmitButtonState();
  } //createState()
} //FormSubmitButton  class

class FormSubmitButtonState extends State<FormSubmitButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: ScreenUtil().setWidth(widget.width.w),
      height: ScreenUtil().setHeight(widget.height.h),
      child: MaterialButton(
        elevation: widget.elevation,
        color: widget.background,
        shape: widget.shapeBorder,
        onPressed: () {
          if (widget.formKey.currentState!.validate()) {
            if (widget.onPressed != null) {
              widget.onPressed!();
            }
          }
        },
        child: Text(
          widget.buttonName,
          textAlign: widget.textAlign,
          style: TextStyle(
              fontSize: ScreenUtil().setSp(widget.fontSize.sp),
              fontWeight: widget.fontWeight,
              color: widget.textColor),
        ),
      ),
    );
  } //build()
} //FormSubmitButtonState class
