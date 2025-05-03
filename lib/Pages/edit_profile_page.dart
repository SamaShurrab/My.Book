import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_book_app/Custom%20Wedigt%20Design/custom_buttom.dart';
import 'package:my_book_app/Custom%20Wedigt%20Design/form_submit_button.dart';
import 'package:my_book_app/Custom%20Wedigt%20Design/custom_text_form_field.dart';
import '../Custom Wedigt Design/custom_text.dart';
import '../Values/colors.dart';
import '../Values/string.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});
  @override
  State<StatefulWidget> createState() {
    return EditProfilePageState();
  } //createState()
} //EditProfilePage class

class EditProfilePageState extends State<EditProfilePage> {
  // formKey was used to check the value entered by the user whether they match the conditions or not
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  File? imagePath;

// this function to use pick image from camera
  Future<void> _pickImageFromCamera() async {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.camera);
    if (pickedImage != null) {
      setState(() {
        imagePath = File(pickedImage.path);
      });
    } //if()
  } //_pickImageFromCamera()

// this function to use pick image from gallery
  Future<void> _pickImageFromGallery() async {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        imagePath = File(pickedImage.path);
      });
    } //if()
  } //_pickImageFromCamera()

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: CustomText(
            text: AppStrings.editProfile,
            textAlign: TextAlign.start,
            fontSize: 16,
            textColor: Colors.black,
            fontWeight: FontWeight.w700),
        leading: InkWell(
            splashColor: Colors.transparent,
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Icon(
              Icons.chevron_left_rounded,
              size: 35,
              color: Colors.black,
            )),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(20)),
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            imagePath != null
                ? CircleAvatar(
                    radius: ScreenUtil().radius(60),
                    backgroundColor: Colors.grey[300],
                    child: ClipOval(
                      child: Image.file(
                        imagePath!,
                        width: ScreenUtil().setWidth(105),
                        height: ScreenUtil().setHeight(105),
                        fit: BoxFit.cover,
                      ),
                    ),
                  )
                : CircleAvatar(
                    radius: ScreenUtil().radius(50),
                    backgroundColor: Colors.grey[300],
                    child: ClipOval(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: ScreenUtil().setWidth(10),
                            vertical: ScreenUtil().setWidth(10)),
                        child: Image.asset(
                          'images/user_img.png',
                          width: ScreenUtil().setWidth(100),
                          height: ScreenUtil().setHeight(100),
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
            SizedBox(
              height: ScreenUtil().setHeight(10),
            ),
            InkWell(
              splashColor: Colors.transparent,
              onTap: () {
                showDialog(
                    barrierDismissible: false,
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomText(
                                  text: AppStrings.choose,
                                  textAlign: TextAlign.start,
                                  fontSize: 16,
                                  textColor: Colors.black,
                                  fontWeight: FontWeight.w600),
                              IconButton(
                                  splashColor: Colors.transparent,
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  icon: Icon(
                                    Icons.cancel_outlined,
                                    size: 30,
                                    color: Colors.red,
                                  ))
                            ]),
                        backgroundColor: Colors.white,
                        content: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Expanded(
                              child: InkWell(
                                splashColor: Colors.transparent,
                                onTap: _pickImageFromCamera,
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(
                                      Icons.camera_alt,
                                      size: 50,
                                      color: Colors.black,
                                    ),
                                    SizedBox(
                                      height: ScreenUtil().setHeight(10),
                                    ),
                                    CustomText(
                                        text: AppStrings.camera,
                                        textAlign: TextAlign.center,
                                        fontSize: 14,
                                        textColor: Colors.black,
                                        fontWeight: FontWeight.w600)
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              width: ScreenUtil().setWidth(10),
                            ),
                            Expanded(
                              child: InkWell(
                                splashColor: Colors.transparent,
                                onTap: _pickImageFromGallery,
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(
                                      Icons.photo,
                                      size: 50,
                                      color: Colors.black,
                                    ),
                                    SizedBox(
                                      height: ScreenUtil().setHeight(10),
                                    ),
                                    CustomText(
                                        text: AppStrings.gallery,
                                        textAlign: TextAlign.center,
                                        fontSize: 14,
                                        textColor: Colors.black,
                                        fontWeight: FontWeight.w600)
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      );
                    });
              },
              child: CustomText(
                  text: AppStrings.changePicture,
                  textAlign: TextAlign.center,
                  fontSize: 12,
                  textColor: Colors.black,
                  fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: ScreenUtil().setHeight(30),
            ),
            Form(
              key: formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTextFormField(
                    textAlignVertical: TextAlignVertical.center,
                    textAlign: TextAlign.start,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    textColor: Colors.black,
                    horizontal: 20.0,
                    vertical: 12.0,
                    bottom: 12.0,
                    errorFontSize: 11.0,
                    errorTextColor: Colors.red,
                    focusedErrorBorder: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(ScreenUtil().radius(30)),
                        borderSide: BorderSide(
                            color: Colors.red,
                            width: ScreenUtil().setWidth(1))),
                    errorBorder: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(ScreenUtil().radius(30)),
                        borderSide: BorderSide(
                            color: Colors.red,
                            width: ScreenUtil().setWidth(1))),
                    textInputAction: TextInputAction.next,
                    iconSize: 25.0,
                    textInputType: TextInputType.text,
                    obscureText: false,
                    focusedBorder: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(ScreenUtil().radius(30)),
                        borderSide: BorderSide(
                            color: AppColors.tahitiGold,
                            width: ScreenUtil().setWidth(1))),
                    enabledBorder: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(ScreenUtil().radius(30)),
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
                    textAlignVertical: TextAlignVertical.center,
                    textAlign: TextAlign.start,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    textColor: Colors.black,
                    horizontal: 20.0,
                    vertical: 12.0,
                    bottom: 12.0,
                    errorFontSize: 11.0,
                    errorTextColor: Colors.red,
                    focusedErrorBorder: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(ScreenUtil().radius(30)),
                        borderSide: BorderSide(
                            color: Colors.red,
                            width: ScreenUtil().setWidth(1))),
                    errorBorder: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(ScreenUtil().radius(30)),
                        borderSide: BorderSide(
                            color: Colors.red,
                            width: ScreenUtil().setWidth(1))),
                    textInputAction: TextInputAction.next,
                    iconSize: 25.0,
                    textInputType: TextInputType.emailAddress,
                    obscureText: false,
                    focusedBorder: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(ScreenUtil().radius(30)),
                        borderSide: BorderSide(
                            color: AppColors.tahitiGold,
                            width: ScreenUtil().setWidth(1))),
                    enabledBorder: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(ScreenUtil().radius(30)),
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
                    textAlignVertical: TextAlignVertical.center,
                    textAlign: TextAlign.start,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    textColor: Colors.black,
                    horizontal: 20.0,
                    vertical: 12.0,
                    bottom: 12.0,
                    errorFontSize: 11.0,
                    errorTextColor: Colors.red,
                    focusedErrorBorder: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(ScreenUtil().radius(30)),
                        borderSide: BorderSide(
                            color: Colors.red,
                            width: ScreenUtil().setWidth(1))),
                    errorBorder: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(ScreenUtil().radius(30)),
                        borderSide: BorderSide(
                            color: Colors.red,
                            width: ScreenUtil().setWidth(1))),
                    textInputAction: TextInputAction.done,
                    iconSize: 25.0,
                    textInputType: TextInputType.number,
                    obscureText: false,
                    focusedBorder: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(ScreenUtil().radius(30)),
                        borderSide: BorderSide(
                            color: AppColors.tahitiGold,
                            width: ScreenUtil().setWidth(1))),
                    enabledBorder: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(ScreenUtil().radius(30)),
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
                    height: ScreenUtil().setHeight(50),
                  ),
                  FormSubmitButton(
                    onPressed: () {
                      setState(() {
                        if (formKey.currentState != null &&
                            formKey.currentState!.validate()) {
                          formKey.currentState!.save();
                          Navigator.of(context).pushNamed("profile");
                        }
                      });
                    },
                    formKey: formKey,
                    buttonName: AppStrings.updateProfile,
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                    textColor: Colors.white,
                    textAlign: TextAlign.center,
                    shapeBorder: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(ScreenUtil().radius(30)),
                    ),
                    background: AppColors.tahitiGold,
                    elevation: 0,
                    width: double.infinity,
                    height: 40,
                  ),
                  SizedBox(
                    height: ScreenUtil().setHeight(10),
                  ),
                  CustomButton(
                      routeName: "profile",
                      buttonName: AppStrings.cancel,
                      fontSize: 13,
                      fontWeight: FontWeight.w700,
                      textColor: Colors.black,
                      textAlign: TextAlign.center,
                      shapeBorder: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(ScreenUtil().radius(30)),
                          side: BorderSide(
                              color: AppColors.tahitiGold,
                              width: ScreenUtil().setWidth(1))),
                      elevation: 0,
                      background: Colors.white,
                      height: 40,
                      width: double.infinity),
                  SizedBox(
                    height: ScreenUtil().setHeight(20),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  } //build()
} //EditProfilePageState class
