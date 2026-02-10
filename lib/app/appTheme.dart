import 'package:flutter/material.dart';
import 'generalImports.dart';

enum AppTheme { dark, light }

final commonThemeData = ThemeData(
  useMaterial3: true,
  fontFamily: 'Lexend',
  visualDensity: VisualDensity.standard,
);

final Map<AppTheme, ThemeData> appThemeData = {
  AppTheme.light: commonThemeData.copyWith(
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.lightPrimaryColor,
    colorScheme: ColorScheme.light(
      primary: AppColors.lightAccentColor,
      secondary: AppColors.lightSecondaryColor,
      surface: Colors.white,
      onSurface: AppColors.lightSubHeadingColor1,
      onPrimary: Colors.white,
    ),
    cardTheme: CardThemeData(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.white,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        padding: const EdgeInsets.symmetric(vertical: 14),
      ),
    ),
  ),

  AppTheme.dark: commonThemeData.copyWith(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.darkPrimaryColor,
    colorScheme: ColorScheme.dark(
      primary: AppColors.darkAccentColor,
      secondary: AppColors.darkSecondaryColor,
      surface: AppColors.darkPrimaryColor,
      onSurface: AppColors.darkSubHeadingColor1,
    ),
    cardTheme: CardThemeData(
      elevation: 1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    ),
  ),
};
