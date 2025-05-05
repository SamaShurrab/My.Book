import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_book_app/Classes/topic.dart';
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
  List<Topic> topicsList = [
    Topic(selected: false, topicName: AppStrings.fantasy),
    Topic(selected: false, topicName: AppStrings.detective),
    Topic(selected: false, topicName: AppStrings.crime),
    Topic(selected: false, topicName: AppStrings.horror),
    Topic(selected: false, topicName: AppStrings.sciFi),
    Topic(selected: false, topicName: AppStrings.travel),
    Topic(selected: false, topicName: AppStrings.thriller),
    Topic(selected: false, topicName: AppStrings.psychology),
    Topic(selected: false, topicName: AppStrings.scient),
    Topic(selected: false, topicName: AppStrings.technology),
    Topic(selected: false, topicName: AppStrings.love),
    Topic(selected: false, topicName: AppStrings.dairy),
  ];

  int itemsSlected = 0;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        appBar: AppBar(
          foregroundColor: Colors.white,
          backgroundColor: Colors.white,
          centerTitle: true,
          title: CustomText(
              text: AppStrings.chooseInterest,
              textAlign: TextAlign.start,
              fontSize: 13,
              textColor: Colors.black,
              fontWeight: FontWeight.w700),
        ),
        body: Container(
          margin: EdgeInsets.symmetric(
              horizontal: ScreenUtil().setWidth(20.w),
              vertical: ScreenUtil().setHeight(5.h)),
          child: Column(
            children: [
              Center(
                child: CustomText(
                    text: AppStrings.selectTopics,
                    textAlign: TextAlign.center,
                    fontSize: 11,
                    textColor: Colors.black,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: ScreenUtil().setHeight(10.h),
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
                          topicsList[index].selected =
                              !topicsList[index].selected;
                          topicsList[index].selected
                              ? itemsSlected++
                              : itemsSlected--;
                        });
                      },
                      child: Card(
                        color: topicsList[index].selected
                            ? Colors.black54
                            : AppColors.snow,
                        child: Center(
                          child: CustomText(
                              text: topicsList[index].topicName,
                              textAlign: TextAlign.center,
                              fontSize: 10,
                              textColor: topicsList[index].selected
                                  ? Colors.white
                                  : Colors.black,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                    );
                  }),
              SizedBox(
                height: ScreenUtil().setHeight(20.h),
              ),
              CustomButton(
                buttonName: AppStrings.next,
                fontSize: 10,
                fontWeight: FontWeight.w600,
                textColor: Colors.white,
                textAlign: TextAlign.center,
                shapeBorder: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(ScreenUtil().radius(30.r)),
                ),
                background: AppColors.tahitiGold,
                elevation: 0,
                width: double.infinity,
                height: 35,
                routeName: "home",
                itemsSlected: itemsSlected,
                fontSizeSnack: 11,
                fontWeightSnack: FontWeight.w600,
                snackbackground: Colors.red,
                textAlignSnack: TextAlign.start,
                textColorSnack: Colors.white,
                textData: AppStrings.errorMessage,
              ),
              SizedBox(
                height: ScreenUtil().setHeight(10.h),
              )
            ],
          ),
        ),
      ),
    );
  } //build()
}//ChooseInterestPageState class