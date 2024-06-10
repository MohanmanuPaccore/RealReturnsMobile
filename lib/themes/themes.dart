import 'package:RealReturns/constants/color_constants.dart';
import 'package:flutter/material.dart';

// Light Theme
ThemeData lightTheme = ThemeData(
  // Define your light theme properties here
  brightness: Brightness.light,
  scaffoldBackgroundColor: ColorConstants.lightModeBackgroundColor,
  primaryColor: Colors.green,
  progressIndicatorTheme: ProgressIndicatorThemeData(
    color: Colors.green
  ),

  textTheme: TextTheme(
    bodyMedium:TextStyle(
      color: ColorConstants.textMediumlightModeColor
    ),
displayLarge:TextStyle(
  fontWeight: FontWeight.w600,
  fontSize: 24,
  fontFamily: 'inter',
  color: ColorConstants.iconColorlighMode
) 
  )

  // Add more properties as needed
);

// Dark Theme
ThemeData darkTheme = ThemeData(
  // Define your dark theme properties here
  brightness: Brightness.dark,
  scaffoldBackgroundColor: ColorConstants.darkmodeBackgroundColor,
  primaryColor: Colors.orange,
  progressIndicatorTheme: ProgressIndicatorThemeData(
    color: Colors.orange
  ),
  textTheme: TextTheme(
    bodyMedium:TextStyle(
      color: ColorConstants.textMediumdarkModeColor
    ) ,
    displayLarge:TextStyle(
  fontWeight: FontWeight.w600,
  fontSize: 24,
  fontFamily: 'inter',
  color: ColorConstants.iconColorDarkMode
) 
  )
  // Add more properties as needed
);
