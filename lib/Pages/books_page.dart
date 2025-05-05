import 'package:flutter/material.dart';
import 'package:my_book_app/Custom%20Wedigt%20Design/book_information.dart';
import 'package:my_book_app/Custom%20Wedigt%20Design/custom_cliprpect_bottom.dart';
import '../Custom Wedigt Design/create_route.dart';
import '../Custom Wedigt Design/custom_text.dart';
import '../Values/string.dart';
import 'audio_books_page.dart';
import 'home_page.dart';
import 'profile_page.dart';
import 'wishlist_page.dart';

class BooksPage extends StatefulWidget {
  const BooksPage({super.key});
  @override
  State<StatefulWidget> createState() {
    return BooksPageState();
  } //createState()
} //BooksPage class

class BooksPageState extends State<BooksPage> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    /* 
      This is used to display a dialog when going back,
      so the user is shown a dialog telling him if he is sure to exit the application. 
    */
    return PopScope(
      canPop: false,
      child: CustomClipRRectBottom(
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

          // To move between interfaces through bottomNavigationBar
          onTap: (index) {
            setState(() {
              currentIndex = index;
            });
            if (index == 2) {
              Navigator.of(context).pushAndRemoveUntil(
                createRoute(HomePage()),
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
          currentIndex: currentIndex,
          iconSize: 32,
        ),
        appBar: AppBar(
          automaticallyImplyLeading: false,
          leading: null,
          centerTitle: true,
          title: CustomText(
              text: AppStrings.books,
              textAlign: TextAlign.center,
              fontSize: 13,
              textColor: Colors.black,
              fontWeight: FontWeight.w700),
        ),
        body: BookInformation(
          pageName: "book",
          height: double.infinity,
          shrinkWrap: false,
          scrollDirection: Axis.vertical,
          crossAxisCount: 2,
          mainAxisExtent: 300,
          crossAxisSpacing: 0,
          mainAxisSpacing: 0,
        ),
      )),
    );
  } //build()
}//BooksPageState class