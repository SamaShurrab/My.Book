import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_book_app/Pages/books_page.dart';
import 'package:my_book_app/Pages/home_page.dart';
import 'package:my_book_app/Pages/profile_page.dart';

import '../Custom Wedigt Design/custom_text.dart';
import '../Values/colors.dart';
import '../Values/string.dart';
import 'wishlist_page.dart';

/*
 A function that creates a custom transition path that 
 displays the new page with a Fade effect and bottom corners clipped using ClipRRect.
*/
Route creatRoute(Widget destanation) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) {
      return ClipRRect(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(ScreenUtil().radius(20)),
              bottomRight: Radius.circular(ScreenUtil().radius(20))),
          child: destanation);
    },
  );
} //creatRoute()

class AudioBooksPage extends StatefulWidget {
  const AudioBooksPage({super.key});
  @override
  State<StatefulWidget> createState() {
    return AudioBooksPageState();
  } //createState()
} // AudioBooksPage class

class AudioBooksPageState extends State<AudioBooksPage> {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
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
                Navigator.of(context).push(creatRoute(BooksPage()));
              } else if (value == 1) {
                Navigator.of(context).push(creatRoute(WishlistPage()));
              } else if (value == 2) {
                Navigator.of(context).push(creatRoute(HomePage()));
              } else if (value == 4) {
                Navigator.of(context).push(creatRoute(ProfilePage()));
              }
            },
            elevation: 0,
            currentIndex: 3,
            iconSize: 32,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            selectedItemColor: AppColors.tahitiGold,
            unselectedItemColor: Colors.grey[400],
          ),
          appBar: AppBar(
            centerTitle: true,
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
            title: CustomText(
                textData: AppStrings.audioBooks,
                textAlign: TextAlign.center,
                fontSize: 16,
                textColor: Colors.black,
                fontWeight: FontWeight.w700),
          ),
        ));
  } //build()
}//AudioBooksPageState class