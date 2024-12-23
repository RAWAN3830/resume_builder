import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

import 'apptheme.dart';

enum BreakpointEnum {
  mobile,
  tablet,
  desktop;

  Breakpoint get point {
    switch (this) {
      case BreakpointEnum.mobile:
        return const Breakpoint(start: 0, end: 350, name: MOBILE);
      case BreakpointEnum.tablet:
        return const Breakpoint(start: 351, end: 600, name: TABLET);
      case BreakpointEnum.desktop:
        return const Breakpoint(
            start: 601, end: double.infinity, name: DESKTOP);
      default:
        return const Breakpoint(start: 0, end: 350, name: MOBILE);
    }
  }

  static BreakpointEnum breakpointEnum(Breakpoint currentBreakpoint) {
    switch (currentBreakpoint) {
      case const Breakpoint(start: 0, end: 350, name: MOBILE):
        return BreakpointEnum.mobile;

      case const Breakpoint(start: 351, end: 600, name: TABLET):
        return BreakpointEnum.tablet;

      case const Breakpoint(start: 601, end: double.infinity, name: DESKTOP):
        return BreakpointEnum.desktop;

      default:
        return BreakpointEnum.mobile;
    }
  }

  static ThemeData responsiveTheme(BreakpointEnum currentBreakPoint) {
    switch (currentBreakPoint) {
      case BreakpointEnum.mobile:
        return AppTheme.mobileThemeData;
      case BreakpointEnum.tablet:
        return AppTheme.tabletThemeData;
      case BreakpointEnum.desktop:
        return AppTheme.desktopThemeData;
    }
  }
}
