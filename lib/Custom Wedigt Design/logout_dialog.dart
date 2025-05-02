import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_book_app/Custom%20Wedigt%20Design/custom_buttom.dart';
import 'package:my_book_app/Custom%20Wedigt%20Design/custom_text.dart';
import 'package:my_book_app/Values/colors.dart';
import 'package:my_book_app/Values/string.dart';

// This class is for designing a dialog for logging out of the application.
class LogoutDialog {
  static Future<void> show(BuildContext context) {
    return showDialog<bool>(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          icon: Icon(
            Icons.logout_outlined,
            size: 30,
            color: AppColors.tahitiGold,
          ),
          title: CustomText(
              text: AppStrings.logout,
              textAlign: TextAlign.center,
              fontSize: 16,
              textColor: Colors.black,
              fontWeight: FontWeight.w700),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomText(
                  text: AppStrings.logoutDescription,
                  textAlign: TextAlign.center,
                  fontSize: 12,
                  textColor: Colors.black,
                  fontWeight: FontWeight.w600),
              SizedBox(height: 10),
              CustomButton(
                routeName: "signin",
                buttonName: AppStrings.logout,
                fontSize: 13,
                fontWeight: FontWeight.w700,
                textColor: Colors.white,
                textAlign: TextAlign.center,
                shapeBorder: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                  side: BorderSide(color: AppColors.tahitiGold, width: 1),
                ),
                elevation: 0,
                background: AppColors.tahitiGold,
                height: 40,
                width: double.infinity,
              ),
              SizedBox(height: 10),
              CustomButton(
                routeName: "",
                buttonName: AppStrings.cancel,
                fontSize: 13,
                fontWeight: FontWeight.w700,
                textColor: Colors.black,
                textAlign: TextAlign.center,
                shapeBorder: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.r),
                  side: BorderSide(color: AppColors.tahitiGold, width: 1),
                ),
                elevation: 0,
                background: Colors.white,
                height: 40,
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
