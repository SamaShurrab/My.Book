import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_book_app/Values/string.dart';

import '../Custom Wedigt Design/custom_text.dart';

class ShoppingCartPage extends StatefulWidget {
  const ShoppingCartPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return ShoppingCartPageState();
  } //createState()
} //ShoppingCartPage class

class ShoppingCartPageState extends State<ShoppingCartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: InkWell(
          onTap: () {
            Navigator.of(context).pushReplacementNamed("home");
          },
          child: Icon(
            Icons.arrow_back_ios_new,
            size: 25,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        actions: [
          InkWell(
            onTap: () {},
            child: Icon(
              Icons.delete_outline,
              size: 25,
              color: Colors.black54,
            ),
          ),
          SizedBox(
            width: ScreenUtil().setWidth(10.w),
          ),
        ],
        title: CustomText(
            text: AppStrings.shoppingCart,
            textAlign: TextAlign.center,
            fontSize: 13,
            textColor: Colors.black,
            fontWeight: FontWeight.w700),
      ),
    );
  } //build()
}//ShoppingCartPageState class