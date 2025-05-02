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
              height: ScreenUtil().setHeight(20),
            ),
            Center(
              child: CustomText(
                  text: AppStrings.appName,
                  textAlign: TextAlign.center,
                  fontSize: 25,
                  textColor: Colors.black,
                  fontWeight: FontWeight.w700),
            ),
            SizedBox(
              height: ScreenUtil().setHeight(30),
            ),
            Center(
                child: Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(15)),
              child: AssetImageWidget(
                imagePath: 'images/welcome.png',
              ),
            )),
            SizedBox(
              height: ScreenUtil().setHeight(40),
            ),
            Padding(
              padding: EdgeInsets.only(left: ScreenUtil().setWidth(30)),
              child: CustomText(
                  text: AppStrings.welcomeText,
                  textAlign: TextAlign.start,
                  fontSize: 15,
                  textColor: Colors.black,
                  fontWeight: FontWeight.w700),
            ),
            SizedBox(
              height: ScreenUtil().setHeight(10),
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: ScreenUtil().setWidth(30),
                  right: ScreenUtil().setWidth(30)),
              child: CustomText(
                  text: AppStrings.welcomePageDescription,
                  textAlign: TextAlign.start,
                  height: 1.5,
                  fontSize: 12,
                  textColor: Colors.black,
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: ScreenUtil().setHeight(20),
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: ScreenUtil().setWidth(15),
                  right: ScreenUtil().setWidth(15)),
              child: CustomButton(
                routeName: "signin",
                buttonName: AppStrings.login,
                fontSize: 14,
                fontWeight: FontWeight.w700,
                textColor: Colors.black,
                textAlign: TextAlign.center,
                shapeBorder: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(ScreenUtil().radius(30)),
                    side: BorderSide(
                        color: Colors.black, width: ScreenUtil().setWidth(1))),
                background: Colors.white,
                elevation: 0,
                width: double.infinity,
                height: 50,
              ),
            ),
            SizedBox(
              height: ScreenUtil().setHeight(10),
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: ScreenUtil().setWidth(15),
                  right: ScreenUtil().setWidth(15)),
              child: CustomButton(
                routeName: "register",
                buttonName: AppStrings.registeration,
                fontSize: 14,
                fontWeight: FontWeight.w700,
                textColor: Colors.white,
                textAlign: TextAlign.center,
                shapeBorder: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(ScreenUtil().radius(30)),
                ),
                background: AppColors.tahitiGold,
                elevation: 0,
                width: double.infinity,
                height: 50,
              ),
            ),
            SizedBox(
              height: ScreenUtil().setHeight(10),
            ),
          ],
        ),
      ),
    );
  } //build()
}//WekcomePage class