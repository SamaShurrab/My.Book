import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_book_app/Custom%20Wedigt%20Design/create_route.dart';
import 'package:my_book_app/Custom%20Wedigt%20Design/form_submit_button.dart';
import 'package:my_book_app/Custom%20Wedigt%20Design/custom_text_form_field.dart';
import 'package:my_book_app/Pages/profile_page.dart';

import '../Custom Wedigt Design/custom_text.dart';
import '../Values/colors.dart';
import '../Values/string.dart';

class ReportBugPage extends StatefulWidget {
  const ReportBugPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return ReportBugPageState();
  }
} //ReportBugPage class

class ReportBugPageState extends State<ReportBugPage> {
  // formKey was used to check the value entered by the user whether they match the conditions or not
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: InkWell(
            splashColor: Colors.transparent,
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Icon(
              Icons.arrow_back_ios_new,
              size: 25,
              color: Colors.black,
            )),
        title: CustomText(
            text: AppStrings.reportBug,
            textAlign: TextAlign.center,
            fontSize: 13,
            textColor: Colors.black,
            fontWeight: FontWeight.w700),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(
            horizontal: ScreenUtil().setWidth(15.w),
            vertical: ScreenUtil().setHeight(8.h)),
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            CustomText(
                text: AppStrings.reportDescription,
                textAlign: TextAlign.center,
                fontSize: 10,
                textColor: Colors.black,
                fontWeight: FontWeight.w600),
            SizedBox(
              height: ScreenUtil().setHeight(15.h),
            ),
            Form(
                key: formKey,
                child: Column(
                  children: [
                    CustomTextFormField(
                      bottom: 10,
                      textAlignVertical: TextAlignVertical.top,
                      textInputType: TextInputType.multiline,
                      obscureText: false,
                      enabledBorder: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(ScreenUtil().radius(25.r)),
                          borderSide: BorderSide(
                              color: AppColors.snow,
                              width: ScreenUtil().setWidth(1.w))),
                      focusedBorder: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(ScreenUtil().radius(25.r)),
                          borderSide: BorderSide(
                              color: AppColors.snow,
                              width: ScreenUtil().setWidth(1.w))),
                      textInputAction: TextInputAction.newline,
                      backgroung: AppColors.snow,
                      vertical: 15,
                      horizontal: 15,
                      fontSize: 10,
                      fontWeight: FontWeight.w600,
                      textColor: Colors.black,
                      textAlign: TextAlign.start,
                      hintText: AppStrings.writeHereHint,
                      fontSizeHint: 14.0,
                      fontWeightHint: FontWeight.w600,
                      textColorHint: AppColors.hintTextColor,
                      errorBorder: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(ScreenUtil().radius(25.r)),
                          borderSide: BorderSide(
                              color: Colors.red,
                              width: ScreenUtil().setWidth(1.w))),
                      focusedErrorBorder: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(ScreenUtil().radius(25.r)),
                          borderSide: BorderSide(
                              color: Colors.red,
                              width: ScreenUtil().setWidth(1.w))),
                      errorFontSize: 13.0,
                      errorTextColor: Colors.red,
                      maxLines: 4,
                    ),
                    SizedBox(
                      height: ScreenUtil().setHeight(20.h),
                    ),
                    FormSubmitButton(
                      formKey: formKey,
                      buttonName: AppStrings.send,
                      onPressed: () {
                        setState(() {
                          if (formKey.currentState != null &&
                              formKey.currentState!.validate()) {
                            //Save data upon successful verification
                            formKey.currentState!.save();
                            FocusScope.of(context).unfocus();
                            Navigator.of(context)
                                .push(createRoute(ProfilePage()));
                          }
                        });
                      },
                      fontSize: 10,
                      fontWeight: FontWeight.w600,
                      textColor: Colors.white,
                      textAlign: TextAlign.center,
                      shapeBorder: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(ScreenUtil().radius(30)),
                      ),
                      background: AppColors.tahitiGold,
                      elevation: 0,
                      width: double.infinity,
                      height: 35,
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }
}//ReportBugPageState class