import 'package:evently/core/resources/ColorsManager.dart';
import 'package:flutter/material.dart';

abstract class AppTheme {
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: ColorsManager.backgroundLight,

    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: ColorsManager.mainColorLight,
      shape: CircleBorder(),
    ),

    navigationBarTheme: NavigationBarThemeData(
      backgroundColor: ColorsManager.inputsLight,
      indicatorColor: Colors.transparent,
      labelTextStyle: WidgetStateTextStyle.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: ColorsManager.mainColorLight,
          );
        }
        return TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          color: ColorsManager.disableColorLight,
        );
      }),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.transparent,
      centerTitle: true,
    ),

    textTheme: TextTheme(
      bodyLarge: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w600,
        color: ColorsManager.mainColorLight,
      ),
      bodySmall: TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 14,
        color: ColorsManager.mainTextLight,
      ),

      titleMedium: TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 20,
        color: ColorsManager.mainTextLight,
      ),
      bodyMedium: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: ColorsManager.secTextLight,
      ),
      displayMedium: TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 14,
        color: ColorsManager.inputsLight,
      ),
      displayLarge: TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 14,
        color: ColorsManager.mainColorLight,
      ),
      headlineMedium: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w500,
        color: ColorsManager.mainColorLight,
      ),
      headlineLarge: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w500,
        color: ColorsManager.mainTextLight,
      ),
      titleSmall: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: ColorsManager.mainTextLight,
      ),
    ),

    colorScheme: ColorScheme.light(
      primary: ColorsManager.mainColorLight,
      onPrimary: ColorsManager.mainTextLight,
      tertiary: ColorsManager.secTextLight,
      primaryContainer: ColorsManager.inputsLight,
      onPrimaryContainer: ColorsManager.strokeLight,
      secondaryContainer: ColorsManager.inputsLight,
      onSecondaryContainer: ColorsManager.strokeLight,
      onSurface: ColorsManager.mainColorLight,
      onTertiary: ColorsManager.disableColorLight,
      onTertiaryContainer: ColorsManager.disableColorLight,
      surfaceBright: ColorsManager.backgroundLight,
    ),
  );

  static ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: ColorsManager.backgroundDark,

    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: ColorsManager.mainColorDark,
      shape: CircleBorder(),
    ),

    navigationBarTheme: NavigationBarThemeData(
      backgroundColor: ColorsManager.backgroundDark,
      indicatorColor: Colors.transparent,
      labelTextStyle: WidgetStateTextStyle.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: ColorsManager.mainColorDark,
          );
        }
        return TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          color: ColorsManager.disableColorDark,
        );
      }),
    ),

    appBarTheme: AppBarTheme(
      backgroundColor: Colors.transparent,
      centerTitle: true,
    ),

    textTheme: TextTheme(
      bodyLarge: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w600,
        color: ColorsManager.mainTextDark,
      ),

      bodySmall: TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 14,
        color: ColorsManager.mainTextDark,
      ),

      titleMedium: TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 20,
        color: ColorsManager.mainTextDark,
      ),
      bodyMedium: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: ColorsManager.secTextDark,
      ),

      displayMedium: TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 14,
        color: ColorsManager.mainTextDark,
      ),

      titleSmall: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: ColorsManager.mainTextDark,
      ),

      displayLarge: TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 14,
        color: ColorsManager.mainColorDark,
      ),

      headlineMedium: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w500,
        color: ColorsManager.mainTextDark,
      ),

      headlineLarge: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w500,
        color: ColorsManager.mainTextDark,
      ),
    ),
    colorScheme: ColorScheme.dark(
      primary: ColorsManager.mainColorDark,
      onPrimary: ColorsManager.mainTextDark,
      tertiary: ColorsManager.secTextDark,
      primaryContainer: ColorsManager.inputsDark,
      onPrimaryContainer: ColorsManager.strokeDark,
      onSecondaryContainer: ColorsManager.strokeDark,
      secondaryContainer: ColorsManager.inputsDark,
      onSurface: ColorsManager.mainTextDark,
      onTertiaryContainer: ColorsManager.mainTextDark,
      onTertiary: ColorsManager.disableColorDark,
      surfaceBright: ColorsManager.backgroundDark,
    ),
  );
}
