// coverage:ignore-file
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomSvgImage extends StatelessWidget {
  final String assetName;
  final double? width;
  final double? height;
  final ColorFilter? colorFilter;
  final BoxFit fit;

  const CustomSvgImage(
      {super.key,
      required this.assetName,
      this.width,
      this.height,
      this.colorFilter,
      this.fit = BoxFit.contain});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      assetName,
      width: width,
      height: height,
      colorFilter: colorFilter,
      fit: fit,
    );
  }
}
