// coverage:ignore-file
import 'package:finan/app/core/services/nagro_animation/nagro_animation_service.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class NagroAnimationServiceImpl implements NagroAnimationService {
  @override
  Widget buildAnimation({
    required String animationPath,
    double? height,
    double? width,
    Alignment alignment = Alignment.center,
    BoxFit fit = BoxFit.contain,
  }) {
    final isRemote = Uri.tryParse(animationPath)?.hasAbsolutePath ?? false;

    return IgnorePointer(
      ignoring: true,
      child: Container(
        height: height,
        width: width,
        alignment: alignment,
        child: isRemote
            ? RiveAnimation.network(
          animationPath,
          fit: fit,
          key: UniqueKey(),
          alignment: alignment,
        )
            : RiveAnimation.asset(
          animationPath,
          fit: fit,
          key: UniqueKey(),
          alignment: alignment,
        ),
      ),
    );
  }
}
