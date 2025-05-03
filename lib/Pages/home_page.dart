import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_book_app/Custom%20Wedigt%20Design/book_information.dart';
import 'package:my_book_app/Custom%20Wedigt%20Design/custom_cliprpect_bottom.dart';
import 'package:my_book_app/Custom%20Wedigt%20Design/custom_tab_bar.dart';
import 'package:my_book_app/Custom%20Wedigt%20Design/custom_text.dart';
import 'package:my_book_app/Custom%20Wedigt%20Design/logout_dialog.dart';
import 'package:my_book_app/Values/colors.dart';
import 'package:my_book_app/Values/string.dart';
import '../Custom Wedigt Design/asset_image_widget.dart';
import 'audio_books_page.dart';
import 'books_page.dart';
import 'profile_page.dart';
import 'wishlist_page.dart';

/*
 A function that creates a custom transition path that 
 displays the new page with a Fade effect and bottom corners clipped using ClipRRect.
*/
Route createRouteHome(Widget destination) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) {
      return CustomClipRRectBottom(child: destination);
    },
  );
} //createRouteHome()

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
          backgroundColor: Colors.white,
          drawer: Drawer(
            backgroundColor: Colors.white,
            elevation: 0,
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  color: AppColors.tahitiGold,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        height: ScreenUtil().setHeight(30),
                      ),
                      CircleAvatar(
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
                      CustomText(
                          text: "Sama Shurrab",
                          textAlign: TextAlign.center,
                          fontSize: 15,
                          textColor: Colors.white,
                          fontWeight: FontWeight.w600),
                      SizedBox(
                        height: ScreenUtil().setHeight(5),
                      ),
                      CustomText(
                          text: "smshorap@gmail.com",
                          textAlign: TextAlign.center,
                          fontSize: 15,
                          textColor: Colors.white,
                          fontWeight: FontWeight.w600),
                      SizedBox(
                        height: ScreenUtil().setHeight(10),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(
                      horizontal: ScreenUtil().setWidth(20)),
                  child: ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: drawerList.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            SizedBox(
                              height: ScreenUtil().setHeight(20),
                            ),
                            InkWell(
                              splashColor: Colors.transparent,
                              onTap: () {
                                if (index == 0) {
                                  Navigator.of(context).pop();
                                } else if (index == 1) {
                                  Navigator.of(context).pushAndRemoveUntil(
                                    createRouteHome(BooksPage()),
                                    (route) => false,
                                  );
                                } else if (index == 2) {
                                  Navigator.of(context).pushAndRemoveUntil(
                                    createRouteHome(WishlistPage()),
                                    (route) => false,
                                  );
                                } else if (index == 3) {
                                  Navigator.of(context).pushAndRemoveUntil(
                                    createRouteHome(ProfilePage()),
                                    (route) => false,
                                  );
                                } else if (index == 4) {
                                } else if (index == 5) {
                                  LogoutDialog.show(context);
                                }
                              },
                              child: Row(
                                children: [
                                  Icon(
                                    drawerList[index]["iconName"],
                                    size: 35,
                                    color: Colors.black,
                                  ),
                                  SizedBox(
                                    width: ScreenUtil().setWidth(10),
                                  ),
                                  CustomText(
                                      text: drawerList[index]["topicName"],
                                      textAlign: TextAlign.start,
                                      fontSize: 15,
                                      textColor: Colors.black,
                                      fontWeight: FontWeight.w600)
                                ],
                              ),
                            ),
                          ],
                        );
                      }),
                )
              ],
            ),
          ),
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
                  createRouteHome(BooksPage()),
                  (route) => false,
                );
              } else if (index == 1) {
                Navigator.of(context).pushAndRemoveUntil(
                    createRouteHome(WishlistPage()), (route) => false);
              } else if (index == 3) {
                Navigator.of(context).pushAndRemoveUntil(
                    createRouteHome(AudioBooksPage()), (route) => false);
              } else if (index == 4) {
                Navigator.of(context).pushAndRemoveUntil(
                    createRouteHome(ProfilePage()), (route) => false);
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
                iconTheme: IconThemeData(
                    color: Colors.black, size: ScreenUtil().setWidth(25)),
                actions: [
                  InkWell(
                      splashColor: Colors.transparent,
                      onTap: () {},
                      child: Icon(Icons.search)),
                  SizedBox(
                    width: ScreenUtil().setWidth(10),
                  ),
                  InkWell(
                      onTap: () {
                        Navigator.of(context)
                            .push(createRouteHome(ProfilePage()));
                      },
                      child: Icon(Icons.person_outline_sharp)),
                  SizedBox(
                    width: ScreenUtil().setWidth(10),
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
                                left: ScreenUtil().setWidth(15)),
                            child: CustomText(
                                text: AppStrings.home,
                                textAlign: TextAlign.start,
                                fontSize: 15,
                                textColor: Colors.black,
                                fontWeight: FontWeight.w600),
                          )
                        : index == 1
                            ? Container(
                                margin: EdgeInsets.symmetric(
                                    horizontal: ScreenUtil().setWidth(15),
                                    vertical: ScreenUtil().setHeight(15)),
                                height: ScreenUtil().setHeight(140),
                                decoration: BoxDecoration(
                                    color: AppColors.tahitiGold,
                                    borderRadius: BorderRadius.circular(
                                        ScreenUtil().radius(20))),
                                child: Stack(
                                  clipBehavior: Clip.none,
                                  children: [
                                    SizedBox(
                                      height: double.infinity,
                                      width: ScreenUtil().setWidth(140),
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.only(
                                              top: ScreenUtil().setHeight(20),
                                            ),
                                            child: CustomText(
                                                text: AppStrings
                                                    .homePageDescription1,
                                                textAlign: TextAlign.start,
                                                fontSize: 13,
                                                textColor: Colors.white,
                                                fontWeight: FontWeight.w600),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(
                                                top: ScreenUtil().setHeight(5),
                                                left: ScreenUtil().setWidth(15),
                                                bottom:
                                                    ScreenUtil().setHeight(15),
                                                right:
                                                    ScreenUtil().setWidth(5)),
                                            child: CustomText(
                                                text: AppStrings
                                                    .homePageDescription2,
                                                textAlign: TextAlign.start,
                                                fontSize: 11,
                                                textColor: Colors.white,
                                                fontWeight: FontWeight.w600),
                                          )
                                        ],
                                      ),
                                    ),
                                    Positioned(
                                      width: ScreenUtil().setWidth(135),
                                      height: ScreenUtil().setHeight(155),
                                      right: 15,
                                      top: 13,
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
                                        horizontal: ScreenUtil().setWidth(15)),
                                    child: CustomTabBar(),
                                  )
                                : index == 3
                                    ? Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal:
                                                ScreenUtil().setWidth(15),
                                            vertical:
                                                ScreenUtil().setHeight(10)),
                                        child: CustomText(
                                            text: AppStrings.newReleases,
                                            textAlign: TextAlign.start,
                                            fontSize: 15,
                                            textColor: Colors.black,
                                            fontWeight: FontWeight.w600),
                                      )
                                    : Padding(
                                        padding: EdgeInsets.only(
                                            left: ScreenUtil().setWidth(10),
                                            right: ScreenUtil().setWidth(10)),
                                        child: BookInformation(
                                          bookKey: booksListKey,
                                          pageName: "home",
                                          height: 248,
                                          shrinkWrap: true,
                                          scrollDirection: Axis.horizontal,
                                          crossAxisCount: 1,
                                          mainAxisExtent: 170,
                                          crossAxisSpacing: 0,
                                          mainAxisSpacing: 0,
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
