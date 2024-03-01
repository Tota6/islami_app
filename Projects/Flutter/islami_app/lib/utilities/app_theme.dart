import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppThemeData {
  static ThemeData lightTheme = ThemeData(
    iconTheme: IconThemeData(
      color: AppColors.lightPrimaryColor,
    ),
    textTheme: TextTheme(
      titleMedium: TextStyle(
        color: AppColors.lightTextColor,
        fontSize: 25,
        fontWeight: FontWeight.bold,
      ),
      bodyMedium: TextStyle(
        color: AppColors.lightTextColor,
        fontSize: 2,
        fontWeight: FontWeight.w400,
      ),
      headlineMedium: TextStyle(
        color: AppColors.lightTextColor,
        fontSize: 25,
        fontWeight: FontWeight.w600,
      ),
    ),
    dividerColor: AppColors.lightPrimaryColor,
    primaryColor: AppColors.lightPrimaryColor,
    appBarTheme: AppBarTheme(
      color: AppColors.appBarColor,
      titleTextStyle: TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: 30,
        color: AppColors.lightTextColor,
      ),
      centerTitle: true,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColors.lightNavBarColor,
      selectedItemColor: AppColors.lightSecondaryColor,
      unselectedItemColor: AppColors.lightUnSelectedNavBarColor,
    ),
    navigationBarTheme: NavigationBarThemeData(
      backgroundColor: AppColors.lightNavBarColor,
      elevation: 3,
      iconTheme: const MaterialStatePropertyAll(
        IconThemeData(
          size: 40,
        ),
      ),
    ),
    scaffoldBackgroundColor: AppColors.appBarColor,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.lightPrimaryColor,
    ),
    cardColor: AppColors.whiteColor,
    useMaterial3: true,
  );
  static ThemeData darkTheme = ThemeData(
    iconTheme: IconThemeData(
      color: AppColors.whiteColor,
    ),
    textTheme: TextTheme(
      titleMedium: TextStyle(
        color: AppColors.darkTextColor,
        fontSize: 25,
        fontWeight: FontWeight.bold,
      ),
      bodyMedium: TextStyle(
        color: AppColors.darkTextColor,
        fontSize: 20,
        fontWeight: FontWeight.w400,
      ),
      headlineMedium: TextStyle(
        color: AppColors.darkButtonTextColor,
        fontSize: 25,
        fontWeight: FontWeight.w600,
      ),
      headlineLarge: TextStyle(
        color: AppColors.darkSecondaryTextColor,
        fontSize: 25,
        fontWeight: FontWeight.w600,
      ),
    ),
    dividerColor: AppColors.darkSecondaryColor,
    primaryColor: AppColors.darkPrimaryColor,
    appBarTheme: AppBarTheme(
      color: AppColors.appBarColor,
      titleTextStyle: TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: 30,
        color: AppColors.darkTextColor,
      ),
      centerTitle: true,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColors.darkNavBarColor,
      selectedItemColor: AppColors.darkSecondaryColor,
      unselectedItemColor: AppColors.darkUnSelectedNavBarColor,
    ),
    navigationBarTheme: NavigationBarThemeData(
      backgroundColor: AppColors.darkNavBarColor,
      elevation: 3,
      iconTheme: const MaterialStatePropertyAll(
        IconThemeData(
          size: 40,
        ),
      ),
    ),
    scaffoldBackgroundColor: AppColors.appBarColor,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.darkPrimaryColor,
    ),
    cardColor: AppColors.darkNavBarColor,
    useMaterial3: true,
  );
}
