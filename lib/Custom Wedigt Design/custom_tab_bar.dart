import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_book_app/Custom%20Wedigt%20Design/book_information.dart';
import 'package:my_book_app/Values/string.dart';

class CustomTabBar extends StatelessWidget {
  CustomTabBar({super.key});

  final List tabItem = [
    AppStrings.forYou,
    AppStrings.popular,
    AppStrings.newReleases,
    AppStrings.bestSeller,
    AppStrings.topRated,
    AppStrings.freeBooks,
    AppStrings.hiddenGems
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: tabItem.length,
        child: SizedBox(
          height: ScreenUtil().setHeight(240.h),
          width: ScreenUtil().setWidth(double.infinity),
          child: Column(
            children: [
              TabBar(
                  isScrollable: true,
                  tabs: tabItem
                      .map((item) => Tab(
                            text: item,
                          ))
                      .toList()),
              Expanded(
                  child: TabBarView(children: [
                for (int i = 0; i < tabItem.length; i++)
                  Padding(
                    padding: EdgeInsets.only(top: ScreenUtil().setHeight(5.h)),
                    child: BookInformation(
                      pageName: "home",
                      height: 210,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      crossAxisCount: 1,
                      mainAxisExtent: 160,
                      crossAxisSpacing: 0,
                      mainAxisSpacing: 5,
                    ),
                  )
              ]))
            ],
          ),
        ));
  } //buid()
}//CustomTabBar class