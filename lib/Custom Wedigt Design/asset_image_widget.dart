import "package:flutter/material.dart";

// This class is for image design (png,jpeg,etc...).
class AssetImageWidget extends StatelessWidget {
  final String imagePath;
  final double? width;
  final BoxFit? fit;
  final double? height;
  final Alignment alignment;

  const AssetImageWidget(
      {super.key,
      required this.imagePath,
      this.width,
      this.fit,
      this.height,
      this.alignment = Alignment.center});
  @override
  Widget build(BuildContext context) {
    return Image.asset(
      imagePath,
      width: width,
      fit: fit,
      height: height,
      alignment: alignment,
      errorBuilder: (context, error, stackTrace) => Icon(
        Icons.broken_image_rounded,
        size: 48,
        color: Colors.black,
      ),
    );
  } //build()
}//AssetImageWidget  class