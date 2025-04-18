import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_book_app/Custom%20Wedigt%20Design/custom_buttom_form.dart';
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
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(ScreenUtil().radius(20)),
          topRight: Radius.circular(ScreenUtil().radius(20)),
        ),
        child: Scaffold(
          backgroundColor: AppColors.tahitiGold,
          body: Column(
            children: [
              Expanded(
                flex: 2,
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: CustomImageSvg(
                      height: 110,
                      width: 110,
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
                            topRight: Radius.circular(ScreenUtil().radius(20)),
                            topLeft: Radius.circular(ScreenUtil().radius(20)))),
                    child: ListView(
                      physics: BouncingScrollPhysics(),
                      children: [
                        CustomText(
                            textData: AppStrings.register,
                            textAlign: TextAlign.start,
                            fontSize: 16,
                            textColor: Colors.black,
                            fontWeight: FontWeight.w700),
                        SizedBox(
                          height: ScreenUtil().setHeight(8),
                        ),
                        CustomText(
                            textData: AppStrings.registerPageDescription,
                            textAlign: TextAlign.start,
                            fontSize: 12,
                            textColor: Colors.black,
                            fontWeight: FontWeight.w500),
                        SizedBox(
                          height: ScreenUtil().setHeight(20),
                        ),
                        Form(
                          key: formKey,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomTextFormField(
                                bottom: 12.0,
                                textAlignVertical: TextAlignVertical.center,
                                textAlign: TextAlign.start,
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                textColor: Colors.black,
                                horizontal: 20.0,
                                vertical: 12.0,
                                errorFontSize: 11.0,
                                errorTextColor: Colors.red,
                                focusedErrorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(
                                        ScreenUtil().radius(30)),
                                    borderSide: BorderSide(
                                        color: Colors.red,
                                        width: ScreenUtil().setWidth(1))),
                                errorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(
                                        ScreenUtil().radius(30)),
                                    borderSide: BorderSide(
                                        color: Colors.red,
                                        width: ScreenUtil().setWidth(1))),
                                textInputAction: TextInputAction.next,
                                iconSize: 25.0,
                                textInputType: TextInputType.text,
                                obscureText: false,
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(
                                        ScreenUtil().radius(30)),
                                    borderSide: BorderSide(
                                        color: AppColors.snow,
                                        width: ScreenUtil().setWidth(1))),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(
                                        ScreenUtil().radius(30)),
                                    borderSide: BorderSide(
                                        color: AppColors.snow,
                                        width: ScreenUtil().setWidth(1))),
                                hintText: AppStrings.userName,
                                textColorHint: AppColors.hintTextColor,
                                fontSizeHint: 14.0,
                                fontWeightHint: FontWeight.w600,
                                backgroung: AppColors.snow,
                                suffixIconColor: AppColors.tahitiGold,
                                suffixIcon: Icons.person_outline_rounded,
                              ),
                              SizedBox(
                                height: ScreenUtil().setHeight(15),
                              ),
                              CustomTextFormField(
                                bottom: 12.0,
                                textAlignVertical: TextAlignVertical.center,
                                textAlign: TextAlign.start,
                                controller: emailController,
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                textColor: Colors.black,
                                horizontal: 20.0,
                                vertical: 12.0,
                                errorFontSize: 10.5,
                                errorTextColor: Colors.red,
                                focusedErrorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(
                                        ScreenUtil().radius(30)),
                                    borderSide: BorderSide(
                                        color: Colors.red,
                                        width: ScreenUtil().setWidth(1))),
                                errorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(
                                        ScreenUtil().radius(30)),
                                    borderSide: BorderSide(
                                        color: Colors.red,
                                        width: ScreenUtil().setWidth(1))),
                                textInputAction: TextInputAction.next,
                                iconSize: 25.0,
                                textInputType: TextInputType.emailAddress,
                                obscureText: false,
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(
                                        ScreenUtil().radius(30)),
                                    borderSide: BorderSide(
                                        color: AppColors.snow,
                                        width: ScreenUtil().setWidth(1))),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(
                                        ScreenUtil().radius(30)),
                                    borderSide: BorderSide(
                                        color: AppColors.snow,
                                        width: ScreenUtil().setWidth(1))),
                                hintText: AppStrings.emailAddress,
                                textColorHint: AppColors.hintTextColor,
                                fontSizeHint: 14.0,
                                fontWeightHint: FontWeight.w600,
                                backgroung: AppColors.snow,
                                suffixIconColor: AppColors.tahitiGold,
                                suffixIcon: Icons.email_outlined,
                              ),
                              SizedBox(
                                height: ScreenUtil().setHeight(15),
                              ),
                              CustomTextFormField(
                                bottom: 12.0,
                                textAlignVertical: TextAlignVertical.center,
                                textAlign: TextAlign.start,
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                textColor: Colors.black,
                                horizontal: 20.0,
                                vertical: 12.0,
                                errorFontSize: 11.0,
                                errorTextColor: Colors.red,
                                focusedErrorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(
                                        ScreenUtil().radius(30)),
                                    borderSide: BorderSide(
                                        color: Colors.red,
                                        width: ScreenUtil().setWidth(1))),
                                errorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(
                                        ScreenUtil().radius(30)),
                                    borderSide: BorderSide(
                                        color: Colors.red,
                                        width: ScreenUtil().setWidth(1))),
                                textInputAction: TextInputAction.next,
                                iconSize: 25.0,
                                textInputType: TextInputType.number,
                                obscureText: false,
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(
                                        ScreenUtil().radius(30)),
                                    borderSide: BorderSide(
                                        color: AppColors.snow,
                                        width: ScreenUtil().setWidth(1))),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(
                                        ScreenUtil().radius(30)),
                                    borderSide: BorderSide(
                                        color: AppColors.snow,
                                        width: ScreenUtil().setWidth(1))),
                                hintText: AppStrings.phoneNmeber,
                                textColorHint: AppColors.hintTextColor,
                                fontSizeHint: 14.0,
                                fontWeightHint: FontWeight.w600,
                                backgroung: AppColors.snow,
                                suffixIconColor: AppColors.tahitiGold,
                                suffixIcon: Icons.phone_outlined,
                              ),
                              SizedBox(
                                height: ScreenUtil().setHeight(15),
                              ),
                              CustomTextFormField(
                                bottom: 12.0,
                                textAlignVertical: TextAlignVertical.center,
                                textAlign: TextAlign.start,
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                textColor: Colors.black,
                                horizontal: 20.0,
                                vertical: 12.0,
                                errorFontSize: 11.0,
                                errorTextColor: Colors.red,
                                focusedErrorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(
                                        ScreenUtil().radius(30)),
                                    borderSide: BorderSide(
                                        color: Colors.red,
                                        width: ScreenUtil().setWidth(1))),
                                errorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(
                                        ScreenUtil().radius(30)),
                                    borderSide: BorderSide(
                                        color: Colors.red,
                                        width: ScreenUtil().setWidth(1))),
                                textInputAction: TextInputAction.done,
                                iconSize: 25.0,
                                textInputType: TextInputType.number,
                                obscureText: true,
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(
                                        ScreenUtil().radius(30)),
                                    borderSide: BorderSide(
                                        color: AppColors.snow,
                                        width: ScreenUtil().setWidth(1))),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(
                                        ScreenUtil().radius(30)),
                                    borderSide: BorderSide(
                                        color: AppColors.snow,
                                        width: ScreenUtil().setWidth(1))),
                                hintText: AppStrings.password,
                                textColorHint: AppColors.hintTextColor,
                                fontSizeHint: 14.0,
                                fontWeightHint: FontWeight.w600,
                                backgroung: AppColors.snow,
                                suffixIcon: Icon(Icons.visibility_off_outlined),
                                suffixIconColor: AppColors.tahitiGold,
                              ),
                              SizedBox(
                                height: ScreenUtil().setHeight(15),
                              ),
                              CustomText(
                                  textData: AppStrings.confirmAgree,
                                  textAlign: TextAlign.start,
                                  fontSize: 11,
                                  textColor: Colors.black,
                                  fontWeight: FontWeight.w600),
                              Padding(
                                padding: EdgeInsets.only(
                                    top: ScreenUtil().setHeight(5)),
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
                                      textData: AppStrings.termsAndConditions,
                                      textAlign: TextAlign.start,
                                      fontSize: 12,
                                      textColor: AppColors.tahitiGold,
                                      fontWeight: FontWeight.w700),
                                ),
                              ),
                              SizedBox(
                                height: ScreenUtil().setHeight(50),
                              ),
                              CustomButtonForm(
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
                                fontSize: 13,
                                fontWeight: FontWeight.w700,
                                textColor: Colors.white,
                                textAlign: TextAlign.center,
                                shapeBorder: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      ScreenUtil().radius(30)),
                                ),
                                background: AppColors.tahitiGold,
                                elevation: 0,
                                width: double.infinity,
                                height: 40,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: ScreenUtil().setHeight(20),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomText(
                                textData: AppStrings.alreadyUser,
                                textAlign: TextAlign.end,
                                fontSize: 11,
                                textColor: Colors.black,
                                fontWeight: FontWeight.w500),
                            SizedBox(
                              width: ScreenUtil().setWidth(3),
                            ),
                            InkWell(
                                onTap: () {
                                  Navigator.of(context).pushNamed("signin");
                                },
                                child: CustomText(
                                    textData: AppStrings.signIn,
                                    textAlign: TextAlign.end,
                                    fontSize: 11,
                                    textColor: AppColors.tahitiGold,
                                    fontWeight: FontWeight.w700)),
                          ],
                        ),
                        SizedBox(
                          height: ScreenUtil().setHeight(20),
                        ),
                      ],
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  } //build()
}//SigninPageState class