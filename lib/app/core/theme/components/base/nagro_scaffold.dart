// coverage:ignore-file
import 'package:finan/app/core/theme/components/base/nagro_app_bar.dart';
import 'package:finan/app/core/theme/theme.dart';
import 'package:flutter/material.dart';

class NagroScaffold extends StatelessWidget {
  const NagroScaffold({
    super.key,
    required this.child,
    this.hasLeading = true,
    this.bottomNavigationBar,
    this.leading,
    this.padding,
    this.hasAppbar = true,
    this.resizeToAvoidBottomInset = false,
    this.appBarTitle,
    this.floatingActionButton,
    this.floatingActionButtonLocation,
    this.appBarColor,
    this.appBarTextStyle,
    this.backgroundColor = ThemeColors.kAccent,
    this.onTapAppBarBack,
    this.actions = const [],
  });

  final Widget child;
  final bool hasLeading;
  final Widget? bottomNavigationBar;
  final Widget? leading;
  final EdgeInsets? padding;
  final bool? hasAppbar;
  final bool resizeToAvoidBottomInset;
  final String? appBarTitle;
  final Widget? floatingActionButton;
  final FloatingActionButtonLocation? floatingActionButtonLocation;
  final Color? appBarColor;
  final TextStyle? appBarTextStyle;
  final Color? backgroundColor;
  final dynamic Function()? onTapAppBarBack;
  final List<Widget> actions;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: resizeToAvoidBottomInset,
      appBar: hasAppbar == true
          ? NagroAppBar(
              hasLeading: hasLeading,
              onTap: onTapAppBarBack,
              leading: leading,
              title: appBarTitle,
              appBarColor: appBarColor,
              textStyle: appBarTextStyle,
              actions: actions,
            )
          : null,
      backgroundColor: backgroundColor,
      bottomNavigationBar: bottomNavigationBar,
      floatingActionButton: floatingActionButton,
      floatingActionButtonLocation: floatingActionButtonLocation,
      body: Padding(
        padding: padding ??
            const EdgeInsets.symmetric(
              horizontal: ThemeSpacings.s32,
            ),
        child: child,
      ),
    );
  }
}
