// coverage:ignore-file
import 'package:finan/app/core/services/custom_image_svg/custom_svg_image.dart';
import 'package:finan/app/core/theme/theme_colors.dart';
import 'package:finan/app/core/theme/theme_sizes.dart';
import 'package:finan/app/core/theme/theme_typography.dart';
import 'package:finan/app/core/utils/constants/app_assets_constants.dart';
import 'package:finan/app/core/utils/constants/app_strings_constants.dart';
import 'package:flutter/cupertino.dart';

class HeaderGreetingAppBar extends StatefulWidget {
  final EdgeInsets? padding;
  const HeaderGreetingAppBar({this.padding, super.key});

  @override
  State<HeaderGreetingAppBar> createState() => _HeaderGreetingAppBarState();
}

class _HeaderGreetingAppBarState extends State<HeaderGreetingAppBar> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        CustomSvgImage(
          assetName: Assets.whiteLogo,
          height: ThemeSizes.h22,
        ),
        const Spacer(),
        Text.rich(
          TextSpan(
            text: ola,
            style: bodyText2.copyWith(
              color: ThemeColors.kAccent,
            ),
            children: [
              TextSpan(
                text: '',
                style: headline3.copyWith(
                  color: ThemeColors.kAccent,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
