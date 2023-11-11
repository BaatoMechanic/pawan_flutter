import 'package:flutter/material.dart';
import 'package:mechanic_baato/src/utils/managers/color_manager.dart';
import 'package:mechanic_baato/src/utils/managers/default_manager.dart';

/* -- Light & Dark Elevated Button Themes -- */
class BaatoElevatedButtonTheme {
  BaatoElevatedButtonTheme._(); //To avoid creating instances

  /* -- Light Theme -- */
  static final lightElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: ThemeColor.light,
      backgroundColor: ThemeColor.primary,
      disabledForegroundColor: ThemeColor.darkGrey,
      disabledBackgroundColor: ThemeColor.buttonDisabled,
      side: const BorderSide(color: ThemeColor.transparent),
      padding:
          const EdgeInsets.symmetric(vertical: DefaultManager.buttonHeight),
      textStyle: const TextStyle(
          fontSize: 16,
          color: ThemeColor.textWhite,
          fontWeight: FontWeight.w600),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(DefaultManager.buttonRadius)),
    ),
  );

  /* -- Dark Theme -- */
  static final darkElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: ThemeColor.light,
      backgroundColor: ThemeColor.primary,
      disabledForegroundColor: ThemeColor.darkGrey,
      disabledBackgroundColor: ThemeColor.darkerGrey,
      side: const BorderSide(color: ThemeColor.transparent),
      padding:
          const EdgeInsets.symmetric(vertical: DefaultManager.buttonHeight),
      textStyle: const TextStyle(
          fontSize: 16,
          color: ThemeColor.textWhite,
          fontWeight: FontWeight.w600),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(DefaultManager.buttonRadius)),
    ),
  );
}
