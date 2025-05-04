import 'package:flutter/material.dart';
import 'package:my_book_app/Custom%20Wedigt%20Design/book_information.dart';

import '../Custom Wedigt Design/custom_text.dart';
import '../Values/string.dart';

class ArchivesPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ArchivesPageState();
  } //createState ()
} //ArchivesPage class

class ArchivesPageState extends State<ArchivesPage> {
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
            size: 35,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        title: CustomText(
            text: AppStrings.archives,
            textAlign: TextAlign.center,
            fontSize: 16,
            textColor: Colors.black,
            fontWeight: FontWeight.w700),
      ),
      body: BookInformation(
          pageName: "archives",
          height: double.infinity,
          shrinkWrap: false,
          scrollDirection: Axis.vertical,
          crossAxisCount: 2,
          mainAxisExtent: 300,
          crossAxisSpacing: 0,
          mainAxisSpacing: 0,
        ),
    );
  } //build()
}//ArchivesPageState class