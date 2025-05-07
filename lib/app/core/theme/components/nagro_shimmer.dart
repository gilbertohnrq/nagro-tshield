// coverage:ignore-file
import 'package:finan/app/core/theme/theme_colors.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class NagroShimmer extends StatelessWidget {
  const NagroShimmer(
      {super.key,
      required this.height,
      this.width = double.infinity,
      this.borderRadius});

  final double height;
  final double width;
  final BorderRadius? borderRadius;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: ThemeColors.kShimmerBase,
      highlightColor: ThemeColors.kShimmerHighlight,
      child: Container(
        decoration:
            BoxDecoration(color: Colors.white, borderRadius: borderRadius),
        width: width,
        height: height,
      ),
    );
  }
}
