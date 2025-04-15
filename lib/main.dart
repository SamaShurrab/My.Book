import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_book_app/Pages/books_page.dart';
import 'package:my_book_app/Pages/choose_interest_page.dart';
import 'package:my_book_app/Pages/edit_profile_page.dart';
import 'package:my_book_app/Pages/privacy_policy_page.dart';
import 'package:my_book_app/Pages/profile_page.dart';
import 'package:my_book_app/Pages/report_bug_page.dart';
import 'package:my_book_app/Pages/wishlist_page.dart';
import 'Pages/home_page.dart';
import 'Pages/register_page.dart';
import 'Pages/reset_password_page.dart';
import 'Pages/signin_page.dart';
import 'Pages/welcome_page.dart';

void main() {
  // Be sure to configure the Binding
  WidgetsFlutterBinding.ensureInitialized();

// To change the color of the statusBar and the device's navigationBar, and change the color of the icons inside form
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: Colors.transparent,
      systemNavigationBarIconBrightness: Brightness.dark));

  // To determine the direction of the screen and make it only portrait(horizontal)
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp,
  ]).then((_) {
    runApp(MyApp());
  });
} //main()

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    /* 
      This library is used to put the measurements in which the application was designed in Figma or Adobexd,
      This library previews the measurements based on the design and the appropriate measurements of the rest of the screen sizes to suit them.
   */
    return ScreenUtilInit(
      // Here are the measurements of the size of the screen size on which the interfaces are designed in figma or Adobexd
      designSize: Size(288, 615),
      // in this function, the widget is built
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: "gilroy",
          scaffoldBackgroundColor: Colors.white,
          appBarTheme: AppBarTheme(
            backgroundColor: Colors.white,
            surfaceTintColor: Colors.white,
            elevation: 0,
          ),
        ),
        home: WekcomePage(),
        routes: {
          "home": (context) => HomePage(),
          "signin": (context) => SigninPage(),
          "register": (context) => RegisterPage(),
          "resetPasswordPage": (context) => ResetPasswordPage(),
          "profile": (context) => ProfilePage(),
          "privacyPolicy": (context) => PrivacyPolicyPage(),
          "editProfile": (context) => EditProfilePage(),
          "wishlist": (context) => WishlistPage(),
          "books": (context) => BooksPage(),
          "reportBug": (context) => ReportBugPage(),
          "chooseInterest": (context) => ChooseInterestPage(),
        },
      ),
    );
  } //build()
} //MyApp class
