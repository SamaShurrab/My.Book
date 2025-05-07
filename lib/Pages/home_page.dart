import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_book_app/Custom%20Wedigt%20Design/book_information.dart';
import 'package:my_book_app/Custom%20Wedigt%20Design/create_route.dart';
import 'package:my_book_app/Custom%20Wedigt%20Design/custom_cliprpect_bottom.dart';
import 'package:my_book_app/Custom%20Wedigt%20Design/custom_drawer.dart';
import 'package:my_book_app/Custom%20Wedigt%20Design/custom_tab_bar.dart';
import 'package:my_book_app/Custom%20Wedigt%20Design/custom_text.dart';
import 'package:my_book_app/Values/colors.dart';
import 'package:my_book_app/Values/string.dart';
import '../Custom Wedigt Design/asset_image_widget.dart';
import 'audio_books_page.dart';
import 'books_page.dart';
import 'profile_page.dart';
import 'wishlist_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<StatefulWidget> createState() {
    return HomePageState();
  } //createState()
} //HomePage class

class HomePageState extends State<HomePage> {
  int currentIndex = 2;

  final GlobalKey<BookInformationState> booksListKey =
      GlobalKey<BookInformationState>();

  List drawerList = [
    {"iconName": Icons.home_outlined, "topicName": AppStrings.home},
    {"iconName": Icons.menu_book_rounded, "topicName": AppStrings.books},
    {"iconName": Icons.favorite_border, "topicName": AppStrings.wishlist},
    {"iconName": Icons.person_outline_rounded, "topicName": AppStrings.profile},
    {
      "iconName": Icons.bookmark_border_outlined,
      "topicName": AppStrings.archives
    },
    {
      "iconName": Icons.notifications_outlined,
      "topicName": AppStrings.notifications
    },
    {"iconName": Icons.logout, "topicName": AppStrings.logout}
  ];

  @override
  Widget build(BuildContext context) {
    return PopScope(
        canPop: false,
        child: CustomClipRRectBottom(
            child: Scaffold(
          drawer: CustomDrawer(
            pageName: "home",
          ),
          backgroundColor: Colors.white,
          bottomNavigationBar: BottomNavigationBar(
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.menu_book_rounded),
                label: "",
              ),
              BottomNavigationBarItem(icon: Icon(Icons.favorite), label: ""),
              BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
              BottomNavigationBarItem(
                  icon: Icon(Icons.headphones_rounded), label: ""),
              BottomNavigationBarItem(icon: Icon(Icons.person), label: "")
            ],
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.grey[100],

            // To move between interfaces through bottomNavigationBar
            onTap: (index) {
              setState(() {
                currentIndex = index;
              });
              if (index == 0) {
                Navigator.of(context).pushAndRemoveUntil(
                  createRoute(BooksPage()),
                  (route) => false,
                );
              } else if (index == 1) {
                Navigator.of(context).pushAndRemoveUntil(
                    createRoute(WishlistPage()), (route) => false);
              } else if (index == 3) {
                Navigator.of(context).pushAndRemoveUntil(
                    createRoute(AudioBooksPage()), (route) => false);
              } else if (index == 4) {
                Navigator.of(context).pushAndRemoveUntil(
                    createRoute(ProfilePage()), (route) => false);
              }
            },
            elevation: 0,
            currentIndex: 2,
            iconSize: 32,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            selectedItemColor: AppColors.tahitiGold,
            unselectedItemColor: Colors.grey[400],
          ),
          body: CustomScrollView(
            slivers: [
              SliverAppBar(
                flexibleSpace: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                ),
                backgroundColor: Colors.white,
                expandedHeight: 35.0,
                floating: false,
                pinned: true,
                elevation: 0,
                iconTheme: IconThemeData(color: Colors.black, size: 30),
                actions: [
                  InkWell(
                      splashColor: Colors.transparent,
                      onTap: () {},
                      child: Icon(Icons.search)),
                  SizedBox(
                    width: ScreenUtil().setWidth(10.w),
                  ),
                  InkWell(
                      onTap: () {
                        Navigator.of(context).pushNamed("shoppingCart");
                      },
                      child: Icon(Icons.shopping_bag_outlined)),
                  SizedBox(
                    width: ScreenUtil().setWidth(10.w),
                  )
                ],
              ),
              // SliverList to display page content
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    return index == 0
                        ? Padding(
                            padding: EdgeInsets.only(
                                left: ScreenUtil().setWidth(10.w)),
                            child: CustomText(
                                text: AppStrings.home,
                                textAlign: TextAlign.start,
                                fontSize: 14,
                                textColor: Colors.black,
                                fontWeight: FontWeight.w700),
                          )
                        : index == 1
                            ? Container(
                                margin: EdgeInsets.symmetric(
                                    horizontal: ScreenUtil().setWidth(10.w),
                                    vertical: ScreenUtil().setHeight(10.h)),
                                height: ScreenUtil().setHeight(140.h),
                                decoration: BoxDecoration(
                                    color: AppColors.tahitiGold,
                                    borderRadius: BorderRadius.circular(
                                        ScreenUtil().radius(20.r))),
                                child: Stack(
                                  clipBehavior: Clip.none,
                                  children: [
                                    SizedBox(
                                      height: double.infinity,
                                      width: ScreenUtil().setWidth(125.w),
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.only(
                                              top: ScreenUtil().setHeight(20.h),
                                            ),
                                            child: CustomText(
                                                text: AppStrings
                                                    .homePageDescription1,
                                                textAlign: TextAlign.start,
                                                fontSize: 11,
                                                textColor: Colors.white,
                                                fontWeight: FontWeight.w700),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(
                                                top:
                                                    ScreenUtil().setHeight(5.h),
                                                left:
                                                    ScreenUtil().setWidth(10.w),
                                                bottom: ScreenUtil()
                                                    .setHeight(15.h),
                                                right: ScreenUtil()
                                                    .setWidth(15.w)),
                                            child: CustomText(
                                                text: AppStrings
                                                    .homePageDescription2,
                                                textAlign: TextAlign.start,
                                                fontSize: 10,
                                                textColor: Colors.white,
                                                fontWeight: FontWeight.w600),
                                          )
                                        ],
                                      ),
                                    ),
                                    Positioned(
                                      width: ScreenUtil().setWidth(110.w),
                                      height: ScreenUtil().setHeight(155.h),
                                      right: 8,
                                      top: 25,
                                      child: AssetImageWidget(
                                        imagePath: "images/home_page_img.png",
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            : index == 2
                                ? Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal:
                                            ScreenUtil().setWidth(10.w)),
                                    child: CustomTabBar(),
                                  )
                                : index == 3
                                    ? Padding(
                                        padding: EdgeInsets.only(
                                          left: ScreenUtil().setWidth(10.w),
                                          right: ScreenUtil().setWidth(10.w),
                                          bottom: ScreenUtil().setHeight(10.h),
                                        ),
                                        child: CustomText(
                                            text: AppStrings.newReleases,
                                            textAlign: TextAlign.start,
                                            fontSize: 12,
                                            textColor: Colors.black,
                                            fontWeight: FontWeight.w700),
                                      )
                                    : Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal:
                                                ScreenUtil().setWidth(10.w)),
                                        child: BookInformation(
                                          bookKey: booksListKey,
                                          pageName: "home",
                                          height: 210,
                                          shrinkWrap: true,
                                          scrollDirection: Axis.horizontal,
                                          crossAxisCount: 1,
                                          mainAxisExtent: 160,
                                          crossAxisSpacing: 0,
                                          mainAxisSpacing: 5,
                                        ),
                                      );
                  },
                  childCount: 5, // Number of items in the list
                ),
              ),
            ],
          ),
        )));
  } //build()
} //HomePage Class()
