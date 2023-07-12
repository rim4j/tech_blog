import 'package:flutter/material.dart';

import 'app_colors.dart';

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: AppColors.primaryColor,
  ),
  colorScheme: const ColorScheme.dark(
    background: Color.fromRGBO(0, 0, 0, 1.0),
    primary: Color.fromRGBO(19, 19, 19, 1),
    secondary: Color.fromRGBO(97, 97, 97, 1),
  ),
  textTheme: const TextTheme(
    displayLarge: TextStyle(
      fontFamily: 'dana',
      fontSize: 16,
      fontWeight: FontWeight.w700,
      color: AppColors.posterTitle,
    ),
    titleMedium: TextStyle(
      fontFamily: 'dana',
      fontSize: 14,
      fontWeight: FontWeight.w300,
      color: AppColors.posterSubTitle,
    ),
    bodySmall: TextStyle(
      fontFamily: 'dana',
      fontSize: 14,
      fontWeight: FontWeight.w300,
      color: AppColors.greyColor,
    ),
    bodyLarge: TextStyle(
      fontFamily: 'dana',
      fontSize: 13,
      fontWeight: FontWeight.w300,
    ),
    displayMedium: TextStyle(
      fontFamily: 'dana',
      fontSize: 14,
      color: Colors.white,
      fontWeight: FontWeight.w300,
    ),
    displaySmall: TextStyle(
      fontFamily: 'dana',
      fontSize: 14,
      color: AppColors.seeMore,
      fontWeight: FontWeight.w700,
    ),
    headlineMedium: TextStyle(
      fontFamily: 'dana',
      fontSize: 14,
      color: Color.fromRGBO(97, 97, 97, 1),
      fontWeight: FontWeight.w700,
    ),
    headlineSmall: TextStyle(
      fontFamily: 'dana',
      fontSize: 14,
      color: AppColors.hintText,
      fontWeight: FontWeight.w700,
    ),
  ),
);
