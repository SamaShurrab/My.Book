import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Custom Wedigt Design/custom_buttom.dart';
import '../Custom Wedigt Design/asset_image_widget.dart';
import '../Custom Wedigt Design/custom_text.dart';
import '../Values/colors.dart';
import '../Values/string.dart';

class WekcomePage extends StatelessWidget {
  const WekcomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: ScreenUtil().setHeight(15.h),
            ),
            Center(
              child: CustomText(
                  text: AppStrings.appName,
                  textAlign: TextAlign.center,
                  fontSize: 20,
                  textColor: Colors.black,
                  fontWeight: FontWeight.w700),
            ),
            SizedBox(
              height: ScreenUtil().setHeight(25.h),
            ),
            Center(
                child: Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(15.w)),
              child: AssetImageWidget(
                imagePath: 'images/welcome.png',
              ),
            )),
            SizedBox(
              height: ScreenUtil().setHeight(35.h),
            ),
            Padding(
              padding: EdgeInsets.only(left: ScreenUtil().setWidth(20.w)),
              child: CustomText(
                  text: AppStrings.welcomeText,
                  textAlign: TextAlign.start,
                  fontSize: 13,
                  textColor: Colors.black,
                  fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: ScreenUtil().setHeight(5.h),
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: ScreenUtil().setWidth(20.w),
                  right: ScreenUtil().setWidth(20.w)),
              child: CustomText(
                  text: AppStrings.welcomePageDescription,
                  textAlign: TextAlign.start,
                  height: 1.5,
                  fontSize: 10,
                  textColor: Colors.black,
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: ScreenUtil().setHeight(20.h),
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: ScreenUtil().setWidth(15.w),
                  right: ScreenUtil().setWidth(15.w)),
              child: CustomButton(
                routeName: "signin",
                buttonName: AppStrings.login,
                fontSize: 10,
                fontWeight: FontWeight.w600,
                textColor: Colors.black,
                textAlign: TextAlign.center,
                shapeBorder: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(ScreenUtil().radius(30.r)),
                    side: BorderSide(
                        color: Colors.black,
                        width: ScreenUtil().setWidth(1.w))),
                background: Colors.white,
                elevation: 0,
                width: double.infinity,
                height: 35,
              ),
            ),
            SizedBox(
              height: ScreenUtil().setHeight(10.h),
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: ScreenUtil().setWidth(15.w),
                  right: ScreenUtil().setWidth(15.w)),
              child: CustomButton(
                routeName: "register",
                buttonName: AppStrings.registeration,
                fontSize: 10,
                fontWeight: FontWeight.w600,
                textColor: Colors.white,
                textAlign: TextAlign.center,
                shapeBorder: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(ScreenUtil().radius(30.r)),
                ),
                background: AppColors.tahitiGold,
                elevation: 0,
                width: double.infinity,
                height: 35,
              ),
            ),
            SizedBox(
              height: ScreenUtil().setHeight(10.h),
            ),
          ],
        ),
      ),
    );
  } //build()
}//WekcomePage class