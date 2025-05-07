// coverage:ignore-file
import 'package:finan/app/core/theme/theme_colors.dart';
import 'package:finan/app/features/home/presenter/components/carousel_banner.dart';
import 'package:flutter/material.dart';

class HeaderContent extends StatelessWidget {
  final List<Widget> carouselItems;
  const HeaderContent({super.key, required this.carouselItems});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: ThemeColors.kBasePageGradient,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [CarouselBanner(items: carouselItems)],
      ),
    );
  }
}
