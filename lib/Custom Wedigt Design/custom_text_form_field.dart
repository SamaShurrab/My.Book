// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_book_app/Values/colors.dart';
import 'package:my_book_app/Values/string.dart';

// This class is used to design the TextFormField.
class CustomTextFormField extends StatefulWidget {
  final TextInputType textInputType;
  final bool obscureText;
  final InputBorder focusedBorder;
  final InputBorder enabledBorder;
  final errorBorder;
  final focusedErrorBorder;
  final hintText;
  final textColorHint;
  final fontSizeHint;
  final fontWeightHint;
  final Color backgroung;
  final suffixIcon;
  final suffixIconColor;
  final TextInputAction textInputAction;
  final iconSize;
  final errorFontSize;
  final errorTextColor;
  final controller;
  final errorEmailMessage;
  final double fontSize;
  final double vertical;
  final double bottom;
  final maxLength;
  final TextAlign textAlign;
  final double horizontal;
  final FontWeight fontWeight;
  final Color textColor;
  final TextAlignVertical textAlignVertical;
  final int? maxLines;
  const CustomTextFormField(
      {super.key,
      this.maxLines,
      required this.bottom,
      required this.textAlignVertical,
      required this.textInputType,
      required this.obscureText,
      required this.enabledBorder,
      required this.focusedBorder,
      this.hintText,
      this.textColorHint,
      this.fontSizeHint,
      this.fontWeightHint,
      required this.textInputAction,
      required this.backgroung,
      this.suffixIcon,
      this.suffixIconColor,
      this.iconSize,
      this.errorBorder,
      this.focusedErrorBorder,
      this.errorTextColor,
      this.errorFontSize,
      this.controller,
      this.errorEmailMessage,
      required this.vertical,
      required this.horizontal,
      this.maxLength,
      required this.fontSize,
      required this.fontWeight,
      required this.textColor,
      required this.textAlign});
  @override
  State<StatefulWidget> createState() {
    return CustomTextFormFieldState();
  } //createState()
} //CustomTextFormField class

class CustomTextFormFieldState extends State<CustomTextFormField> {
  /*
    In this variable, the status of the password appears is stored or not.
    If it is false, the password will appear as a code, 
    And if it's true,the user's password will appear

  */
  bool isPasswordIsVisible = false;

  // These variables are stored in the requirements of the user to consider when entering
  final RegExp nameRegex = RegExp(r"^[a-zA-Z\u0600-\u06FF\s]+$");
  final RegExp emailRegex =
      RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$");
  final RegExp phoneRegex = RegExp(r"^\+?[0-9]{10,15}$");
  final RegExp passwordRegex = RegExp(r"^\d{8,}$");

  /*
    This function checks all the input fields and whether they match the desired conditions or not,
    and each field has its own error message.If there is no error,no message will appear.
  */
  String? validator(String value) {
    // To check whether the value entered by the user in each field is empty or not
    if (value.isEmpty) {
      switch (widget.hintText) {
        case "Username":
          return AppStrings.userNameEmpty;
        case "Password":
        case "New password":
        case "Confirm password":
          return AppStrings.passwordEmpty;
        case "Email Address":
          return AppStrings.emailAddressEmpty;
        case "Phone Number":
          return AppStrings.phoneNumberEmpty;
        default:
          return AppStrings.emptyField;
      } // switch()
    } else {
      //To check whether the value entered by the user in each field matches the required conditions.
      if (widget.hintText == "Username" && !nameRegex.hasMatch(value)) {
        return AppStrings.userNameRegx;
      } //if()

      if (["Password", "New password", "Confirm password"]
              .contains(widget.hintText) &&
          !passwordRegex.hasMatch(value)) {
        return AppStrings.passwordRegx;
      } //if()

      if (widget.hintText == "Email Address" && !emailRegex.hasMatch(value)) {
        return AppStrings.emailAddressRegx;
      } //if()

      if (widget.hintText == "Phone Number" && !phoneRegex.hasMatch(value)) {
        return AppStrings.phoneNumberRegx;
      } //if()
      return null;
    } // validator()
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: widget.maxLines ?? 1,
      //This function if the entered value is 1 will automatically move to the next field,
      onChanged: (value) {
        if (value.length == widget.maxLength) {
          FocusScope.of(context).nextFocus();
          return;
        }
      },
      textAlignVertical: widget.textAlignVertical,
      textAlign: widget.textAlign,
      style: TextStyle(
          fontSize: ScreenUtil().setSp(widget.fontSize.sp),
          color: widget.textColor,
          fontWeight: widget.fontWeight),
      maxLength: widget.maxLength,
      controller: widget.controller,
      textInputAction: widget.textInputAction,
      validator: (value) {
        return validator(value!);
      },
      onSaved: (value) {},
      cursorColor: AppColors.tahitiGold,
      keyboardType: widget.textInputType,
      obscureText: (widget.maxLines == null || widget.maxLines == 1)
          ? (isPasswordIsVisible ? false : widget.obscureText)
          : false,
      decoration: InputDecoration(
          counterText: "",
          errorText: widget.errorEmailMessage,
          errorStyle: TextStyle(
              color: widget.errorTextColor,
              fontWeight: widget.fontWeight,
              fontSize: widget.errorFontSize),
          focusedErrorBorder: widget.focusedErrorBorder,
          errorBorder: widget.errorBorder,
          enabledBorder: widget.enabledBorder,
          focusedBorder: widget.focusedBorder,
          hintText: widget.hintText,
          contentPadding: EdgeInsets.only(
              top: ScreenUtil().setHeight(widget.vertical.h),
              left: ScreenUtil().setWidth(widget.horizontal.w),
              right: ScreenUtil().setWidth(widget.horizontal.w),
              bottom: ScreenUtil().setHeight(widget.bottom.h)),
          hintStyle: TextStyle(
            color: widget.textColorHint,
            fontSize: widget.fontSizeHint,
            fontWeight: widget.fontWeightHint,
          ),
          filled: true,
          fillColor: widget.backgroung,
          suffixIcon: widget.suffixIcon == null
              ? null
              : Padding(
                  padding: EdgeInsets.only(right: ScreenUtil().setWidth(10.w)),
                  child: widget.textInputType == TextInputType.text ||
                          widget.textInputType == TextInputType.emailAddress ||
                          widget.hintText == "Phone Number"
                      ? Icon(
                          widget.suffixIcon,
                          size: widget.iconSize,
                        )
                      : InkWell(
                          splashColor: Colors.transparent,
                          onTap: () {
                            setState(() {
                              isPasswordIsVisible = !isPasswordIsVisible;
                            });
                          },
                          child: isPasswordIsVisible
                              ? Icon(
                                  Icons.visibility_outlined,
                                  size: widget.iconSize,
                                )
                              : Icon(
                                  Icons.visibility_off_outlined,
                                  size: widget.iconSize,
                                ))),
          suffixIconColor: widget.suffixIconColor),
    );
  } //build()
} //CustomTextFormFieldState class
