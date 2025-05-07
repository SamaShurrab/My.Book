import 'package:flutter/material.dart';
import 'package:my_book_app/Custom%20Wedigt%20Design/book_information.dart';
import 'package:my_book_app/Custom%20Wedigt%20Design/custom_cliprpect_bottom.dart';
import 'package:my_book_app/Pages/home_page.dart';
import '../Custom Wedigt Design/create_route.dart';
import '../Custom Wedigt Design/custom_text.dart';
import '../Values/colors.dart';
import '../Values/string.dart';
import 'audio_books_page.dart';
import 'books_page.dart';
import 'profile_page.dart';

class WishlistPage extends StatefulWidget {
  const WishlistPage({super.key});
  @override
  State<StatefulWidget> createState() {
    return WishlistPageState();
  } //createState()
} //WishlistPage class

class WishlistPageState extends State<WishlistPage> {
  int currentIndex = 1;

  @override
  Widget build(BuildContext context) {
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
                  BottomNavigationBarItem(
                      icon: Icon(Icons.favorite), label: ""),
                  BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.headphones_rounded), label: ""),
                  BottomNavigationBarItem(icon: Icon(Icons.person), label: "")
                ],
                type: BottomNavigationBarType.fixed,
                backgroundColor: Colors.grey[100],
                onTap: (index) {
                  setState(() {
                    currentIndex = index;
                  });
                  if (index == 0) {
                    Navigator.of(context).pushAndRemoveUntil(
                      createRoute(BooksPage()),
                      (route) => false,
                    );
                  } else if (index == 2) {
                    Navigator.of(context).pushAndRemoveUntil(
                        createRoute(HomePage()), (route) => false);
                  } else if (index == 3) {
                    Navigator.of(context).pushAndRemoveUntil(
                        createRoute(AudioBooksPage()), (route) => false);
                  } else if (index == 4) {
                    Navigator.of(context).pushAndRemoveUntil(
                        createRoute(ProfilePage()), (route) => false);
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
                title: CustomText(
                    text: AppStrings.wishlist,
                    textAlign: TextAlign.center,
                    fontSize: 13,
                    textColor: Colors.black,
                    fontWeight: FontWeight.w700),
                leading: null,
              ),
              body: BookInformation(
                pageName: "wishlist",
                height: double.infinity,
                shrinkWrap: false,
                scrollDirection: Axis.vertical,
                crossAxisCount: 2,
                mainAxisExtent: 280,
                crossAxisSpacing: 0,
                mainAxisSpacing: 0,
              ))),
    );
  } //build()
}//WishlistPageState class