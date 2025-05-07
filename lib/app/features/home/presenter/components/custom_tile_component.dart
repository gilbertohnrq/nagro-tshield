// coverage:ignore-file
import 'package:finan/app/core/theme/theme_colors.dart';
import 'package:finan/app/core/theme/theme_sizes.dart';
import 'package:finan/app/core/theme/theme_spacings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomTile extends StatelessWidget {
  final String? image;
  final String title;
  final String? subtitle;
  final String route;
  final IconData? icon;
  final VoidCallback? onPressed;

  const CustomTile({
    super.key,
    this.image,
    required this.title,
    this.subtitle,
    required this.route,
    this.icon,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed ??
          () {
            Modular.to.pushNamed(route);
          },
      child: SizedBox(
        height: ThemeSizes.h40,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                icon != null
                    ? Icon(icon, size: 24, color: ThemeColors.kPrimary)
                    : SvgPicture.asset(image!),
                const SizedBox(width: ThemeSpacings.s16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: ThemeSizes.sp12,
                        fontFamily: 'Poppins',
                        color: ThemeColors.kPrimary,
                      ),
                    ),
                    if (subtitle != null)
                      Text(
                        subtitle!,
                        style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: ThemeSizes.sp12,
                          fontFamily: 'Poppins',
                          color: ThemeColors.kGray100,
                        ),
                      ),
                  ],
                ),
              ],
            ),
            const Icon(Icons.arrow_forward_ios,
                size: 16, color: ThemeColors.kPrimary),
          ],
        ),
      ),
    );
  }
}
