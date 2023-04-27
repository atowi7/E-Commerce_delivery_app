import 'package:ecommerce_delivery_app/core/constant/color.dart';
import 'package:flutter/material.dart';

ThemeData englishTheme = ThemeData(
  appBarTheme: const AppBarTheme(
    titleTextStyle: TextStyle(
      color: AppColor.blue,
      fontWeight: FontWeight.bold,
      fontSize: 20,
      fontFamily: 'Cairo',
    ),
    iconTheme: IconThemeData(color: AppColor.blue),
    backgroundColor: AppColor.white,
    elevation: 0,
    centerTitle: true,
  ),
  floatingActionButtonTheme:
      const FloatingActionButtonThemeData(backgroundColor: AppColor.blue),
  textTheme: const TextTheme(
      displayLarge: TextStyle(
        fontFamily: 'Roboto',
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: AppColor.blue,
      ),
      displayMedium: TextStyle(
        fontFamily: 'Roboto',
        fontSize: 18,
      ),
       displaySmall: TextStyle(
        fontFamily: 'Roboto',
        fontSize: 16,
      ),
      labelLarge: TextStyle(
          fontFamily: 'Roboto',
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: AppColor.white)),
);

ThemeData arabicTheme = ThemeData(
  textTheme: const TextTheme(
      displayLarge: TextStyle(
        fontFamily: 'Cairo',
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: AppColor.blue,
      ),
      displayMedium: TextStyle(
        fontFamily: 'Cairo',
        fontSize: 18,
      ),
      labelLarge: TextStyle(
          fontFamily: 'Cairo',
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: AppColor.white)),
);
