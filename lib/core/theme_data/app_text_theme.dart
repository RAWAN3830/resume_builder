import 'package:flutter/material.dart';

// Regular - 400
// Medium - 500
// Semi bold - 600
// Bold - 700

class AppTextTheme {
  static const _interFontFamily = 'Inter';

  static final headline3 = [
    _headlineBaseTextStyle.copyWith(
        height: 32 / 40, fontSize: 32, fontWeight: FontWeight.bold), // Mobile
    _headlineBaseTextStyle.copyWith(
        height: 34 / 42, fontSize: 34, fontWeight: FontWeight.bold), // Tablet
    _headlineBaseTextStyle.copyWith(
        height: 36 / 44, fontSize: 36, fontWeight: FontWeight.bold), // Desktop
  ];

  static final headline4 = [
    _headlineBaseTextStyle.copyWith(height: 32 / 40, fontSize: 32), // Mobile
    _headlineBaseTextStyle.copyWith(height: 34 / 42, fontSize: 34), // Tablet
    _headlineBaseTextStyle.copyWith(height: 36 / 44, fontSize: 38), // Desktop
  ];

  static final headline5 = [
    _headlineBaseTextStyle.copyWith(height: 24 / 32, fontSize: 24), // Mobile
    _headlineBaseTextStyle.copyWith(height: 26 / 34, fontSize: 26), // Tablet
    _headlineBaseTextStyle.copyWith(height: 28 / 36, fontSize: 30), // Desktop
  ];

  static final bodyLarge = [
    _bodyBaseTextStyle.copyWith(
        fontSize: 16, fontWeight: FontWeight.w400), // Mobile
    _bodyBaseTextStyle.copyWith(
        fontSize: 18, fontWeight: FontWeight.w400), // Tablet
    _bodyBaseTextStyle.copyWith(
        fontSize: 22, fontWeight: FontWeight.w400), // Desktop
  ];

  static final bodyMedium = [
    _bodyBaseTextStyle.copyWith(
        fontSize: 14, fontWeight: FontWeight.w400), // Mobile
    _bodyBaseTextStyle.copyWith(
        fontSize: 16, fontWeight: FontWeight.w400), // Tablet
    _bodyBaseTextStyle.copyWith(
        fontSize: 20, fontWeight: FontWeight.w400), // Desktop
  ];

  static final bodySmall = [
    _bodyBaseTextStyle.copyWith(
        fontSize: 12, fontWeight: FontWeight.w400), // Mobile
    _bodyBaseTextStyle.copyWith(
        fontSize: 14, fontWeight: FontWeight.w400), // Tablet
    _bodyBaseTextStyle.copyWith(
        fontSize: 18, fontWeight: FontWeight.w400), // Desktop
  ];

  static final titleLarge = [
    _bodyBaseTextStyle.copyWith(
        fontSize: 16, fontWeight: FontWeight.w600), // Mobile
    _bodyBaseTextStyle.copyWith(
        fontSize: 18, fontWeight: FontWeight.w600), // Tablet
    _bodyBaseTextStyle.copyWith(
        fontSize: 22, fontWeight: FontWeight.w600), // Desktop
  ];

  static final titleMedium = [
    _bodyBaseTextStyle.copyWith(
        fontSize: 14, fontWeight: FontWeight.w600), // Mobile
    _bodyBaseTextStyle.copyWith(
        fontSize: 16, fontWeight: FontWeight.w600), // Tablet
    _bodyBaseTextStyle.copyWith(
        fontSize: 20, fontWeight: FontWeight.w600), // Desktop
  ];

  static final titleSmall = [
    _bodyBaseTextStyle.copyWith(
        fontSize: 12, fontWeight: FontWeight.w600), // Mobile
    _bodyBaseTextStyle.copyWith(
        fontSize: 14, fontWeight: FontWeight.w600), // Tablet
    _bodyBaseTextStyle.copyWith(
        fontSize: 18, fontWeight: FontWeight.w600), // Desktop
  ];

  static const _headlineBaseTextStyle = TextStyle(
    fontWeight: FontWeight.w600,
    letterSpacing: 0,
    fontFamily: _interFontFamily,
  );

  static const _bodyBaseTextStyle = TextStyle(
    fontFamily: _interFontFamily,
    letterSpacing: 0,
  );

  // Mobile text theme
  static final mobileTextTheme = TextTheme(
    headlineLarge: headline3[0],
    headlineMedium: headline4[0],
    headlineSmall: headline5[0],
    bodyLarge: bodyLarge[0],
    bodyMedium: bodyMedium[0],
    bodySmall: bodySmall[0],
    titleMedium: titleMedium[0],
    titleLarge: titleLarge[0],
    titleSmall: titleSmall[0],
  );

  // Tablet text theme
  static final tabletTextTheme = TextTheme(
    headlineLarge: headline3[1],
    headlineMedium: headline4[1],
    headlineSmall: headline5[1],
    bodyLarge: bodyLarge[1],
    bodyMedium: bodyMedium[1],
    bodySmall: bodySmall[1],
    titleMedium: titleMedium[1],
    titleLarge: titleLarge[1],
    titleSmall: titleSmall[1],
  );

  // Desktop text theme
  static final desktopTextTheme = TextTheme(
    headlineLarge: headline3[2],
    headlineMedium: headline4[2],
    headlineSmall: headline5[2],
    bodyLarge: bodyLarge[2],
    bodyMedium: bodyMedium[2],
    bodySmall: bodySmall[2],
    titleMedium: titleMedium[2],
    titleLarge: titleLarge[2],
    titleSmall: titleSmall[2],
  );
}
