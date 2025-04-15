import 'package:flutter/material.dart';

class CustomImage extends StatelessWidget {
  final String imagePath;
  final double? width;
  final BoxFit? fit;
  final double? height;

  const CustomImage({super.key, required this.imagePath, this.width, this.fit,this.height});
  @override
  Widget build(BuildContext context) {
    return Image.asset(
      width: width,
      imagePath,
      fit: fit,
      height: height,
    );
  } //build()
}//CustomImage class