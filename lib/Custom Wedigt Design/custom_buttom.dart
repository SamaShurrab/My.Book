import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_book_app/Custom%20Wedigt%20Design/custom_text.dart';
import 'package:my_book_app/Values/string.dart';

// This class is for button design.
class CustomButton extends StatelessWidget {
  final String? routeName;
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
  final int? itemsSlected;
  final String? textData;
  final TextAlign? textAlignSnack;
  final double? fontSizeSnack;
  final Color? textColorSnack;
  final FontWeight? fontWeightSnack;
  final Color? snackbackground;
  final VoidCallback? onPressed;

  const CustomButton({
    super.key,
    this.routeName,
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
    this.itemsSlected,
    this.textData,
    this.textAlignSnack,
    this.fontSizeSnack,
    this.textColorSnack,
    this.fontWeightSnack,
    this.snackbackground,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: ScreenUtil().setWidth(width.w),
      height: ScreenUtil().setHeight(height.h),
      child: MaterialButton(
        elevation: elevation,
        color: background,
        shape: shapeBorder,
        onPressed: onPressed ??
            () {
              if (routeName == null || routeName!.isEmpty) {
                Navigator.of(context).pop();
                return;
              }

              // When you press the logout button, you will exit the application.
              if (routeName == "logout") {
                SystemNavigator.pop();
              } else if (routeName == "register" || routeName == "signin") {
                Navigator.of(context).pushReplacementNamed(routeName!);

                // If the "next" button is pressed, the code checks the value of itemsSlected before navigating or showing an alert message.
              } else if (buttonName == AppStrings.next) {
                if (itemsSlected == null || itemsSlected! < 3) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: CustomText(
                        text: textData!,
                        textAlign: textAlignSnack!,
                        fontSize: fontSizeSnack!,
                        textColor: textColorSnack!,
                        fontWeight: fontWeightSnack!,
                      ),
                      backgroundColor: snackbackground!,
                    ),
                  );
                } else {
                  Navigator.of(context).pushReplacementNamed(routeName!);
                }
              } else {
                Navigator.of(context).pushNamed(routeName!);
              }
            },
        child: Text(
          buttonName,
          textAlign: textAlign,
          style: TextStyle(
            fontSize: ScreenUtil().setSp(fontSize.sp),
            fontWeight: fontWeight,
            color: textColor,
          ),
        ),
      ),
    );
  }
}
