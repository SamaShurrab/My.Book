import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_book_app/Custom%20Wedigt%20Design/book_information.dart';
import 'package:my_book_app/Pages/home_page.dart';

import '../Custom Wedigt Design/custom_text.dart';
import '../Values/colors.dart';
import '../Values/string.dart';
import 'audio_books_page.dart';
import 'books_page.dart';
import 'profile_page.dart';

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

class WishlistPage extends StatefulWidget {
  const WishlistPage({super.key});
  @override
  State<StatefulWidget> createState() {
    return WishlistPageState();
  } //createState()
} //WishlistPage class

class WishlistPageState extends State<WishlistPage> {
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
                }
                if (value == 2) {
                  Navigator.of(context).push(creatRoute(HomePage()));
                } else if (value == 3) {
                  Navigator.of(context).push(creatRoute(AudioBooksPage()));
                } else if (value == 4) {
                  Navigator.of(context).push(creatRoute(ProfilePage()));
                }
              },
              elevation: 0,
              currentIndex: 1,
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
                  textData: AppStrings.wishlist,
                  textAlign: TextAlign.center,
                  fontSize: 16,
                  textColor: Colors.black,
                  fontWeight: FontWeight.w700),
            ),
            body: BookInformation(
              pageName: "wishlist",
              height: double.infinity,
              shrinkWrap: false,
              scrollDirection: Axis.vertical,
              crossAxisCount: 2,
              mainAxisExtent: 300,
              crossAxisSpacing: 0,
              mainAxisSpacing: 0,
            )));
  } //build()
}//WishlistPageState class