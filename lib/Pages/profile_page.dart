import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_book_app/Custom%20Wedigt%20Design/custom_text.dart';
import 'package:my_book_app/Custom%20Wedigt%20Design/logout_dialog.dart';
import 'package:my_book_app/Pages/audio_books_page.dart';
import 'package:my_book_app/Pages/terms_and_conditions_page.dart';
import 'package:my_book_app/Values/colors.dart';
import 'package:my_book_app/Values/string.dart';

import '../Custom Wedigt Design/dialog_confirm_logout_from_app.dart';
import 'books_page.dart';
import 'home_page.dart';
import 'wishlist_page.dart';

/*
 A function that creates a custom transition path that 
 displays the new page with a Fade effect and bottom corners clipped using ClipRRect.
*/
Route createRouteProfile(Widget destination) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) {
      return ClipRRect(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(ScreenUtil().radius(20)),
          bottomRight: Radius.circular(ScreenUtil().radius(20)),
        ),
        child: destination,
      );
    },
  );
} //createRoute()

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});
  @override
  State<StatefulWidget> createState() {
    return ProfilePageState();
  } //createState()
} //ProfilePage class

class ProfilePageState extends State<ProfilePage> {
  List profileList = [
    AppStrings.editProfile,
    AppStrings.notifications,
    AppStrings.wishlist,
    AppStrings.termsOfUse,
    AppStrings.privacyPolicy,
    AppStrings.reportBug,
    AppStrings.logout
  ];

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) async {
        bool? confirm = await DialogConfirmLogoutFromApp.show(context);
        if (confirm == true) {
          SystemNavigator.pop();
        }
      },
      child: ClipRRect(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(ScreenUtil().radius(20)),
              bottomRight: Radius.circular(ScreenUtil().radius(20))),
          child: Scaffold(
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
              onTap: (value) {
                if (value == 0) {
                  Navigator.of(context).pushAndRemoveUntil(
                    createRouteProfile(BooksPage()),
                    (route) => false,
                  );
                } else if (value == 1) {
                  Navigator.of(context).pushAndRemoveUntil(
                    createRouteProfile(WishlistPage()),
                    (route) => false,
                  );
                }
                if (value == 2) {
                  Navigator.of(context).pushAndRemoveUntil(
                    createRouteProfile(HomePage()),
                    (route) => false,
                  );
                } else if (value == 3) {
                  Navigator.of(context).pushAndRemoveUntil(
                    createRouteProfile(AudioBooksPage()),
                    (route) => false,
                  );
                }
              },
              elevation: 0,
              currentIndex: 4,
              iconSize: 32,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              selectedItemColor: AppColors.tahitiGold,
              unselectedItemColor: Colors.grey[400],
            ),
            appBar: AppBar(
              automaticallyImplyLeading: false,
              leading: null,
              centerTitle: true,
              title: CustomText(
                  textData: AppStrings.profile,
                  textAlign: TextAlign.center,
                  fontSize: 16,
                  textColor: Colors.black,
                  fontWeight: FontWeight.w700),
            ),
            body: Container(
                margin: EdgeInsets.symmetric(
                    horizontal: ScreenUtil().setWidth(20),
                    vertical: ScreenUtil().setHeight(20)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: ScreenUtil().radius(35),
                          backgroundImage: AssetImage("images/user_img.png"),
                          backgroundColor: Colors.transparent,
                        ),
                        SizedBox(
                          width: ScreenUtil().setWidth(20),
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(
                                textData: "Sama Shurrab",
                                textAlign: TextAlign.start,
                                fontSize: 14,
                                textColor: Colors.black,
                                fontWeight: FontWeight.w600),
                            SizedBox(
                              height: ScreenUtil().setHeight(5),
                            ),
                            CustomText(
                                textData: "smshorap@gmail.com",
                                textAlign: TextAlign.start,
                                fontSize: 13,
                                textColor: AppColors.hintTextColor,
                                fontWeight: FontWeight.w600),
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      height: ScreenUtil().setHeight(25),
                    ),
                    ListView.separated(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (con, index) {
                          return InkWell(
                            highlightColor: Colors.transparent,
                            splashColor: Colors.transparent,
                            onTap: () {
                              if (profileList[index] == AppStrings.termsOfUse) {
                                Navigator.of(context)
                                    .push(MaterialPageRoute(builder: (context) {
                                  return TermsAndConditionsPage(
                                      routeName: "profile");
                                }));
                              } else if (profileList[index] ==
                                  AppStrings.privacyPolicy) {
                                Navigator.of(context).pushNamed("privacyPolicy");
                              } else if (profileList[index] ==
                                  AppStrings.editProfile) {
                                Navigator.of(context).pushNamed("editProfile");
                              } else if (profileList[index] ==
                                  AppStrings.logout) {
                                LogoutDialog.show(context);
                              } else if (profileList[index] ==
                                  AppStrings.wishlist) {
                                Navigator.of(context).pushAndRemoveUntil(
                                  createRouteProfile(WishlistPage()),
                                  (route) => false,
                                );
                              } else if (profileList[index] ==
                                  AppStrings.reportBug) {
                                Navigator.of(context).pushNamed("reportBug");
                              }
                            },
                            child: CustomText(
                                textData: profileList[index],
                                textAlign: TextAlign.start,
                                fontSize: 14,
                                textColor: Colors.black,
                                fontWeight: FontWeight.w600),
                          );
                        },
                        separatorBuilder: (context, index) {
                          return Divider(
                            color: AppColors.hintTextColor,
                            height: ScreenUtil().setHeight(30),
                          );
                        },
                        itemCount: profileList.length)
                  ],
                )),
          )),
    );
  } //build()
}//ProfilePageState class