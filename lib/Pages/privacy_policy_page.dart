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
            textData: AppStrings.privacyPolicy,
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
        margin: EdgeInsets.symmetric(
            horizontal: ScreenUtil().setWidth(20),
            vertical: ScreenUtil().setHeight(10)),
        child: Column(
          children: [
            Expanded(
              child: CustomText(
                  textData: AppStrings.privacyDescription,
                  textAlign: TextAlign.center,
                  fontSize: 13,
                  textColor: Colors.black,
                  fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: ScreenUtil().setHeight(10),
            ),
            Expanded(
              flex: 3,
              child: ListView.builder(
                  physics: BouncingScrollPhysics(),
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
                                  vertical: ScreenUtil().setHeight(5),
                                  horizontal: ScreenUtil().setWidth(10)),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Expanded(
                                    flex: 5,
                                    child: CustomText(
                                        textData:
                                            "${privacyList[index]["privacyTitle"]}",
                                        textAlign: TextAlign.start,
                                        fontSize: 13,
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
                                horizontal: ScreenUtil().setWidth(10)),
                            width: double.infinity,
                            child: Card(
                              color: Colors.white,
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: ScreenUtil().setHeight(10),
                                    horizontal: ScreenUtil().setWidth(10)),
                                child: CustomText(
                                    height: 1.8,
                                    textData:
                                        "${privacyList[index]["privacyDescription"]}",
                                    textAlign: TextAlign.start,
                                    fontSize: 13,
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