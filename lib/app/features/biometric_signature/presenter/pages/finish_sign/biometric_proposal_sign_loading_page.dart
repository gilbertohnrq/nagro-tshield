import 'package:auto_size_text/auto_size_text.dart';
import 'package:finan/app/core/theme/theme_colors.dart';
import 'package:finan/app/core/theme/theme_spacings.dart';
import 'package:finan/app/core/theme/theme_typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BiometricProposalSignLoadingPage extends StatefulWidget {
  const BiometricProposalSignLoadingPage({super.key});

  @override
  State<BiometricProposalSignLoadingPage> createState() =>
      _BiometricProposalSignLoadingPageState();
}

class _BiometricProposalSignLoadingPageState
    extends State<BiometricProposalSignLoadingPage>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;
  late final Animation<double> _progressAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 20),
    );

    _progressAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(_animationController);

    _animationController.forward();

    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: ThemeColors.kPrimary,
      statusBarIconBrightness: Brightness.light,
    ));
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ThemeColors.kPrimary,
        elevation: 0,
        toolbarHeight: 0,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: ThemeSpacings.s64),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                'assets/general/icon/ellipse.svg',
                width: 45,
                height: 45,
                colorFilter: const ColorFilter.mode(
                  ThemeColors.kTextBase,
                  BlendMode.srcIn,
                ),
              ),
              const SizedBox(height: ThemeSpacings.s16),
              AutoSizeText(
                'Estamos verificando se\nestá tudo certo, aguarde.',
                textAlign: TextAlign.center,
                textScaleFactor: 1,
                maxFontSize: 14,
                minFontSize: 12,
                style: ThemeTypography.sub1.copyWith(
                  color: ThemeColors.kTextBase,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: ThemeSpacings.s16),
              AnimatedBuilder(
                animation: _progressAnimation,
                builder: (context, child) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(7),
                    child: LinearProgressIndicator(
                      value: _progressAnimation.value,
                      minHeight: 6,
                      backgroundColor: ThemeColors.kBorder,
                      valueColor: const AlwaysStoppedAnimation(
                        ThemeColors.kTextBase,
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
