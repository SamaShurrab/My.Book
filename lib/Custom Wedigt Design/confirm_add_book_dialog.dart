import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_book_app/Custom%20Wedigt%20Design/asset_image_widget.dart';
import 'package:my_book_app/Custom%20Wedigt%20Design/custom_buttom.dart';
import 'package:my_book_app/Custom%20Wedigt%20Design/custom_text.dart';
import 'package:my_book_app/Values/colors.dart';
import 'package:my_book_app/Values/string.dart';

class ConfirmAddBookDialog extends StatelessWidget {
  const ConfirmAddBookDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        backgroundColor: Colors.white,
        content: Container(
          margin: EdgeInsets.all(10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              AssetImageWidget(
                imagePath: "images/success_buy_dialog.png",
                width: 200,
                height: 200,
              ),
              SizedBox(
                height: ScreenUtil().setHeight(20.h),
              ),
              CustomText(
                  text: AppStrings.addDone,
                  textAlign: TextAlign.center,
                  fontSize: 13,
                  textColor: Colors.black,
                  fontWeight: FontWeight.w700),
              SizedBox(
                height: ScreenUtil().setHeight(10.h),
              ),
              CustomButton(
                  routeName: "shoppingCart",
                  buttonName: AppStrings.viewOrder,
                  fontSize: 10,
                  fontWeight: FontWeight.w700,
                  textColor: Colors.white,
                  textAlign: TextAlign.center,
                  shapeBorder: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(ScreenUtil().radius(30)),
                  ),
                  elevation: 0,
                  background: AppColors.tahitiGold,
                  height: 35,
                  width: double.infinity),
              SizedBox(
                height: ScreenUtil().setHeight(10.h),
              ),
              CustomButton(
                  routeName: "home",
                  buttonName: AppStrings.continueShopping,
                  fontSize: 10,
                  fontWeight: FontWeight.w700,
                  textColor: Colors.black,
                  textAlign: TextAlign.center,
                  shapeBorder: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(ScreenUtil().radius(30)),
                      side: BorderSide(
                          color: AppColors.tahitiGold,
                          width: ScreenUtil().setWidth(1.w))),
                  elevation: 0,
                  background: Colors.white,
                  height: 35,
                  width: double.infinity)
            ],
          ),
        ));
  } //build()
}//ConfirmAddBookDialog class