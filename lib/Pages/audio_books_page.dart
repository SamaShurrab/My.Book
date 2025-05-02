import 'package:flutter/material.dart';
import 'package:my_book_app/Custom%20Wedigt%20Design/custom_cliprpect_bottom.dart';
import 'package:my_book_app/Pages/books_page.dart';
import 'package:my_book_app/Pages/home_page.dart';
import 'package:my_book_app/Pages/profile_page.dart';
import '../Custom Wedigt Design/custom_text.dart';
import '../Values/string.dart';
import 'wishlist_page.dart';

/*
 A function that creates a custom transition path that 
 displays the new page with bottom corners clipped using ClipRRect.
*/
Route createRouteAudioBooks(Widget destination) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) {
      return CustomClipRRectBottom(child: destination);
    },
  );
} //createRouteAudioBooks()

class AudioBooksPage extends StatefulWidget {
  const AudioBooksPage({super.key});
  @override
  State<StatefulWidget> createState() {
    return AudioBooksPageState();
  } //createState()
} // AudioBooksPage class

class AudioBooksPageState extends State<AudioBooksPage> {
  int currentIndex = 3;

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
              if (index == 0) {
                Navigator.of(context).pushAndRemoveUntil(
                  createRouteAudioBooks(BooksPage()),
                  (route) => false,
                );
              } else if (index == 1) {
                Navigator.of(context).pushAndRemoveUntil(
                    createRouteAudioBooks(WishlistPage()), (route) => false);
              } else if (index == 2) {
                Navigator.of(context).pushAndRemoveUntil(
                    createRouteAudioBooks(HomePage()), (route) => false);
              } else if (index == 4) {
                Navigator.of(context).pushAndRemoveUntil(
                    createRouteAudioBooks(ProfilePage()), (route) => false);
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
                text: AppStrings.audioBooks,
                textAlign: TextAlign.center,
                fontSize: 16,
                textColor: Colors.black,
                fontWeight: FontWeight.w700),
          ),
        )));
  } //build()
}//AudioBooksPageState class