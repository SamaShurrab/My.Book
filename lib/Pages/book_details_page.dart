import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_book_app/Custom%20Wedigt%20Design/asset_image_widget.dart';
import 'package:my_book_app/Custom%20Wedigt%20Design/create_route.dart';
import 'package:my_book_app/Custom%20Wedigt%20Design/custom_drawer.dart';
import 'package:my_book_app/Pages/profile_page.dart';
import 'package:my_book_app/Values/colors.dart';
import 'package:my_book_app/Values/string.dart';

import '../Custom Wedigt Design/custom_buttom.dart';
import '../Custom Wedigt Design/custom_text.dart';

class BookDetailsPage extends StatelessWidget {
  final String bookImageUrl;
  final String bookName;
  final String bookAuthor;
  final double rating;
  final String bookDescription;
  const BookDetailsPage(
      {super.key,
      required this.bookImageUrl,
      required this.bookName,
      required this.bookAuthor,
      required this.rating,
      required this.bookDescription});
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            actions: [
              InkWell(
                  splashColor: Colors.transparent,
                  onTap: () {},
                  child: Icon(Icons.search)),
              SizedBox(
                width: ScreenUtil().setWidth(10),
              ),
              InkWell(
                  onTap: () {
                    Navigator.of(context).push(createRoute(ProfilePage()));
                  },
                  child: Icon(Icons.person_outline)),
              SizedBox(
                width: ScreenUtil().setWidth(10),
              )
            ],
            iconTheme: IconThemeData(color: Colors.white, size: 28),
            backgroundColor: Colors.transparent,
          ),
          drawer: CustomDrawer(
            pageName: "bookDetails",
          ),
          body: Stack(
            children: [
              Positioned.fill(
                child: AssetImageWidget(
                  imagePath: bookImageUrl,
                  fit: BoxFit.fill,
                ),
              ),
              DraggableScrollableSheet(
                  initialChildSize: 0.4,
                  minChildSize: 0.2,
                  maxChildSize: 0.80,
                  builder: (context, scrollController) {
                    return Container(
                      padding: EdgeInsets.all(20),
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.vertical(
                              top: Radius.circular(ScreenUtil().radius(10.r)))),
                      child: SingleChildScrollView(
                        controller: scrollController,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(
                              child: Container(
                                width: ScreenUtil().setWidth(75.w),
                                height: ScreenUtil().setHeight(2.h),
                                decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: ScreenUtil().setHeight(10.h),
                            ),
                            CustomText(
                                text: bookName,
                                textAlign: TextAlign.start,
                                fontSize: 13,
                                textColor: Colors.black,
                                fontWeight: FontWeight.w700),
                            SizedBox(
                              height: ScreenUtil().setHeight(3.h),
                            ),
                            CustomText(
                                text: bookAuthor,
                                textAlign: TextAlign.start,
                                fontSize: 12,
                                textColor: Colors.grey,
                                fontWeight: FontWeight.w600),
                            SizedBox(
                              height: ScreenUtil().setHeight(8.h),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                ...List.generate(
                                  5,
                                  (i) => Icon(
                                    i < rating
                                        ? Icons.star_rate
                                        : Icons.star_rate,
                                    color:
                                        i < rating ? Colors.amber : Colors.grey,
                                    size: 35,
                                  ),
                                ),
                                SizedBox(
                                  width: ScreenUtil().setWidth(20.w),
                                ),
                                CustomText(
                                    text: rating.toString(),
                                    textAlign: TextAlign.start,
                                    fontSize: 13,
                                    textColor: Colors.black,
                                    fontWeight: FontWeight.w700),
                                SizedBox(
                                  width: ScreenUtil().setWidth(20.w),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: ScreenUtil().setHeight(10.h),
                            ),
                            CustomText(
                                text: bookDescription,
                                textAlign: TextAlign.start,
                                fontSize: 11,
                                textColor: Colors.black,
                                fontWeight: FontWeight.w500),
                            SizedBox(
                              height: ScreenUtil().setHeight(20.h),
                            ),
                            CustomButton(
                              routeName: "shoppingCart",
                              buttonName: AppStrings.buyNow,
                              fontSize: 10,
                              fontWeight: FontWeight.w600,
                              textColor: Colors.white,
                              textAlign: TextAlign.center,
                              shapeBorder: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    ScreenUtil().radius(30)),
                              ),
                              background: AppColors.tahitiGold,
                              elevation: 0,
                              width: double.infinity,
                              height: 35,
                            ),
                            SizedBox(
                              height: ScreenUtil().setHeight(20.h),
                            ),
                          ],
                        ),
                      ),
                    );
                  })
            ],
          )),
    );
  } //build()
}//BookDetailsPage class