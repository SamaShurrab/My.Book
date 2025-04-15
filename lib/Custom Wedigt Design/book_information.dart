import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_book_app/Custom%20Wedigt%20Design/custom_image_asset.dart';
import 'package:my_book_app/Custom%20Wedigt%20Design/custom_text.dart';
import 'package:my_book_app/Values/colors.dart';

class BookInformation extends StatefulWidget {
  final GlobalKey? bookKey;
  final Axis scrollDirection;
  final int crossAxisCount;
  final double mainAxisExtent;
  final double crossAxisSpacing;
  final double mainAxisSpacing;
  final bool shrinkWrap;
  final double height;
  final String pageName;
  const BookInformation(
      {super.key,
      this.bookKey,
      required this.pageName,
      required this.height,
      required this.shrinkWrap,
      required this.scrollDirection,
      required this.crossAxisSpacing,
      required this.crossAxisCount,
      required this.mainAxisExtent,
      required this.mainAxisSpacing});
  @override
  State<StatefulWidget> createState() {
    return BookInformationState();
  } //createState()
} //BookInformation class

class BookInformationState extends State<BookInformation> {
  List book = [
    {
      "bookName": "The Dumond Affair",
      "bookAuthor": "D.R. Bartlette",
      "bookImg": "images/The_Dumond_Affair.jpg",
      "favorite": true
    },
    {
      "bookName": "Long Road To Justice",
      "bookAuthor": "Bruce Hammack",
      "bookImg": "images/Long_Road_To_Justice.jpg",
      "favorite": false
    },
    {
      "bookName": "The Killing Complex",
      "bookAuthor": "K G Leslie",
      "bookImg": "images/The_Killing_Complex.jpg",
      "favorite": true
    },
    {
      "bookName": "The Invisible Man",
      "bookAuthor": "H. G. Wells",
      "bookImg": "images/The_Invisible_Man.jpg",
      "favorite": true
    },
    {
      "bookName": "The Dumond Affair",
      "bookAuthor": "D.R. Bartlette",
      "bookImg": "images/The_Dumond_Affair.jpg",
      "favorite": true
    },
    {
      "bookName": "Long Road To Justice",
      "bookAuthor": "Bruce Hammack",
      "bookImg": "images/Long_Road_To_Justice.jpg",
      "favorite": false
    },
    {
      "bookName": "The Killing Complex",
      "bookAuthor": "K G Leslie",
      "bookImg": "images/The_Killing_Complex.jpg",
      "favorite": true
    },
    {
      "bookName": "The Invisible Man",
      "bookAuthor": "H. G. Wells",
      "bookImg": "images/The_Invisible_Man.jpg",
      "favorite": true
    }
  ];

  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    List displayBooks = widget.pageName == "wishlist"
        ? book.where((item) => item["favorite"] == true).toList()
        : book;

    return SizedBox(
      width: double.infinity,
      height: ScreenUtil().setHeight(widget.height),
      child: GridView.builder(
        physics: BouncingScrollPhysics(),
        shrinkWrap: widget.shrinkWrap,
        scrollDirection: widget.scrollDirection,
        itemCount: displayBooks.length,
        itemBuilder: (context, index) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              InkWell(
                splashColor: Colors.transparent,
                onTap: () {},
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(ScreenUtil().radius(15)),
                  child: CustomImage(
                    imagePath: displayBooks[index]["bookImg"],
                    fit: BoxFit.fill,
                    width: 150,
                    height: 210,
                  ),
                ),
              ),
              SizedBox(
                height: ScreenUtil().setHeight(10),
              ),
              InkWell(
                splashColor: Colors.transparent,
                onTap: () {},
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: ScreenUtil().setWidth(5)),
                  child: CustomText(
                      textData: displayBooks[index]["bookName"],
                      textAlign: TextAlign.center,
                      fontSize: 11,
                      textColor: Colors.black,
                      fontWeight: FontWeight.w600),
                ),
              ),
              SizedBox(
                height: ScreenUtil().setHeight(5),
              ),
              InkWell(
                splashColor: Colors.transparent,
                onTap: () {},
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      flex: 4,
                      child: CustomText(
                          textData: displayBooks[index]["bookAuthor"],
                          textAlign: TextAlign.center,
                          fontSize: 11,
                          textColor: AppColors.hintTextColor,
                          fontWeight: FontWeight.w600),
                    ),
                    Expanded(
                        child: InkWell(
                            splashColor: Colors.transparent,
                            onTap: () {
                              setState(() {
                                displayBooks[index]["favorite"] =
                                    !displayBooks[index]["favorite"];
                              });
                            },
                            child: Icon(
                              displayBooks[index]["favorite"]
                                  ? Icons.favorite
                                  : Icons.favorite_border,
                              size: 25,
                              color: displayBooks[index]["favorite"]
                                  ? Colors.red
                                  : Colors.black,
                            )))
                  ],
                ),
              )
            ],
          );
        },
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: widget.crossAxisCount,
            mainAxisExtent: widget.mainAxisExtent,
            crossAxisSpacing: widget.crossAxisSpacing,
            mainAxisSpacing: widget.mainAxisSpacing),
      ),
    );
  } //build()
}//BookInformationState class