import 'package:flutter/material.dart';
import 'package:resume/core/constant/strings.dart';
import 'package:resume/core/constant/theme_colors.dart' show ThemeColors;
import 'app_text_theme.dart';


class AppTheme {
  static ThemeData mobileThemeData = ThemeData(
    fontFamily: Strings.uberFont,
    textTheme: AppTextTheme.mobileTextTheme,
    colorScheme: ColorScheme.fromSeed(seedColor:ThemeColors.mainGreenColor),
    scaffoldBackgroundColor: ThemeColors.white,
    // actionIconTheme: ActionIconThemeData(
    //   backButtonIconBuilder: (context) => const CustomBackButton(),
    // ),
    // bottomNavigationBarTheme: const BottomNavigationBarThemeData(),
    appBarTheme: AppBarTheme(
      // backgroundColor: ThemeColor.white,
      // centerTitle: true,
      titleTextStyle: AppTextTheme.mobileTextTheme.titleLarge,
      toolbarHeight: kToolbarHeight,
    ),
    useMaterial3: true,
  );

  static ThemeData tabletThemeData = ThemeData(
    textTheme: AppTextTheme.tabletTextTheme,
    fontFamily: Strings.uberFont,
    colorScheme: ColorScheme.fromSeed(seedColor:ThemeColors.mainGreenColor),
    scaffoldBackgroundColor: ThemeColors.white,
    useMaterial3: true,
    // actionIconTheme: ActionIconThemeData(
    //   backButtonIconBuilder: (context) => const CustomBackButton(),
    // ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(),
    appBarTheme: AppBarTheme(
      backgroundColor: ThemeColors.white,
      centerTitle: true,
      titleTextStyle: AppTextTheme.tabletTextTheme.titleLarge,
      toolbarHeight: kToolbarHeight,
    ),
  );

  static ThemeData desktopThemeData = ThemeData(
    textTheme: AppTextTheme.desktopTextTheme,
    fontFamily: Strings.uberFont,

    colorScheme: ColorScheme.fromSeed(seedColor: ThemeColors.mainGreenColor),
    scaffoldBackgroundColor: ThemeColors.white,
    useMaterial3: true,
    // actionIconTheme: ActionIconThemeData(
    //   backButtonIconBuilder: (context) => const CustomBackButton(),
    // ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(),
    appBarTheme: AppBarTheme(
      backgroundColor: ThemeColors.white,
      centerTitle: true,
      titleTextStyle: AppTextTheme.desktopTextTheme.titleLarge,
      toolbarHeight: kToolbarHeight,
    ),
  );
}
