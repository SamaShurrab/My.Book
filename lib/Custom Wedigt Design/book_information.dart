import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_book_app/Classes/book.dart';
import 'package:my_book_app/Pages/book_details_page.dart';
import 'asset_image_widget.dart';
import 'package:my_book_app/Custom%20Wedigt%20Design/custom_text.dart';
import 'package:my_book_app/Values/colors.dart';

/* 
  This class expresses a design to display book information such as 
  the book title, author, and book image based on each interface in which it is called.
*/
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
  // list to store book data
  List<Book> bookDetails = [
    Book(
        bookTitle: "The Dumond Affair",
        authorName: "D.R. Bartlette",
        bookImage: "images/The_Dumond_Affair.jpg",
        isFavorite: true,
        isSaved: true,
        rating: 4,
        bookDescription:
            "'Fight, survive again, and I think your owner will continue to back you. Or don't and you can leave. You'd be in separate bags of course. They usually burn the remains. Cassie left her constrained life in England for a brighter future in Europe, but now she's a captive of the Complex, trapped in a small cage with a collar around her throat, given artificial strength and forced to battle for her life. Her hope and humanity can only last so long in this new world of violence and isolation, and she's turning into one of the dangerous animals she must fight. But when she finds a saviour for her soul, Cassie will have to face up to the trauma she has endured and the horror she has caused.The Killing Complex is a fast-paced survival thriller and the first book in the Killing Saga."),
    Book(
        bookTitle: "Long Road To Justice",
        authorName: "Bruce Hammack",
        bookImage: "images/Long_Road_To_Justice.jpg",
        isFavorite: false,
        isSaved: true,
        rating: 2,
        bookDescription:
            "'Fight, survive again, and I think your owner will continue to back you. Or don't and you can leave. You'd be in separate bags of course. They usually burn the remains. Cassie left her constrained life in England for a brighter future in Europe, but now she's a captive of the Complex, trapped in a small cage with a collar around her throat, given artificial strength and forced to battle for her life. Her hope and humanity can only last so long in this new world of violence and isolation, and she's turning into one of the dangerous animals she must fight. But when she finds a saviour for her soul, Cassie will have to face up to the trauma she has endured and the horror she has caused.The Killing Complex is a fast-paced survival thriller and the first book in the Killing Saga."),
    Book(
        bookTitle: "The Killing Complex",
        authorName: "K G Leslie",
        bookImage: "images/The_Killing_Complex.jpg",
        isFavorite: true,
        isSaved: false,
        rating: 1,
        bookDescription:
            "'Fight, survive again, and I think your owner will continue to back you. Or don't and you can leave. You'd be in separate bags of course. They usually burn the remains. Cassie left her constrained life in England for a brighter future in Europe, but now she's a captive of the Complex, trapped in a small cage with a collar around her throat, given artificial strength and forced to battle for her life. Her hope and humanity can only last so long in this new world of violence and isolation, and she's turning into one of the dangerous animals she must fight. But when she finds a saviour for her soul, Cassie will have to face up to the trauma she has endured and the horror she has caused.The Killing Complex is a fast-paced survival thriller and the first book in the Killing Saga."),
    Book(
        bookTitle: "The Invisible Man",
        authorName: "H. G. Wells",
        bookImage: "images/The_Invisible_Man.jpg",
        isFavorite: false,
        isSaved: false,
        rating: 3,
        bookDescription:
            "'Fight, survive again, and I think your owner will continue to back you. Or don't and you can leave. You'd be in separate bags of course. They usually burn the remains. Cassie left her constrained life in England for a brighter future in Europe, but now she's a captive of the Complex, trapped in a small cage with a collar around her throat, given artificial strength and forced to battle for her life. Her hope and humanity can only last so long in this new world of violence and isolation, and she's turning into one of the dangerous animals she must fight. But when she finds a saviour for her soul, Cassie will have to face up to the trauma she has endured and the horror she has caused.The Killing Complex is a fast-paced survival thriller and the first book in the Killing Saga."),
    Book(
        bookTitle: "The Dumond Affair",
        authorName: "D.R. Bartlette",
        bookImage: "images/The_Dumond_Affair.jpg",
        isFavorite: true,
        isSaved: false,
        rating: 5,
        bookDescription:
            "'Fight, survive again, and I think your owner will continue to back you. Or don't and you can leave. You'd be in separate bags of course. They usually burn the remains. Cassie left her constrained life in England for a brighter future in Europe, but now she's a captive of the Complex, trapped in a small cage with a collar around her throat, given artificial strength and forced to battle for her life. Her hope and humanity can only last so long in this new world of violence and isolation, and she's turning into one of the dangerous animals she must fight. But when she finds a saviour for her soul, Cassie will have to face up to the trauma she has endured and the horror she has caused.The Killing Complex is a fast-paced survival thriller and the first book in the Killing Saga."),
    Book(
        bookTitle: "Long Road To Justice",
        authorName: "Bruce Hammack",
        bookImage: "images/Long_Road_To_Justice.jpg",
        isFavorite: false,
        isSaved: false,
        rating: 3,
        bookDescription:
            "'Fight, survive again, and I think your owner will continue to back you. Or don't and you can leave. You'd be in separate bags of course. They usually burn the remains. Cassie left her constrained life in England for a brighter future in Europe, but now she's a captive of the Complex, trapped in a small cage with a collar around her throat, given artificial strength and forced to battle for her life. Her hope and humanity can only last so long in this new world of violence and isolation, and she's turning into one of the dangerous animals she must fight. But when she finds a saviour for her soul, Cassie will have to face up to the trauma she has endured and the horror she has caused.The Killing Complex is a fast-paced survival thriller and the first book in the Killing Saga."),
    Book(
        bookTitle: "The Killing Complex",
        authorName: "K G Leslie",
        bookImage: "images/The_Killing_Complex.jpg",
        isFavorite: false,
        isSaved: true,
        rating: 0,
        bookDescription:
            "'Fight, survive again, and I think your owner will continue to back you. Or don't and you can leave. You'd be in separate bags of course. They usually burn the remains. Cassie left her constrained life in England for a brighter future in Europe, but now she's a captive of the Complex, trapped in a small cage with a collar around her throat, given artificial strength and forced to battle for her life. Her hope and humanity can only last so long in this new world of violence and isolation, and she's turning into one of the dangerous animals she must fight. But when she finds a saviour for her soul, Cassie will have to face up to the trauma she has endured and the horror she has caused.The Killing Complex is a fast-paced survival thriller and the first book in the Killing Saga."),
    Book(
        bookTitle: "The Invisible Man",
        authorName: "H. G. Wells",
        bookImage: "images/The_Invisible_Man.jpg",
        isFavorite: true,
        isSaved: true,
        rating: 2,
        bookDescription:
            "'Fight, survive again, and I think your owner will continue to back you. Or don't and you can leave. You'd be in separate bags of course. They usually burn the remains. Cassie left her constrained life in England for a brighter future in Europe, but now she's a captive of the Complex, trapped in a small cage with a collar around her throat, given artificial strength and forced to battle for her life. Her hope and humanity can only last so long in this new world of violence and isolation, and she's turning into one of the dangerous animals she must fight. But when she finds a saviour for her soul, Cassie will have to face up to the trauma she has endured and the horror she has caused.The Killing Complex is a fast-paced survival thriller and the first book in the Killing Saga."),
  ];

  late List<Book> filteredBook;

  @override
  void initState() {
    super.initState();
    /*
      Here we filter the list so that each interface will display specific books. 
      For example, the Favorites interface will display the books that the user liked, 
      while the books that the user saved will be displayed in the Archives interface, 
      and in the Book interface all books will be displayed.
    */
    if (widget.pageName == "wishlist") {
      filteredBook =
          bookDetails.where((item) => item.isFavorite == true).toList();
    } else if (widget.pageName == "archives") {
      filteredBook = bookDetails.where((item) => item.isSaved == true).toList();
    } else {
      filteredBook = bookDetails;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: ScreenUtil().setHeight(widget.height.h),
      child: GridView.builder(
        shrinkWrap: widget.shrinkWrap,
        scrollDirection: widget.scrollDirection,
        itemCount: filteredBook.length,
        itemBuilder: (context, index) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Stack(
                children: [
                  InkWell(
                    splashColor: Colors.transparent,
                    onTap: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return BookDetailsPage(
                          bookImageUrl: filteredBook[index].bookImage,
                          bookName: filteredBook[index].bookTitle,
                          bookAuthor: filteredBook[index].authorName,
                          rating: filteredBook[index].rating,
                          bookDescription: filteredBook[index].bookDescription,
                        );
                      }));
                    },
                    child: ClipRRect(
                      borderRadius:
                          BorderRadius.circular(ScreenUtil().radius(15.r)),
                      child: AssetImageWidget(
                        imagePath: filteredBook[index].bookImage,
                        fit: BoxFit.fill,
                        width: 120.w,
                        height: 180.h,
                      ),
                    ),
                  ),
                  Positioned(
                      left: 10,
                      top: 10,
                      child: Container(
                        width: ScreenUtil().setWidth(20.w),
                        height: ScreenUtil().setHeight(25.h),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(
                                ScreenUtil().radius(5.r))),
                        child: InkWell(
                            splashColor: Colors.transparent,
                            onTap: () {
                              setState(() {
                                // This variable represents the book that the heart icon was clicked on.
                                final book = filteredBook[index];

                                // This variable represents the index of the book whose data was taken from the filteredBook.
                                final int bookIndex = bookDetails.indexOf(book);

                                // To modify the value of the isSaved property each time the user clicks the heart icon in bookDetails.
                                if (bookIndex != -1) {
                                  bookDetails[bookIndex].isSaved =
                                      !bookDetails[bookIndex].isSaved;
                                } //if()

                                // To update the filteredBook after each click on the heart icon for the wishlist page.
                                if (widget.pageName == "archives") {
                                  filteredBook = bookDetails
                                      .where((item) => item.isSaved)
                                      .toList();
                                } //if()
                              });
                            },
                            child: Icon(
                                filteredBook[index].isSaved
                                    ? Icons.bookmark
                                    : Icons.bookmark_border_outlined,
                                size: 30,
                                color: Colors.black)),
                      ))
                ],
              ),
              SizedBox(
                height: ScreenUtil().setHeight(8.h),
              ),
              InkWell(
                splashColor: Colors.transparent,
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return BookDetailsPage(
                      bookImageUrl: filteredBook[index].bookImage,
                      bookName: filteredBook[index].bookTitle,
                      bookAuthor: filteredBook[index].authorName,
                      rating: filteredBook[index].rating,
                      bookDescription: filteredBook[index].bookDescription,
                    );
                  }));
                },
                child: CustomText(
                    text: filteredBook[index].bookTitle,
                    textAlign: TextAlign.center,
                    fontSize: 8,
                    textColor: Colors.black,
                    fontWeight: FontWeight.w700),
              ),
              SizedBox(
                height: ScreenUtil().setHeight(2.h),
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
                          text: filteredBook[index].authorName,
                          textAlign: TextAlign.center,
                          fontSize: 8,
                          textColor: AppColors.hintTextColor,
                          fontWeight: FontWeight.w700),
                    ),
                    Expanded(
                        child: InkWell(
                            splashColor: Colors.transparent,
                            onTap: () {
                              setState(() {
                                // This variable represents the book that the heart icon was clicked on.
                                final book = filteredBook[index];

                                // This variable represents the index of the book whose data was taken from the filteredBook.
                                final int bookIndex = bookDetails.indexOf(book);

                                // To modify the value of the isFavorite property each time the user clicks the heart icon in bookDetails.
                                if (bookIndex != -1) {
                                  bookDetails[bookIndex].isFavorite =
                                      !bookDetails[bookIndex].isFavorite;
                                } //if()

                                // To update the filteredBook after each click on the heart icon for the wishlist page.
                                if (widget.pageName == "wishlist") {
                                  filteredBook = bookDetails
                                      .where((item) => item.isFavorite)
                                      .toList();
                                } //if()
                              });
                            },
                            child: Icon(
                              filteredBook[index].isFavorite
                                  ? Icons.favorite
                                  : Icons.favorite_border,
                              size: 25,
                              color: filteredBook[index].isFavorite
                                  ? Colors.red
                                  : Colors.black,
                            ))),
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