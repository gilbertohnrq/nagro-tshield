// coverage:ignore-file
import 'package:finan/app/core/theme/theme_colors.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class LoadingAnimation extends StatelessWidget {
  const LoadingAnimation({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: LoadingAnimationWidget.progressiveDots(
        color: ThemeColors.kPrimary,
        size: 100,
      ),
    );
  }
}
