import 'package:flutter/widgets.dart';
import 'package:my_book_app/Custom%20Wedigt%20Design/custom_cliprpect_bottom.dart';

Route createRoute(Widget destination) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) {
      return CustomClipRRectBottom(child: destination);
    },
  );
} 