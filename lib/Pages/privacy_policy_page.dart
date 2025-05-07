import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_book_app/Custom%20Wedigt%20Design/custom_text.dart';
import 'package:my_book_app/Values/colors.dart';
import 'package:my_book_app/Values/string.dart';

class PrivacyPolicyPage extends StatefulWidget {
  const PrivacyPolicyPage({super.key});
  @override
  State<StatefulWidget> createState() {
    return PrivacyPolicyPageState();
  } //createState()
} //PrivacyPolicyPage class

class PrivacyPolicyPageState extends State<PrivacyPolicyPage> {
  List privacyList = [
    {
      "privacyTitle": AppStrings.privacyTitle1,
      "privacyDescription": AppStrings.privacyDescription1
    },
    {
      "privacyTitle": AppStrings.privacyTitle2,
      "privacyDescription": AppStrings.privacyDescription2
    },
    {
      "privacyTitle": AppStrings.privacyTitle3,
      "privacyDescription": AppStrings.privacyDescription3
    },
    {
      "privacyTitle": AppStrings.privacyTitle4,
      "privacyDescription": AppStrings.privacyDescription4
    },
    {
      "privacyTitle": AppStrings.privacyTitle5,
      "privacyDescription": AppStrings.privacyDescription5
    },
    {
      "privacyTitle": AppStrings.privacyTitle6,
      "privacyDescription": AppStrings.privacyDescription6
    }
  ];

  late List<bool> isExpandedList;
  @override
  void initState() {
    super.initState();
    // This variable is filled out so that all cards are closed in the initial state
    isExpandedList = List<bool>.filled(privacyList.length, false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: CustomText(
            text: AppStrings.privacyPolicy,
            textAlign: TextAlign.start,
            fontSize: 13,
            textColor: Colors.black,
            fontWeight: FontWeight.w700),
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
      ),
      body: Container(
        margin: EdgeInsets.symmetric(
            horizontal: ScreenUtil().setWidth(15.w),
            vertical: ScreenUtil().setHeight(10.h)),
        child: Column(
          children: [
            Expanded(
              child: CustomText(
                  text: AppStrings.privacyDescription,
                  textAlign: TextAlign.center,
                  fontSize: 10,
                  textColor: Colors.black,
                  fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: ScreenUtil().setHeight(5.h),
            ),
            Expanded(
              flex: 3,
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: privacyList.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        SizedBox(
                          width: double.infinity,
                          child: Card(
                            color: AppColors.tahitiGold,
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: ScreenUtil().setHeight(2.h),
                                  horizontal: ScreenUtil().setWidth(10.w)),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Expanded(
                                    flex: 5,
                                    child: CustomText(
                                        text:
                                            "${privacyList[index]["privacyTitle"]}",
                                        textAlign: TextAlign.start,
                                        fontSize: 9,
                                        textColor: Colors.white,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Expanded(
                                    child: IconButton(
                                        alignment: Alignment.topCenter,
                                        iconSize: 30,
                                        color: Colors.white,
                                        onPressed: () {
                                          setState(() {
                                            isExpandedList[index] =
                                                !isExpandedList[index];
                                          });
                                        },
                                        icon: isExpandedList[index]
                                            ? Icon(
                                                Icons.keyboard_arrow_up_rounded,
                                              )
                                            : Icon(
                                                Icons
                                                    .keyboard_arrow_down_rounded,
                                              )),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        if (isExpandedList[index])
                          Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: ScreenUtil().setWidth(10.w)),
                            width: double.infinity,
                            child: Card(
                              color: Colors.white,
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: ScreenUtil().setHeight(10.h),
                                    horizontal: ScreenUtil().setWidth(10.w)),
                                child: CustomText(
                                    height: 1.8,
                                    text:
                                        "${privacyList[index]["privacyDescription"]}",
                                    textAlign: TextAlign.start,
                                    fontSize: 10,
                                    textColor: Colors.black,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),
                      ],
                    );
                  }),
            )
          ],
        ),
      ),
    );
  } //build()
}//PrivacyPolicyPageState class