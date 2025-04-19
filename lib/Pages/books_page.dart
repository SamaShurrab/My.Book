import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Custom Wedigt Design/custom_text.dart';
import '../Custom Wedigt Design/dialog_confirm_logout_from_app.dart';
import '../Values/colors.dart';
import '../Values/string.dart';
import 'audio_books_page.dart';
import 'home_page.dart';
import 'profile_page.dart';
import 'wishlist_page.dart';

/*
 A function that creates a custom transition path that 
 displays the new page with a Fade effect and bottom corners clipped using ClipRRect.
*/
Route createRouteBooks(Widget destination) {
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
} //creaeatRoute()

class BooksPage extends StatefulWidget {
  const BooksPage({super.key});
  @override
  State<StatefulWidget> createState() {
    return BooksPageState();
  } //createState()
} //BooksPage class

class BooksPageState extends State<BooksPage> {
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
                if (value == 1) {
                  Navigator.of(context).pushAndRemoveUntil(
                    createRouteBooks(WishlistPage()),
                    (route) => false,
                  );
                }
                if (value == 2) {
                  Navigator.of(context).pushAndRemoveUntil(
                    createRouteBooks(HomePage()),
                    (route) => false,
                  );
                } else if (value == 3) {
                  Navigator.of(context).pushAndRemoveUntil(
                    createRouteBooks(AudioBooksPage()),
                    (route) => false,
                  );
                } else if (value == 4) {
                  Navigator.of(context).pushAndRemoveUntil(
                    createRouteBooks(ProfilePage()),
                    (route) => false,
                  );
                }
              },
              elevation: 0,
              currentIndex: 0,
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
                  textData: AppStrings.books,
                  textAlign: TextAlign.center,
                  fontSize: 16,
                  textColor: Colors.black,
                  fontWeight: FontWeight.w700),
            ),
          )),
    );
  } //build()
}//BooksPageState class