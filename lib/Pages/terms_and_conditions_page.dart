import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_book_app/Custom%20Wedigt%20Design/custom_cliprpect_top.dart';
import 'package:my_book_app/Custom%20Wedigt%20Design/custom_text.dart';
import 'package:my_book_app/Values/colors.dart';
import 'package:my_book_app/Values/string.dart';

import '../Custom Wedigt Design/custom_image_svg.dart';

class TermsAndConditionsPage extends StatefulWidget {
  final String routeName;
  const TermsAndConditionsPage({super.key, required this.routeName});
  @override
  State<StatefulWidget> createState() {
    return TermsAndConditionsPageState();
  } //createState()
} //TermsAndConditionsPage class

class TermsAndConditionsPageState extends State<TermsAndConditionsPage> {
  // This variable is stores the list with a map that contains Term and Condition and it's description
  List termsList = [
    {
      "titleTerm": AppStrings.titleTirm1,
      "descriptionTerm": AppStrings.descriptionTirm1
    },
    {
      "titleTerm": AppStrings.titleTirm2,
      "descriptionTerm": AppStrings.descriptionTirm2
    },
    {
      "titleTerm": AppStrings.titleTirm3,
      "descriptionTerm": AppStrings.descriptionTirm3
    },
    {
      "titleTerm": AppStrings.titleTirm4,
      "descriptionTerm": AppStrings.descriptionTirm4
    },
    {
      "titleTerm": AppStrings.titleTirm5,
      "descriptionTerm": AppStrings.descriptionTirm5
    },
    {
      "titleTerm": AppStrings.titleTirm6,
      "descriptionTerm": AppStrings.descriptionTirm6
    },
    {
      "titleTerm": AppStrings.titleTirm7,
      "descriptionTerm": AppStrings.descriptionTirm7
    }
  ];
  late List<bool> isExpandedList;
  @override
  void initState() {
    super.initState();
    // This variable is filled out so that all cards are closed in the initial state
    isExpandedList = List<bool>.filled(termsList.length, false);
  }

  @override
  Widget build(BuildContext context) {
    /*
      Here we check if the transition was made from the interface of creating an account
      or from another interface, and each case displays its own design
    */
    if (widget.routeName == "register") {
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
                              topRight:
                                  Radius.circular(ScreenUtil().radius(20)),
                              topLeft:
                                  Radius.circular(ScreenUtil().radius(20)))),
                      child: ListView(
                        children: [
                          CustomText(
                              text: AppStrings.termsAndConditions,
                              textAlign: TextAlign.start,
                              fontSize: 16,
                              textColor: Colors.black,
                              fontWeight: FontWeight.w700),
                          SizedBox(
                            height: ScreenUtil().setHeight(8),
                          ),
                          CustomText(
                              text: AppStrings.introduction,
                              textAlign: TextAlign.start,
                              fontSize: 12,
                              textColor: Colors.black,
                              fontWeight: FontWeight.w500),
                          SizedBox(
                            height: ScreenUtil().setHeight(20),
                          ),
                          ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: termsList.length,
                            itemBuilder: (context, i) {
                              return Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: double.infinity,
                                    child: Card(
                                      color: AppColors.tahitiGold,
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            vertical: ScreenUtil().setHeight(5),
                                            horizontal:
                                                ScreenUtil().setWidth(10)),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Expanded(
                                              flex: 5,
                                              child: CustomText(
                                                  text:
                                                      "${termsList[i]["titleTerm"]}",
                                                  textAlign: TextAlign.start,
                                                  fontSize: 13,
                                                  textColor: Colors.white,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                            Expanded(
                                              child: IconButton(
                                                  splashColor:
                                                      Colors.transparent,
                                                  alignment:
                                                      Alignment.topCenter,
                                                  iconSize: 30,
                                                  color: Colors.white,
                                                  onPressed: () {
                                                    setState(() {
                                                      isExpandedList[i] =
                                                          !isExpandedList[i];
                                                    });
                                                  },
                                                  icon: isExpandedList[i]
                                                      ? Icon(
                                                          Icons
                                                              .keyboard_arrow_up_rounded,
                                                        )
                                                      : Icon(
                                                          Icons
                                                              .keyboard_arrow_down_rounded,
                                                        )),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  if (isExpandedList[i])
                                    Container(
                                      margin: EdgeInsets.symmetric(
                                          horizontal:
                                              ScreenUtil().setWidth(10)),
                                      width: double.infinity,
                                      child: Card(
                                        color: Colors.white,
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical:
                                                  ScreenUtil().setHeight(10),
                                              horizontal:
                                                  ScreenUtil().setWidth(10)),
                                          child: CustomText(
                                              text:
                                                  "${termsList[i]["descriptionTerm"]}",
                                              textAlign: TextAlign.start,
                                              fontSize: 13,
                                              textColor: Colors.black,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                    ),
                                ],
                              );
                            },
                          ),
                          SizedBox(
                            height: ScreenUtil().setHeight(20),
                          )
                        ],
                      ),
                    ))
              ],
            ),
          )));
    } else {
      return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          iconTheme: IconThemeData(
              color: Colors.black, size: ScreenUtil().setWidth(20)),
          centerTitle: true,
          title: CustomText(
              text: AppStrings.termsAndConditions,
              textAlign: TextAlign.center,
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
              horizontal: ScreenUtil().setWidth(10),
              vertical: ScreenUtil().setHeight(10)),
          child: Column(
            children: [
              Expanded(
                child: CustomText(
                    text: AppStrings.introduction,
                    textAlign: TextAlign.center,
                    fontSize: 13,
                    textColor: Colors.black,
                    fontWeight: FontWeight.w600),
              ),
              Expanded(
                flex: 4,
                child: ListView.builder(
                  itemCount: termsList.length,
                  itemBuilder: (context, i) {
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
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
                                        text: "${termsList[i]["titleTerm"]}",
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
                                            isExpandedList[i] =
                                                !isExpandedList[i];
                                          });
                                        },
                                        icon: isExpandedList[i]
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
                        if (isExpandedList[i])
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
                                    text: "${termsList[i]["descriptionTerm"]}",
                                    textAlign: TextAlign.start,
                                    fontSize: 13,
                                    textColor: Colors.black,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      );
    }
  } //build()
}//TermsAndConditionsPageState class