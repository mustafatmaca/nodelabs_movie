import 'package:flutter/material.dart';
import 'package:nodelabs_movie/config/theme/app_color.dart';

class AppTheme {
  static ThemeData get theme {
    return ThemeData(
      useMaterial3: true,
      colorScheme: AppColor.colorScheme,
      primaryColor: AppColor.primary,
      scaffoldBackgroundColor: AppColor.background,
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColor.background,
        foregroundColor: AppColor.label,
        centerTitle: true,
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: AppColor.background,
        selectedItemColor: AppColor.primary,
        unselectedItemColor: AppColor.label,
      ),
      iconTheme: const IconThemeData(
        color: AppColor.label,
      ),
      iconButtonTheme: IconButtonThemeData(
        style: IconButton.styleFrom(
            backgroundColor: AppColor.itemBg,
            foregroundColor: AppColor.label,
            side: const BorderSide(color: AppColor.labelThree)),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColor.primary,
          foregroundColor: AppColor.label,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        labelStyle: const TextStyle(color: AppColor.labelTwo, fontSize: 12),
        filled: true,
        fillColor: Color(0x1AFFFFFF),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white54, width: 0.5),
          borderRadius: BorderRadius.circular(12),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white54, width: 1.0),
          borderRadius: BorderRadius.circular(12),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white54, width: 1.0),
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      textTheme: const TextTheme(
        displayLarge: TextStyle(
          color: AppColor.label,
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
        displayMedium: TextStyle(
          color: AppColor.label,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        displaySmall: TextStyle(
          color: AppColor.label,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
        headlineLarge: TextStyle(
          color: AppColor.label,
          fontSize: 15,
          fontWeight: FontWeight.bold,
        ),
        headlineMedium: TextStyle(
          color: AppColor.label,
          fontSize: 15,
          decoration: TextDecoration.lineThrough,
          decorationColor: AppColor.label,
        ),
        titleLarge: TextStyle(
          color: AppColor.label,
          fontSize: 13,
          fontWeight: FontWeight.normal,
        ),
        titleMedium: TextStyle(
          color: AppColor.labelTwo,
          fontSize: 13,
          fontWeight: FontWeight.normal,
        ),
        labelLarge: TextStyle(
          color: AppColor.label,
          fontSize: 12,
          fontWeight: FontWeight.normal,
        ),
        labelMedium: TextStyle(
          color: AppColor.labelTwo,
          fontSize: 12,
          fontWeight: FontWeight.normal,
        ),
        labelSmall: TextStyle(
          color: AppColor.label,
          fontSize: 12,
          fontWeight: FontWeight.normal,
          decoration: TextDecoration.underline,
          decorationColor: AppColor.label,
        ),
      ),
    );
  }
}
