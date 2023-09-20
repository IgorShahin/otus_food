import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:otus_food/common/res/app_assets.dart';

class AppImage extends StatelessWidget {
  final AppImageData data;
  final double? width;
  final double? height;
  final Color? color;
  final BoxFit? fit;

  const AppImage(this.data,
      {Key? key, this.width, this.height, this.color, this.fit})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      "assets/images/${data.name}",
      width: width,
      color: color,
      height: height,
      fit: fit,
    );
  }
}
