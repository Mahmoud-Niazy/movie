import 'package:flutter/material.dart';

import '../app_constance.dart';
import '../app_styles.dart';

abstract class AppTheme {
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Colors.white,
      selectedItemColor: AppConstance.primaryColor,
      unselectedItemColor: Colors.grey,
    ),
    textTheme: TextTheme(
      displayLarge: AppStyles.style30.copyWith(
          color: Colors.black
      ),
      bodyMedium: AppStyles.style20.copyWith(
          color: Colors.black
      ),
      bodySmall: AppStyles.style18.copyWith(
          color: Colors.black
      ),
      displaySmall: AppStyles.style14.copyWith(
          color: Colors.black
      ),
      titleMedium: AppStyles.style16Grey.copyWith(
        color: Colors.black26,
      ),
      displayMedium: AppStyles.style16White.copyWith(
          color: Colors.black
      ),

    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
    ),
  );

  static ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: AppConstance.primaryBackgroundColor,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Colors.black26,
      selectedItemColor: AppConstance.primaryColor,
      unselectedItemColor: Colors.white,
    ),
    textTheme: const TextTheme(
        displayLarge: AppStyles.style30,
        bodyMedium: AppStyles.style20,
        bodySmall: AppStyles.style18,
        displaySmall: AppStyles.style14,
        titleMedium: AppStyles.style16Grey,
        displayMedium: AppStyles.style16White

    ),
    appBarTheme: AppBarTheme(
      backgroundColor: AppConstance.primaryBackgroundColor,
    ),
  );
}