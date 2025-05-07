import 'package:finan/app/core/services/custom_image_svg/custom_svg_image.dart';
import 'package:finan/app/core/theme/theme.dart';
import 'package:finan/app/core/theme/theme_sizes.dart';
import 'package:finan/app/core/utils/constants/app_assets_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  Image? image1;
  Image? image2;
  Image? image3;

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(milliseconds: 1500), () {
      Modular.to.navigate('/home');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColors.kPrimary,
      body: Center(
          child: CustomSvgImage(
        assetName: Assets.whiteLogo,
        height: ThemeSizes.h56,
        width: ThemeSizes.w172,
      )),
    );
  }
}
