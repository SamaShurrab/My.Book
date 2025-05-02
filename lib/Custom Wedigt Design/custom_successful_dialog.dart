import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_book_app/Custom%20Wedigt%20Design/asset_image_widget.dart';
import 'package:my_book_app/Custom%20Wedigt%20Design/custom_text.dart';
import 'package:my_book_app/Values/string.dart';

// This class is used to design a dialog in case of successful password change.

class CustomSuccessfulDialog extends StatelessWidget {
  const CustomSuccessfulDialog({super.key});

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
              child: AssetImageWidget(imagePath: "images/successful.png")),
          SizedBox(height: ScreenUtil().setHeight(20)),
          CustomText(
              text: AppStrings.congratulations,
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
                text: AppStrings.successfulMesaage,
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
} //CustomSuccessfulDialog class
