// coverage:ignore-file
import 'package:finan/app/core/services/nagro_animation/nagro_animation_service.dart';
import 'package:finan/app/core/theme/theme_sizes.dart';
import 'package:flutter/material.dart';

class AnimationPositioned extends StatelessWidget {
  final String animationPath;
  final double right;
  final double top;
  final NagroAnimationService nagroAnimation;

  const AnimationPositioned({
    super.key,
    required this.animationPath,
    required this.right,
    required this.top,
    required this.nagroAnimation,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: right,
      top: top,
      child: nagroAnimation.buildAnimation(
        animationPath: animationPath,
        fit: BoxFit.fitWidth,
        alignment: Alignment.centerRight,
        height: ThemeSizes.h648,
        width: ThemeSizes.h388,
      ),
    );
  }
}
