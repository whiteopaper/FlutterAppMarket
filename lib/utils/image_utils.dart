import 'package:flutter/material.dart';
import 'package:flutter_mmnes/utils/utils.dart';
import 'package:cached_network_image/cached_network_image.dart';

Widget loadBackground(int bgcolor, {double width, double height, BoxFit fit}) {
  return Container(
    color: Color(bgcolor),
    height: height,
    width: width,
  );
}

Widget loadBgColor(Color bgColor, {double width, double height, BoxFit fit}) {
  return Container(
    color: bgColor,
    height: height,
    width: width,
  );
}

// 加载本地资源图片
Widget loadAssetImage(String name, {double width, double height, BoxFit fit}) {
  return Image.asset(
    Utils.getImgPath(name),
    height: height,
    width: width,
    fit: fit,
  );
}



/// 加载网络图片
Widget loadNetworkImage(String imageUrl, {String placeholder : "none", double width, double height, BoxFit fit: BoxFit.cover}){
  print(imageUrl);
  return CachedNetworkImage(
    imageUrl: imageUrl == null ? "" : imageUrl,
    placeholder: (context, url) => loadAssetImage(placeholder, height: height, width: width, fit: fit),
    errorWidget: (context, url, error) => loadAssetImage(placeholder, height: height, width: width, fit: fit),
    width: width,
    height: height,
    fit: fit,
  );
}