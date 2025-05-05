import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_book_app/Custom%20Wedigt%20Design/asset_image_widget.dart';
import 'package:my_book_app/Custom%20Wedigt%20Design/create_route.dart';
import 'package:my_book_app/Pages/home_page.dart';
import 'package:my_book_app/Values/colors.dart';
import '../Pages/archives_page.dart';
import '../Pages/books_page.dart';
import '../Pages/profile_page.dart';
import '../Pages/wishlist_page.dart';
import '../Values/string.dart';
import 'custom_text.dart';
import 'logout_dialog.dart';

class CustomDrawer extends StatelessWidget {
  final String pageName;
  final List drawerList = [
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

  CustomDrawer({super.key, required this.pageName});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            color: AppColors.tahitiGold,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: ScreenUtil().setHeight(25.h),
                ),
                CircleAvatar(
                  radius: ScreenUtil().radius(40.r),
                  backgroundColor: Colors.grey[300],
                  child: ClipOval(
                    child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: ScreenUtil().setWidth(10.h),
                            vertical: ScreenUtil().setWidth(10.w)),
                        child: AssetImageWidget(
                          imagePath: 'images/user_img.png',
                          width: 100.w,
                          height: 100.w,
                          fit: BoxFit.contain,
                        )),
                  ),
                ),
                SizedBox(
                  height: ScreenUtil().setHeight(10),
                ),
                CustomText(
                    text: "Sama Shurrab",
                    textAlign: TextAlign.center,
                    fontSize: 12,
                    textColor: Colors.white,
                    fontWeight: FontWeight.w600),
                SizedBox(
                  height: ScreenUtil().setHeight(5),
                ),
                CustomText(
                    text: "smshorap@gmail.com",
                    textAlign: TextAlign.center,
                    fontSize: 12,
                    textColor: Colors.white,
                    fontWeight: FontWeight.w600),
                SizedBox(
                  height: ScreenUtil().setHeight(10.h),
                )
              ],
            ),
          ),
          Container(
            margin:
                EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(15.w)),
            child: ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: drawerList.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      SizedBox(
                        height: ScreenUtil().setHeight(18.h),
                      ),
                      InkWell(
                        splashColor: Colors.transparent,
                        onTap: () {
                          if (index == 0) {
                            if (pageName == "home") {
                              Navigator.of(context).pop();
                            } else {
                              Navigator.of(context).pushAndRemoveUntil(
                                createRoute(HomePage()),
                                (route) => false,
                              );
                            }
                          } else if (index == 1) {
                            Navigator.of(context).pushAndRemoveUntil(
                              createRoute(BooksPage()),
                              (route) => false,
                            );
                          } else if (index == 2) {
                            Navigator.of(context).pushAndRemoveUntil(
                              createRoute(WishlistPage()),
                              (route) => false,
                            );
                          } else if (index == 3) {
                            Navigator.of(context).pushAndRemoveUntil(
                              createRoute(ProfilePage()),
                              (route) => false,
                            );
                          } else if (index == 4) {
                            Navigator.of(context).pushAndRemoveUntil(
                              createRoute(ArchivesPage()),
                              (route) => false,
                            );
                          } else if (index == 4) {
                          } else if (index == 6) {
                            LogoutDialog.show(context);
                          }
                        },
                        child: Row(
                          children: [
                            Icon(
                              drawerList[index]["iconName"],
                              size: 30,
                              color: Colors.black,
                            ),
                            SizedBox(
                              width: ScreenUtil().setWidth(10.w),
                            ),
                            CustomText(
                                text: drawerList[index]["topicName"],
                                textAlign: TextAlign.start,
                                fontSize: 12,
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
    );
  }
}
