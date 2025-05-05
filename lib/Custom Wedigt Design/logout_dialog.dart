import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_book_app/Custom%20Wedigt%20Design/custom_buttom.dart';
import 'package:my_book_app/Custom%20Wedigt%20Design/custom_text.dart';
import 'package:my_book_app/Values/colors.dart';
import 'package:my_book_app/Values/string.dart';

// This class is for designing a dialog for logging out of the application.
class LogoutDialog {
  static Future<void> show(BuildContext context) {
    return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          icon: Icon(
            Icons.logout_outlined,
            size: 35,
            color: AppColors.tahitiGold,
          ),
          title: CustomText(
              text: AppStrings.logout,
              textAlign: TextAlign.center,
              fontSize: 14,
              textColor: Colors.black,
              fontWeight: FontWeight.w700),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomText(
                  text: AppStrings.logoutDescription,
                  textAlign: TextAlign.center,
                  fontSize: 10,
                  textColor: Colors.black,
                  fontWeight: FontWeight.w600),
              SizedBox(height: ScreenUtil().setHeight(10.h)),
              CustomButton(
                routeName: "signin",
                buttonName: AppStrings.logout,
                fontSize: 10,
                fontWeight: FontWeight.w700,
                textColor: Colors.white,
                textAlign: TextAlign.center,
                shapeBorder: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.r),
                  side: BorderSide(
                      color: AppColors.tahitiGold,
                      width: ScreenUtil().setWidth(1.w)),
                ),
                elevation: 0,
                background: AppColors.tahitiGold,
                height: 35,
                width: double.infinity,
              ),
              SizedBox(height: ScreenUtil().setHeight(10.h)),
              CustomButton(
                routeName: "",
                buttonName: AppStrings.cancel,
                fontSize: 10,
                fontWeight: FontWeight.w700,
                textColor: Colors.black,
                textAlign: TextAlign.center,
                shapeBorder: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.r),
                  side: BorderSide(
                      color: AppColors.tahitiGold,
                      width: ScreenUtil().setWidth(1.w)),
                ),
                elevation: 0,
                background: Colors.white,
                height: 35,
                width: double.infinity,
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      },
    );
  } //show()
} //LogoutDialog class
