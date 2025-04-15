import 'package:flutter/material.dart';

class MySearch extends SearchDelegate {
  final List books;
  MySearch({required this.books});
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: Icon(
            Icons.clear,
            size: 30,
            color: Colors.red,
          ))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: Icon(
          Icons.arrow_back,
          color: Colors.black,
          size: 30,
        ));
  }

  @override
  Widget buildResults(BuildContext context) {
    return Text("Result");
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Text("suggextions");
  }
}
