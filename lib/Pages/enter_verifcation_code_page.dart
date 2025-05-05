import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_book_app/Custom%20Wedigt%20Design/custom_buttom.dart';
import 'package:my_book_app/Custom%20Wedigt%20Design/custom_image_svg.dart';
import 'package:my_book_app/Custom%20Wedigt%20Design/custom_text.dart';
import 'package:my_book_app/Custom%20Wedigt%20Design/custom_text_form_field.dart';
import 'package:my_book_app/Values/colors.dart';
import 'package:my_book_app/Values/string.dart';

import '../Custom Wedigt Design/custom_cliprpect_top.dart';

class EnterVerifcationCodePage extends StatefulWidget {
  final String emailAddres;
  final String pageName;
  const EnterVerifcationCodePage(
      {super.key, required this.emailAddres, required this.pageName});
  @override
  State<StatefulWidget> createState() {
    return EnterVerifcationCodePageState();
  } //createState()
} //EnterVerifcationCodePage class

class EnterVerifcationCodePageState extends State<EnterVerifcationCodePage> {
  // This line of code creates a List containing four TextEditingController items, each one assigned to a Text Field in the UI.
  final List<TextEditingController> _controllers =
      List.generate(4, (_) => TextEditingController());

  @override
  Widget build(BuildContext context) {
    // This widget has been used to change the status of the statusBar icons to light only for this interface and not for all interfaces.
    return AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.light,
        ),
        // This widget is used to make the upper edges of a circular screen.
        child: CustomClipRRectTop(
          child: Scaffold(
            backgroundColor: AppColors.tahitiGold,
            body: Column(
              children: [
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: CustomImageSvg(
                        height: 100,
                        width: 100,
                        imagePath: 'images/logo.svg',
                        imageColor: Colors.white),
                  ),
                ),
                Expanded(
                    flex: 7,
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: ScreenUtil().setWidth(20)),
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topRight:
                                  Radius.circular(ScreenUtil().radius(20)),
                              topLeft:
                                  Radius.circular(ScreenUtil().radius(20)))),
                      child: ListView(
                        physics: BouncingScrollPhysics(),
                        children: [
                          CustomText(
                              text: AppStrings.verify,
                              textAlign: TextAlign.start,
                              fontSize: 13,
                              textColor: Colors.black,
                              fontWeight: FontWeight.w700),
                          SizedBox(
                            height: ScreenUtil().setHeight(5.h),
                          ),
                          RichText(
                              textAlign: TextAlign.start,
                              text: TextSpan(children: [
                                TextSpan(
                                    text: AppStrings.otpDescription,
                                    style: TextStyle(
                                        fontFamily: "gilroy",
                                        fontSize: ScreenUtil().setSp(11.sp),
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500)),
                                TextSpan(
                                    text: widget.emailAddres,
                                    style: TextStyle(
                                        fontFamily: "gilroy",
                                        fontSize: ScreenUtil().setSp(11.sp),
                                        color: Colors.black,
                                        fontWeight: FontWeight.w700))
                              ])),
                          SizedBox(
                            height: ScreenUtil().setHeight(15.h),
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Row(
                                children: [
                                  for (int i = 0; i < 4; i++)
                                    Expanded(
                                      child: SizedBox(
                                        height: ScreenUtil().setHeight(50.h),
                                        child: Container(
                                          margin: EdgeInsets.only(
                                              left: ScreenUtil().setWidth(5.w)),
                                          child: CustomTextFormField(
                                            focusedErrorBorder:
                                                OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            ScreenUtil()
                                                                .radius(15.r)),
                                                    borderSide: BorderSide(
                                                        color: Colors.red,
                                                        width: ScreenUtil()
                                                            .setWidth(1.w))),
                                            errorBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        ScreenUtil()
                                                            .radius(15.r)),
                                                borderSide: BorderSide(
                                                    color: Colors.red,
                                                    width: ScreenUtil()
                                                        .setWidth(1.w))),
                                            bottom: 0.0,
                                            textAlignVertical:
                                                TextAlignVertical.center,
                                            controller: _controllers[i],
                                            textAlign: TextAlign.center,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w600,
                                            textColor: Colors.black,
                                            maxLength: 1,
                                            horizontal: 0,
                                            vertical: 18,
                                            textInputType: TextInputType.number,
                                            obscureText: false,
                                            focusedBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        ScreenUtil()
                                                            .radius(15.r)),
                                                borderSide: BorderSide(
                                                    color: AppColors.tahitiGold,
                                                    width: ScreenUtil()
                                                        .setWidth(1.w))),
                                            enabledBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        ScreenUtil()
                                                            .radius(15.r)),
                                                borderSide: BorderSide(
                                                    color: AppColors.snow,
                                                    width: ScreenUtil()
                                                        .setWidth(1.w))),
                                            textInputAction:
                                                TextInputAction.done,
                                            backgroung: AppColors.snow,
                                            iconSize: 0.0,
                                          ),
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                              SizedBox(
                                height: ScreenUtil().setHeight(50.h),
                              ),
                              CustomButton(
                                routeName: "resetPasswordPage",
                                /*
                                In this function, it checks if there are values ​​entered in the input fields.
                                 If they are empty, an error message will appear. 
                                 If not, it will be transferred to the password reset interface.
                              */
                                onPressed: () {
                                  bool allFilled = _controllers
                                      .every((c) => c.text.isNotEmpty);

                                  if (allFilled) {
                                    if (widget.pageName == "signin") {
                                      Navigator.pushReplacementNamed(
                                          context, "resetPasswordPage");
                                    }
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: CustomText(
                                            text: AppStrings.emptyOtp,
                                            textAlign: TextAlign.start,
                                            fontSize: ScreenUtil().setSp(7.sp),
                                            textColor: Colors.white,
                                            fontWeight: FontWeight.w600),
                                        backgroundColor: Colors.red,
                                      ),
                                    );
                                  }
                                },
                                buttonName: AppStrings.continueBtn,
                                fontSize: 10,
                                fontWeight: FontWeight.w700,
                                textColor: Colors.white,
                                textAlign: TextAlign.center,
                                shapeBorder: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      ScreenUtil().radius(30.r)),
                                ),
                                background: AppColors.tahitiGold,
                                elevation: 0,
                                width: double.infinity,
                                height: 35,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: ScreenUtil().setHeight(20.h),
                          ),
                        ],
                      ),
                    ))
              ],
            ),
          ),
        ));
  } //build()
}//EnterVerifcationCodePageState class