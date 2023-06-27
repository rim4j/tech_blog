import 'package:flutter/material.dart';
import 'package:tech_blog/config/theme/app_colors.dart';

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  fontFamily: "dana",
  colorScheme: const ColorScheme.light(
    background: Color.fromARGB(255, 255, 255, 255),
    primary: Color.fromARGB(255, 68, 4, 87),
    secondary: Color.fromARGB(255, 68, 4, 87),
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
      color: Color.fromARGB(255, 70, 70, 70),
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
