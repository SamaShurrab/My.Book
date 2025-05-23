import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_book_app/Custom%20Wedigt%20Design/custom_cliprpect_top.dart';
import 'package:my_book_app/Custom%20Wedigt%20Design/custom_successful_dialog.dart';
import 'package:my_book_app/Custom%20Wedigt%20Design/custom_text_form_field.dart';
import '../Custom Wedigt Design/form_submit_button.dart';
import '../Custom Wedigt Design/custom_image_svg.dart';
import '../Custom Wedigt Design/custom_text.dart';
import '../Values/colors.dart';
import '../Values/string.dart';

class ResetPasswordPage extends StatefulWidget {
  const ResetPasswordPage({super.key});
  @override
  State<StatefulWidget> createState() {
    return ResetPasswordPageState();
  } //createState()
} //ResetPasswordPage class

class ResetPasswordPageState extends State<ResetPasswordPage> {
  /* 
    The controller has been used to access the value of the value of the new & confirm password entered by the user in his TextFormField,
    And through it, it is verified whether the entry email meets the conditions or not,
    It also extracts the value of the password that the user wrote in the input field.
  */
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  //Here the value of the passwords that the user has entered in the input field is stored by using controller.
  String? newPassword;
  String? confirmPassword;

  // formKey was used to check the value entered by the user whether they match the conditions or not
  GlobalKey<FormState> formKey = GlobalKey();

// This function frees up memory and resources used by the controller and improves application performance.
  @override
  void dispose() {
    super.dispose();
    newPasswordController.dispose();
    confirmPasswordController.dispose();
  }

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
                        horizontal: ScreenUtil().setWidth(15.w)),
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topRight:
                                Radius.circular(ScreenUtil().radius(10.r)),
                            topLeft:
                                Radius.circular(ScreenUtil().radius(10.r)))),
                    child: ListView(
                      physics: BouncingScrollPhysics(),
                      children: [
                        CustomText(
                            text: AppStrings.resetPassword,
                            textAlign: TextAlign.start,
                            fontSize: 13,
                            textColor: Colors.black,
                            fontWeight: FontWeight.w700),
                        SizedBox(
                          height: ScreenUtil().setHeight(5.h),
                        ),
                        CustomText(
                            text: AppStrings.resetPasswordDescription,
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
                            children: [
                              CustomTextFormField(
                                bottom: 8.0,
                                textAlignVertical: TextAlignVertical.center,
                                controller: newPasswordController,
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
                                hintText: AppStrings.newPassword,
                                textColorHint: AppColors.hintTextColor,
                                fontSizeHint: 14.0,
                                fontWeightHint: FontWeight.w600,
                                backgroung: AppColors.snow,
                                suffixIcon: Icons.visibility_off_outlined,
                                suffixIconColor: AppColors.tahitiGold,
                              ),
                              SizedBox(
                                height: ScreenUtil().setHeight(10.h),
                              ),
                              CustomTextFormField(
                                bottom: 8.0,
                                textAlignVertical: TextAlignVertical.center,
                                controller: confirmPasswordController,
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
                                hintText: AppStrings.confirmPassword,
                                textColorHint: AppColors.hintTextColor,
                                fontSizeHint: 14.0,
                                fontWeightHint: FontWeight.w600,
                                backgroung: AppColors.snow,
                                suffixIcon: Icons.visibility_off_outlined,
                                suffixIconColor: AppColors.tahitiGold,
                              ),
                              SizedBox(
                                height: ScreenUtil().setHeight(20.h),
                              ),
                              FormSubmitButton(
                                formKey: formKey,
                                /*
                                  This function checks whether the two passwords are similar or not. 
                                  If they are similar, a dialog will appear, then it will move to the sigin page. 
                                  If they are not similar, a snackBar will appear and an error message will appear.
                                  */
                                onPressed: () async {
                                  // Lock the keyboard when pressing the button before the dialog appears
                                  FocusScope.of(context).unfocus();

                                  // Slight delay to ensure keyboard is closed
                                  await Future.delayed(
                                      const Duration(milliseconds: 100));
                                  String newPassowrd =
                                      newPasswordController.text;
                                  String confirmPassword =
                                      confirmPasswordController.text;

                                  if (formKey.currentState == null ||
                                      !formKey.currentState!.validate()) {
                                    return;
                                  }
                                  // To show dialog when the operation is successful
                                  if (newPassowrd == confirmPassword) {
                                    showDialog(
                                        barrierDismissible: true,
                                        // ignore: use_build_context_synchronously
                                        context: context,
                                        builder: (dialogContext) {
                                          // The dialog will move after 5 seconds to the signin page.
                                          Timer(const Duration(seconds: 4), () {
                                            //To close the dialog
                                            Navigator.pop(dialogContext);

                                            // After closing the dialog, you will be taken directly to the signin page.
                                            Navigator.pushReplacementNamed(
                                                context, "signin");
                                          });

                                          return CustomSuccessfulDialog();
                                        });
                                  } else {
                                    if (!mounted) return;
                                    // ignore: use_build_context_synchronously
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(SnackBar(
                                      content: CustomText(
                                          text: AppStrings.notSimialr,
                                          textAlign: TextAlign.start,
                                          fontSize: 10,
                                          textColor: Colors.white,
                                          fontWeight: FontWeight.w600),
                                      backgroundColor: Colors.red,
                                    ));
                                  }
                                },
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
                          height: ScreenUtil().setHeight(20.h),
                        ),
                      ],
                    ),
                  ))
            ],
          ),
        )));
  } //build()
}//ResetPasswordPageState()