import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_book_app/Custom%20Wedigt%20Design/custom_image_asset.dart';
import 'package:my_book_app/Custom%20Wedigt%20Design/custom_text.dart';
import 'package:my_book_app/Values/string.dart';

class CustomSuccessfulDialog extends StatefulWidget {
  const CustomSuccessfulDialog({super.key});
  @override
  State<StatefulWidget> createState() {
    return CustomSuccessfulDialogState();
  } //createState()
} //CustomSuccessfulDialog class

class CustomSuccessfulDialogState extends State<CustomSuccessfulDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: ScreenUtil().setHeight(20),
          ),
          SizedBox(
              height: ScreenUtil().setHeight(200),
              child: CustomImage(imagePath: "images/successful.png")),
          SizedBox(height: ScreenUtil().setHeight(20)),
          CustomText(
              textData: AppStrings.congratulations,
              textAlign: TextAlign.center,
              fontSize: 16,
              textColor: Colors.black,
              fontWeight: FontWeight.w700),
          SizedBox(
            height: ScreenUtil().setHeight(5),
          ),
          Padding(
            padding:
                EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(10)),
            child: CustomText(
                textData: AppStrings.successfulMesaage,
                textAlign: TextAlign.center,
                fontSize: 12,
                textColor: Colors.black,
                fontWeight: FontWeight.w500),
          ),
          SizedBox(
            height: ScreenUtil().setHeight(20),
          ),
        ],
      ),
    );
  } //build()
} //CustomSuccessfulDialogState class
