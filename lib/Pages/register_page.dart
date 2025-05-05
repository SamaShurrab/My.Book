import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_book_app/Custom%20Wedigt%20Design/form_submit_button.dart';
import 'package:my_book_app/Custom%20Wedigt%20Design/custom_cliprpect_top.dart';
import 'package:my_book_app/Custom%20Wedigt%20Design/custom_image_svg.dart';
import 'package:my_book_app/Custom%20Wedigt%20Design/custom_text.dart';
import 'package:my_book_app/Custom%20Wedigt%20Design/custom_text_form_field.dart';
import 'package:my_book_app/Pages/enter_verifcation_code_page.dart';
import 'package:my_book_app/Pages/terms_and_conditions_page.dart';
import 'package:my_book_app/Values/colors.dart';
import 'package:my_book_app/Values/string.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});
  @override
  State<StatefulWidget> createState() {
    return RegisterPageState();
  } //createState()
} //SigninPage class

class RegisterPageState extends State<RegisterPage> {
  // formKey was used to check the value entered by the user whether they match the conditions or not
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  /* 
    The controller has been used to access the value of the value of the email entered by the user in his TextFormField,
    And through it, it is verified whether the entry email meets the conditions or not
  */
  TextEditingController emailController = TextEditingController();

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
                child: CustomImageSvg(
                    height: 100,
                    width: 100,
                    imagePath: 'images/logo.svg',
                    imageColor: Colors.white),
              ),
              Expanded(
                  flex: 7,
                  child: Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: ScreenUtil().setWidth(15.w)),
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topRight:
                                Radius.circular(ScreenUtil().radius(20.r)),
                            topLeft:
                                Radius.circular(ScreenUtil().radius(20.r)))),
                    child: ListView(
                      children: [
                        CustomText(
                            text: AppStrings.register,
                            textAlign: TextAlign.start,
                            fontSize: 13,
                            textColor: Colors.black,
                            fontWeight: FontWeight.w700),
                        SizedBox(
                          height: ScreenUtil().setHeight(5.h),
                        ),
                        CustomText(
                            text: AppStrings.registerPageDescription,
                            textAlign: TextAlign.start,
                            fontSize: 10,
                            textColor: Colors.black,
                            fontWeight: FontWeight.w500),
                        SizedBox(
                          height: ScreenUtil().setHeight(15.h),
                        ),
                        Form(
                          key: formKey,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomTextFormField(
                                bottom: 8.0,
                                textAlignVertical: TextAlignVertical.center,
                                textAlign: TextAlign.start,
                                fontSize: 10,
                                fontWeight: FontWeight.w600,
                                textColor: Colors.black,
                                horizontal: 20.0,
                                vertical: 12.0,
                                errorFontSize: 11.0,
                                errorTextColor: Colors.red,
                                focusedErrorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(
                                        ScreenUtil().radius(30.r)),
                                    borderSide: BorderSide(
                                        color: Colors.red,
                                        width: ScreenUtil().setWidth(1.w))),
                                errorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(
                                        ScreenUtil().radius(30.r)),
                                    borderSide: BorderSide(
                                        color: Colors.red,
                                        width: ScreenUtil().setWidth(1.w))),
                                textInputAction: TextInputAction.next,
                                iconSize: 25.0,
                                textInputType: TextInputType.text,
                                obscureText: false,
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(
                                        ScreenUtil().radius(30.r)),
                                    borderSide: BorderSide(
                                        color: AppColors.tahitiGold,
                                        width: ScreenUtil().setWidth(1.w))),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(
                                        ScreenUtil().radius(30.r)),
                                    borderSide: BorderSide(
                                        color: AppColors.snow,
                                        width: ScreenUtil().setWidth(1.w))),
                                hintText: AppStrings.userName,
                                textColorHint: AppColors.hintTextColor,
                                fontSizeHint: 14.0,
                                fontWeightHint: FontWeight.w600,
                                backgroung: AppColors.snow,
                                suffixIconColor: AppColors.tahitiGold,
                                suffixIcon: Icons.person_outline_rounded,
                              ),
                              SizedBox(
                                height: ScreenUtil().setHeight(10.h),
                              ),
                              CustomTextFormField(
                                bottom: 8.0,
                                textAlignVertical: TextAlignVertical.center,
                                textAlign: TextAlign.start,
                                controller: emailController,
                                fontSize: 10,
                                fontWeight: FontWeight.w600,
                                textColor: Colors.black,
                                horizontal: 20.0,
                                vertical: 12.0,
                                errorFontSize: 10.5,
                                errorTextColor: Colors.red,
                                focusedErrorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(
                                        ScreenUtil().radius(30.r)),
                                    borderSide: BorderSide(
                                        color: Colors.red,
                                        width: ScreenUtil().setWidth(1.w))),
                                errorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(
                                        ScreenUtil().radius(30.r)),
                                    borderSide: BorderSide(
                                        color: Colors.red,
                                        width: ScreenUtil().setWidth(1.w))),
                                textInputAction: TextInputAction.next,
                                iconSize: 25.0,
                                textInputType: TextInputType.emailAddress,
                                obscureText: false,
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(
                                        ScreenUtil().radius(30.r)),
                                    borderSide: BorderSide(
                                        color: AppColors.tahitiGold,
                                        width: ScreenUtil().setWidth(1.w))),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(
                                        ScreenUtil().radius(30.r)),
                                    borderSide: BorderSide(
                                        color: AppColors.snow,
                                        width: ScreenUtil().setWidth(1.w))),
                                hintText: AppStrings.emailAddress,
                                textColorHint: AppColors.hintTextColor,
                                fontSizeHint: 14.0,
                                fontWeightHint: FontWeight.w600,
                                backgroung: AppColors.snow,
                                suffixIconColor: AppColors.tahitiGold,
                                suffixIcon: Icons.email_outlined,
                              ),
                              SizedBox(
                                height: ScreenUtil().setHeight(10.h),
                              ),
                              CustomTextFormField(
                                bottom: 8.0,
                                textAlignVertical: TextAlignVertical.center,
                                textAlign: TextAlign.start,
                                fontSize: 10,
                                fontWeight: FontWeight.w600,
                                textColor: Colors.black,
                                horizontal: 20.0,
                                vertical: 12.0,
                                errorFontSize: 11.0,
                                errorTextColor: Colors.red,
                                focusedErrorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(
                                        ScreenUtil().radius(30.r)),
                                    borderSide: BorderSide(
                                        color: Colors.red,
                                        width: ScreenUtil().setWidth(1.w))),
                                errorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(
                                        ScreenUtil().radius(30.r)),
                                    borderSide: BorderSide(
                                        color: Colors.red,
                                        width: ScreenUtil().setWidth(1.w))),
                                textInputAction: TextInputAction.next,
                                iconSize: 25.0,
                                textInputType: TextInputType.number,
                                obscureText: false,
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(
                                        ScreenUtil().radius(30.r)),
                                    borderSide: BorderSide(
                                        color: AppColors.tahitiGold,
                                        width: ScreenUtil().setWidth(1.w))),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(
                                        ScreenUtil().radius(30.r)),
                                    borderSide: BorderSide(
                                        color: AppColors.snow,
                                        width: ScreenUtil().setWidth(1.w))),
                                hintText: AppStrings.phoneNmeber,
                                textColorHint: AppColors.hintTextColor,
                                fontSizeHint: 14.0,
                                fontWeightHint: FontWeight.w600,
                                backgroung: AppColors.snow,
                                suffixIconColor: AppColors.tahitiGold,
                                suffixIcon: Icons.phone_outlined,
                              ),
                              SizedBox(
                                height: ScreenUtil().setHeight(15.h),
                              ),
                              CustomTextFormField(
                                bottom: 8.0,
                                textAlignVertical: TextAlignVertical.center,
                                textAlign: TextAlign.start,
                                fontSize: 10,
                                fontWeight: FontWeight.w600,
                                textColor: Colors.black,
                                horizontal: 20.0,
                                vertical: 12.0,
                                errorFontSize: 11.0,
                                errorTextColor: Colors.red,
                                focusedErrorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(
                                        ScreenUtil().radius(30.r)),
                                    borderSide: BorderSide(
                                        color: Colors.red,
                                        width: ScreenUtil().setWidth(1.w))),
                                errorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(
                                        ScreenUtil().radius(30.r)),
                                    borderSide: BorderSide(
                                        color: Colors.red,
                                        width: ScreenUtil().setWidth(1.w))),
                                textInputAction: TextInputAction.done,
                                iconSize: 25.0,
                                textInputType: TextInputType.number,
                                obscureText: true,
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(
                                        ScreenUtil().radius(30.r)),
                                    borderSide: BorderSide(
                                        color: AppColors.tahitiGold,
                                        width: ScreenUtil().setWidth(1.w))),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(
                                        ScreenUtil().radius(30.r)),
                                    borderSide: BorderSide(
                                        color: AppColors.snow,
                                        width: ScreenUtil().setWidth(1.w))),
                                hintText: AppStrings.password,
                                textColorHint: AppColors.hintTextColor,
                                fontSizeHint: 14.0,
                                fontWeightHint: FontWeight.w600,
                                backgroung: AppColors.snow,
                                suffixIcon: Icon(Icons.visibility_off_outlined),
                                suffixIconColor: AppColors.tahitiGold,
                              ),
                              SizedBox(
                                height: ScreenUtil().setHeight(10.h),
                              ),
                              CustomText(
                                  text: AppStrings.confirmAgree,
                                  textAlign: TextAlign.start,
                                  fontSize: 10,
                                  textColor: Colors.black,
                                  fontWeight: FontWeight.w600),
                              Padding(
                                padding: EdgeInsets.only(
                                    top: ScreenUtil().setHeight(5.h)),
                                child: InkWell(
                                  onTap: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            TermsAndConditionsPage(
                                          routeName: "register",
                                        ),
                                      ),
                                    );
                                  },
                                  child: CustomText(
                                      text: AppStrings.termsAndConditions,
                                      textAlign: TextAlign.start,
                                      fontSize: 10,
                                      textColor: AppColors.tahitiGold,
                                      fontWeight: FontWeight.w700),
                                ),
                              ),
                              SizedBox(
                                height: ScreenUtil().setHeight(40.h),
                              ),
                              FormSubmitButton(
                                onPressed: () {
                                  setState(() {
                                    if (formKey.currentState != null &&
                                        formKey.currentState!.validate()) {
                                      formKey.currentState!.save();
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  EnterVerifcationCodePage(
                                                    emailAddres:
                                                        emailController.text,
                                                    pageName: "register",
                                                  )));
                                    }
                                  });
                                },
                                formKey: formKey,
                                buttonName: AppStrings.continueBtn,
                                fontSize: 10,
                                fontWeight: FontWeight.w600,
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
                        ),
                        SizedBox(
                          height: ScreenUtil().setHeight(10),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomText(
                                text: AppStrings.alreadyUser,
                                textAlign: TextAlign.end,
                                fontSize: 10,
                                textColor: Colors.black,
                                fontWeight: FontWeight.w500),
                            SizedBox(
                              width: ScreenUtil().setWidth(3.w),
                            ),
                            InkWell(
                                onTap: () {
                                  Navigator.of(context).pushNamed("signin");
                                },
                                child: CustomText(
                                    text: AppStrings.signIn,
                                    textAlign: TextAlign.end,
                                    fontSize: 10,
                                    textColor: AppColors.tahitiGold,
                                    fontWeight: FontWeight.w700)),
                          ],
                        ),
                        SizedBox(
                          height: ScreenUtil().setHeight(15.h),
                        ),
                      ],
                    ),
                  ))
            ],
          ),
        )));
  } //build()
}//SigninPageState class