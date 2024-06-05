import 'package:flutter/material.dart';

// Light Theme
ThemeData lightTheme = ThemeData(
  // Define your light theme properties here
  brightness: Brightness.light,
  primaryColor: Colors.green,
  progressIndicatorTheme: ProgressIndicatorThemeData(
    color: Colors.green
  ),

  textTheme: TextTheme(
    bodyMedium:TextStyle(
      color: Colors.yellow
    ) 
  )

  // Add more properties as needed
);

// Dark Theme
ThemeData darkTheme = ThemeData(
  // Define your dark theme properties here
  brightness: Brightness.dark,
  primaryColor: Colors.orange,
  progressIndicatorTheme: ProgressIndicatorThemeData(
    color: Colors.orange
  ),
  textTheme: TextTheme(
    bodyMedium:TextStyle(
      color: Colors.orangeAccent
    ) 
  )
  // Add more properties as needed
);
