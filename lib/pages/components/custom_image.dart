import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
class CustomImageNetwork extends StatelessWidget {
  final String? image;
  final double height;
  final double width;
  final double radius;
  final BoxFit boxFit;

  const CustomImageNetwork(
      {Key? key,
        required this.image,
        this.height = 120,
        this.width = 120,
        this.radius = 16,  this.boxFit=BoxFit.contain })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(radius),
        child: CachedNetworkImage(
          fit: boxFit,
          imageUrl: image ?? "",
          progressIndicatorBuilder: (context, text, DownloadProgress value) {
            return Center(child: CircularProgressIndicator(),);
          },
          errorWidget: (context, _, __) {
            return const Icon(Icons.error);
          },
        ),
      ),
    );
  }
}