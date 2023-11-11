import 'package:flutter/material.dart';
import 'package:mechanic_baato/src/utils/managers/color_manager.dart';
import 'package:mechanic_baato/src/utils/managers/values_manager.dart';

class BaatoAppBarTheme {
  BaatoAppBarTheme._();

  static const lightAppBarTheme = AppBarTheme(
    elevation: 0,
    centerTitle: false,
    scrolledUnderElevation: 0,
    backgroundColor: Colors.transparent,
    surfaceTintColor: Colors.transparent,
    iconTheme: IconThemeData(color: ThemeColor.black, size: AppSize.s24),
    actionsIconTheme: IconThemeData(color: ThemeColor.black, size: AppSize.s24),
    titleTextStyle: TextStyle(
        fontSize: 18.0, fontWeight: FontWeight.w600, color: ThemeColor.black),
  );
  static const darkAppBarTheme = AppBarTheme(
    elevation: 0,
    centerTitle: false,
    scrolledUnderElevation: 0,
    backgroundColor: Colors.transparent,
    surfaceTintColor: Colors.transparent,
    iconTheme: IconThemeData(color: ThemeColor.black, size: AppSize.s24),
    actionsIconTheme: IconThemeData(color: ThemeColor.white, size: AppSize.s24),
    titleTextStyle: TextStyle(
        fontSize: 18.0, fontWeight: FontWeight.w600, color: ThemeColor.white),
  );
}
