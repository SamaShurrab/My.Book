import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';

class CustomImageSvg extends StatelessWidget {
  final String imagePath;
  final Color? imageColor;
  final double height;
  final double width;

  const CustomImageSvg(
      {super.key,
      required this.imagePath,
      this.imageColor,
      required this.height,
      required this.width});
  @override
  Widget build(BuildContext context) {
    return Image(
      image: Svg(imagePath),
      color: imageColor,
      height: ScreenUtil().setHeight(height),
      width: ScreenUtil().setWidth(width),
    );
  } //build()
}//CustomImage class