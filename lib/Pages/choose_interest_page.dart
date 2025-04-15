import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_book_app/Custom%20Wedigt%20Design/custom_buttom.dart';
import 'package:my_book_app/Values/string.dart';

import '../Custom Wedigt Design/custom_text.dart';
import '../Values/colors.dart';

class ChooseInterestPage extends StatefulWidget {
  const ChooseInterestPage({super.key});
  @override
  State<StatefulWidget> createState() {
    return ChooseInterestPageState();
  } //createState()
} //ChooseInterestPage class

class ChooseInterestPageState extends State<ChooseInterestPage> {
  List topicsList = [
    {"topicsName": AppStrings.fantasy, "selected": false},
    {"topicsName": AppStrings.detective, "selected": false},
    {"topicsName": AppStrings.crime, "selected": false},
    {"topicsName": AppStrings.horror, "selected": false},
    {"topicsName": AppStrings.sciFi, "selected": false},
    {"topicsName": AppStrings.travel, "selected": false},
    {"topicsName": AppStrings.thriller, "selected": false},
    {"topicsName": AppStrings.psychology, "selected": false},
    {"topicsName": AppStrings.scient, "selected": false},
    {"topicsName": AppStrings.technology, "selected": false},
    {"topicsName": AppStrings.love, "selected": false},
    {"topicsName": AppStrings.dairy, "selected": false},
  ];

  int itemsSlected = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: CustomText(
            textData: AppStrings.chooseInterest,
            textAlign: TextAlign.start,
            fontSize: 16,
            textColor: Colors.black,
            fontWeight: FontWeight.w700),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(
            horizontal: ScreenUtil().setWidth(20),
            vertical: ScreenUtil().setHeight(5)),
        child: Column(
          children: [
            Center(
              child: CustomText(
                  textData: AppStrings.selectTopics,
                  textAlign: TextAlign.center,
                  fontSize: 14,
                  textColor: Colors.black,
                  fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: ScreenUtil().setHeight(10),
            ),
            GridView.builder(
                shrinkWrap: true,
                itemCount: topicsList.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisExtent: 65,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10),
                itemBuilder: (context, index) {
                  return InkWell(
                    splashColor: Colors.transparent,
                    onTap: () {
                      setState(() {
                        topicsList[index]["selected"] =
                            !topicsList[index]["selected"];
                        topicsList[index]["selected"]
                            ? itemsSlected++
                            : itemsSlected--;
                      });
                    },
                    child: Card(
                      color: topicsList[index]["selected"]
                          ? Colors.black54
                          : AppColors.snow,
                      child: Center(
                        child: CustomText(
                            textData: topicsList[index]["topicsName"],
                            textAlign: TextAlign.center,
                            fontSize: 13,
                            textColor: topicsList[index]["selected"]
                                ? Colors.white
                                : Colors.black,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                  );
                }),
            SizedBox(
              height: ScreenUtil().setHeight(20),
            ),
            CustomButton(
              buttonName: AppStrings.next,
              fontSize: 13,
              fontWeight: FontWeight.w600,
              textColor: Colors.white,
              textAlign: TextAlign.center,
              shapeBorder: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(ScreenUtil().radius(30)),
              ),
              background: AppColors.tahitiGold,
              elevation: 0,
              width: double.infinity,
              height: 40,
              routeName: "home",
              itemsSlected: itemsSlected,
              fontSizeSnack: 14,
              fontWeightSnack: FontWeight.w600,
              snackbackground: Colors.red,
              textAlignSnack: TextAlign.start,
              textColorSnack: Colors.white,
              textData: AppStrings.errorMessage,
            ),
            SizedBox(
              height: ScreenUtil().setHeight(10),
            )
          ],
        ),
      ),
    );
  } //build()
}//ChooseInterestPageState class