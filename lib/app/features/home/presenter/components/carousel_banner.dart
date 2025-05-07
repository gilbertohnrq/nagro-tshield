// coverage:ignore-file
import 'dart:async';

import 'package:finan/app/core/theme/theme.dart';
import 'package:finan/app/core/theme/theme_sizes.dart';
import 'package:finan/app/core/utils/constants/app_constants.dart';
import 'package:flutter/material.dart';

class CarouselBanner extends StatefulWidget {
  final List<Widget> items;
  final Duration autoSlideInterval;

  const CarouselBanner({
    super.key,
    required this.items,
    this.autoSlideInterval = kSlideInterval,
  });

  @override
  State<CarouselBanner> createState() => _CarouselBannerState();
}

class _CarouselBannerState extends State<CarouselBanner> {
  late final PageController _pageController;
  int _currentIndex = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _startAutoSlide();
  }

  void _startAutoSlide() {
    _timer?.cancel();
    _timer = Timer.periodic(widget.autoSlideInterval, (timer) {
      if (_currentIndex < widget.items.length - 1) {
        _currentIndex++;
      } else {
        _currentIndex = 0;
      }
      _pageController.animateToPage(
        _currentIndex,
        duration: kAnimateToPageDuration,
        curve: Curves.easeInOut,
      );
      setState(() {});
    });
  }

  void _resetTimer() {
    _timer?.cancel();
    _startAutoSlide();
  }

  @override
  void dispose() {
    _pageController.dispose();
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final height = constraints.maxWidth * 0.5;
      return Column(
        children: [
          SizedBox(
            height: height.clamp(ThemeSizes.h150, ThemeSizes.h200),
            child: PageView.builder(
              controller: _pageController,
              itemCount: widget.items.length,
              onPageChanged: (index) {
                setState(() {
                  _currentIndex = index;
                });
                _resetTimer();
              },
              itemBuilder: (context, index) {
                return widget.items[index];
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: ThemeSpacings.s24,
              right: ThemeSpacings.s24,
              bottom: ThemeSpacings.s24,
            ),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    if (_currentIndex > 0) {
                      setState(() {
                        _currentIndex--;
                      });
                      _pageController.animateToPage(
                        _currentIndex,
                        duration: kTransitionDuration,
                        curve: Curves.easeInOut,
                      );
                      _resetTimer();
                    }
                  },
                  child: Icon(
                    Icons.arrow_back_ios,
                    size: ThemeSpacings.s20,
                    color: ThemeColors.kAccent
                        .withValues(alpha: _currentIndex == 0 ? 0.3 : 1),
                  ),
                ),
                const SizedBox(width: ThemeSpacings.s16),
                SizedBox(
                  height: ThemeSizes.h20,
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: widget.items.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(
                          right: ThemeSpacings.s16,
                        ),
                        child: Text(
                          (index + 1).toString(),
                          style: ThemeTypography.body2.copyWith(
                              color: ThemeColors.kAccent.withValues(
                                  alpha: _currentIndex == index ? 1 : 0.3),
                              fontWeight: FontWeight.w700),
                        ),
                      );
                    },
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    if (_currentIndex < (widget.items.length - 1)) {
                      setState(() {
                        _currentIndex++;
                      });
                      _pageController.animateToPage(
                        _currentIndex,
                        duration: kTransitionDuration,
                        curve: Curves.easeInOut,
                      );
                      _resetTimer();
                    }
                  },
                  child: Icon(
                    Icons.arrow_forward_ios,
                    size: ThemeSpacings.s20,
                    color: ThemeColors.kAccent.withValues(
                        alpha: _currentIndex == (widget.items.length - 1)
                            ? 0.3
                            : 1),
                  ),
                ),
              ],
            ),
          ),
        ],
      );
    });
  }
}
