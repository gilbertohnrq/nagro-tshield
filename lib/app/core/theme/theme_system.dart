// coverage:ignore-file
import 'package:finan/app/core/theme/theme.dart';
import 'package:finan/app/core/theme/theme_sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ThemeSystem {
  ThemeSystem._();

  static ThemeData get theme => ThemeData(
        useMaterial3: false,
        brightness: Brightness.light,
        primaryColor: ThemeColors.kPrimary,
        scaffoldBackgroundColor: ThemeColors.kAccent,
        fontFamily: 'Poppins',
        textTheme: ThemeTypography.textTheme,
        primaryTextTheme: ThemeTypography.textTheme,
        appBarTheme: AppBarTheme(
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarIconBrightness: Brightness.light,
            systemStatusBarContrastEnforced: true,
          ),
          iconTheme: const IconThemeData(
            color: ThemeColors.kAccent,
          ),
          titleTextStyle: ThemeTypography.headline5.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        listTileTheme: const ListTileThemeData(tileColor: ThemeColors.kAccent),
        checkboxTheme: CheckboxThemeData(
          fillColor: WidgetStateProperty.all(ThemeColors.kAccent),
          checkColor: WidgetStateProperty.all(ThemeColors.kAccent),
          overlayColor: WidgetStateProperty.all(ThemeColors.kPrimary),
          side: const BorderSide(color: ThemeColors.kPrimary),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(ThemeRadius.r4),
            side: const BorderSide(color: ThemeColors.kPrimary),
          ),
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          showUnselectedLabels: false,
          backgroundColor: ThemeColors.kAccent,
          selectedItemColor: ThemeColors.kPrimary,
          unselectedItemColor: ThemeColors.kGray,
          selectedLabelStyle:
              ThemeTypography.body3.copyWith(fontSize: ThemeSizes.sp10),
          unselectedLabelStyle:
              ThemeTypography.body3.copyWith(fontSize: ThemeSizes.sp10),
        ),
        inputDecorationTheme: ThemeDecorations.inputDecorationTheme,
        bottomSheetTheme: const BottomSheetThemeData(
          backgroundColor: ThemeColors.kAccent,
          modalBackgroundColor: ThemeColors.kAccent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(ThemeRadius.r8),
            ),
          ),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: ButtonStyle(
            side: WidgetStateProperty.all(
              const BorderSide(
                color: ThemeColors.kPrimary,
                width: 1,
              ),
            ),
            shape: WidgetStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(ThemeRadius.r8),
              ),
            ),
            padding: WidgetStateProperty.all(
              const EdgeInsets.symmetric(
                vertical: ThemeSpacings.s12,
                horizontal: ThemeSpacings.s24,
              ),
            ),
            textStyle: WidgetStateProperty.all(
              ThemeTypography.body1.copyWith(
                color: ThemeColors.kPrimary,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
        sliderTheme: const SliderThemeData(
          activeTrackColor: ThemeColors.kPrimary,
          trackHeight: 2,
          inactiveTrackColor: ThemeColors.kGray500,
          thumbColor: ThemeColors.kPrimary,
          overlayColor: ThemeColors.kPrimary200WithOpacity,
        ),
        textSelectionTheme: const TextSelectionThemeData(
          cursorColor: ThemeColors.kPrimary,
          selectionColor: ThemeColors.kPrimary200WithOpacity,
          selectionHandleColor: ThemeColors.kPrimary,
        ),
        cardTheme: const CardTheme(
          margin: EdgeInsets.zero,
          elevation: 0,
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color: ThemeColors.kCloseGray,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(8),
            ),
          ),
        ),
        dividerTheme:
            const DividerThemeData(color: ThemeColors.kBorder, thickness: 1),
      );
}
