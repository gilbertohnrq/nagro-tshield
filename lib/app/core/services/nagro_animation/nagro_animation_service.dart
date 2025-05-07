// coverage:ignore-file
import 'package:flutter/material.dart';

abstract class NagroAnimationService {
  Widget buildAnimation({
    required String animationPath,
    double? height,
    double? width,
    Alignment alignment,
    BoxFit fit
  });
}