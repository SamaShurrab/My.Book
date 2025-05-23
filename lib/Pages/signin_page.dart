import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_book_app/Custom%20Wedigt%20Design/custom_cliprpect_top.dart';

import '../Custom Wedigt Design/form_submit_button.dart';
import '../Custom Wedigt Design/custom_image_svg.dart';
import '../Custom Wedigt Design/custom_text.dart';
import '../Custom Wedigt Design/custom_text_form_field.dart';
import '../Values/colors.dart';
import '../Values/string.dart';
import 'enter_verifcation_code_page.dart';

class SigninPage extends StatefulWidget {
  const SigninPage({super.key});
  @override
  State<StatefulWidget> createState() {
    return SigninPageState();
  } //createState()
} //SigninPage class

class SigninPageState extends State<SigninPage> {
  // formKey was used to check the value entered by the user whether they match the conditions or not
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  /* 
    The controller has been used to access the value of the value of the email entered by the user in his TextFormField,
    And through it, it is verified whether the entry email meets the conditions or not
  */
  final TextEditingController emailController = TextEditingController();
  // Through this variable, the error message is stored, which will appear to the user.
  String? emailErrorMessage;
  // This variable is stored in the correct email that the user must enter
  final RegExp emailRegex =
      RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$");

  /* 
    This function checks the email whether it matches the terms or not,
    and it shows an error message depending on the type error,
    And if the mailing email meets the terms, it will go to the EnterVerifcationCodePage
  */
  void validateEmailForForgetPasswor() {
    String email = emailController.text.trim();
    if (email.isEmpty) {
      setState(() {
        emailErrorMessage = AppStrings.emailAddressEmpty;
      });
      return;
    }
    if (!emailRegex.hasMatch(email)) {
      setState(() {
        emailErrorMessage = AppStrings.emailAddressRegx;
      });
      return;
    }
    setState(() {
      emailErrorMessage = null;
    });
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => EnterVerifcationCodePage(
          emailAddres: email,
          pageName: "signin",
        ),
      ),
    );
  } //validateEmailForForgetPasswor()

//This function frees up memory and resources used by the controller and improves application performance.
  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
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
            child: PopScope(
          canPop: false,
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
                          horizontal: ScreenUtil().setWidth(20.w)),
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
                              text: AppStrings.signIn,
                              textAlign: TextAlign.start,
                              fontSize: 13,
                              textColor: Colors.black,
                              fontWeight: FontWeight.w700),
                          SizedBox(
                            height: ScreenUtil().setHeight(5.h),
                          ),
                          CustomText(
                              text: AppStrings.signUpPageDescription,
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
                                  textAlign: TextAlign.start,
                                  fontSize: 10,
                                  fontWeight: FontWeight.w600,
                                  textColor: Colors.black,
                                  horizontal: 20.0,
                                  vertical: 12.0,
                                  errorEmailMessage: emailErrorMessage,
                                  controller: emailController,
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
                                  suffixIcon: Icons.visibility_off_outlined,
                                  suffixIconColor: AppColors.tahitiGold,
                                ),
                                SizedBox(
                                  height: ScreenUtil().setHeight(10.h),
                                ),
                                Container(
                                  margin: EdgeInsets.only(
                                      bottom: ScreenUtil().setHeight(100.h)),
                                  alignment: Alignment.bottomRight,
                                  child: InkWell(
                                    onTap: validateEmailForForgetPasswor,
                                    child: CustomText(
                                        text: AppStrings.forgrtPassword,
                                        textAlign: TextAlign.end,
                                        fontSize: 10,
                                        textColor: AppColors.tahitiGold,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                                FormSubmitButton(
                                  formKey: formKey,
                                  onPressed: () {
                                    setState(() {
                                      if (formKey.currentState != null &&
                                          formKey.currentState!.validate()) {
                                        //Save data upon successful verification
                                        formKey.currentState!.save();
                                        Navigator.of(context)
                                            .pushReplacementNamed(
                                                "chooseInterest");
                                      }
                                    });
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
                            height: ScreenUtil().setHeight(15.h),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustomText(
                                  text: AppStrings.newUser,
                                  textAlign: TextAlign.end,
                                  fontSize: 10,
                                  textColor: Colors.black,
                                  fontWeight: FontWeight.w500),
                              SizedBox(
                                width: ScreenUtil().setWidth(2),
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.of(context).pushNamed("register");
                                },
                                child: CustomText(
                                    text: AppStrings.register,
                                    textAlign: TextAlign.end,
                                    fontSize: 10,
                                    textColor: AppColors.tahitiGold,
                                    fontWeight: FontWeight.w700),
                              )
                            ],
                          ),
                          SizedBox(
                            height: ScreenUtil().setHeight(10.h),
                          ),
                        ],
                      ),
                    ))
              ],
            ),
          ),
        )));
  } //build()
}//SigninPageState class