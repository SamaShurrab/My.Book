import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_book_app/Custom%20Wedigt%20Design/custom_text.dart';
import 'package:my_book_app/Values/string.dart';

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
  const CustomButton(
      {super.key,
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
      this.snackbackground});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: ScreenUtil().setWidth(width),
      height: ScreenUtil().setHeight(height),
      child: MaterialButton(
        elevation: elevation,
        color: background,
        shape: shapeBorder,
        onPressed: () {
          routeName != ""
              ? routeName == "register" || routeName == "signin"
                  ? Navigator.of(context).pushReplacementNamed(routeName!)
                  : buttonName == AppStrings.next
                      ? itemsSlected == null || itemsSlected! < 3
                          ? ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: CustomText(
                                  textData: textData!,
                                  textAlign: textAlignSnack!,
                                  fontSize: fontSizeSnack!,
                                  textColor: textColorSnack!,
                                  fontWeight: fontWeightSnack!),
                              backgroundColor: snackbackground!,
                            ))
                          : Navigator.of(context)
                              .pushReplacementNamed(routeName!)
                      : Navigator.of(context).pushNamed(routeName!)
              : Navigator.of(context).pop();
          // if (buttonName == AppStrings.next) {
          //   if (itemsSlected == null || itemsSlected! <= 3) {
          //     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          //       content: CustomText(
          //           textData: textData!,
          //           textAlign: textAlignSnack!,
          //           fontSize: fontSizeSnack!,
          //           textColor: textColorSnack!,
          //           fontWeight: fontWeightSnack!),
          //       backgroundColor: snackbackground!,
          //     ));
          //   }
          // }
        },
        child: Text(
          buttonName,
          textAlign: textAlign,
          style: TextStyle(
              fontSize: ScreenUtil().setSp(fontSize),
              fontWeight: fontWeight,
              color: textColor),
        ),
      ),
    );
  } //build()
}//CustomButton class