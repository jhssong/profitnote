import 'package:flutter/material.dart';

class ColorTheme {
  static var background = const Color(0Xff141517);
  static var cardBackground = const Color(0xff1C1E1F);
  static var cardText = const Color(0xffC9CEDC);
  static var stroke = const Color(0xff212325);
  static var pointColor = const Color(0xff484376);
  static var pointText = const Color(0xffFFFFFF);
  static var cardLabelText = const Color(0xff9DA5B6);
  static var selected = const Color(0xffC9CEDC);
  static var unselected = const Color(0xff242529);
  static var backgroundOfBackground = const Color(0xff2B2E2F);
  static var expenseColor = const Color(0xffCD5C5C);
}

ThemeData theme = ThemeData(
  // Cursor Style
  textSelectionTheme: TextSelectionThemeData(
    cursorColor: ColorTheme.cardText, // Set cursor color to white
  ),

  canvasColor: Colors.transparent,

  // Appbar Style
  appBarTheme: AppBarTheme(
    backgroundColor: ColorTheme.background,
    toolbarHeight: 56,
    titleTextStyle: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: ColorTheme.cardLabelText,
    ),
    foregroundColor: ColorTheme.cardLabelText,
  ),

  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    backgroundColor: ColorTheme.cardBackground,
    enableFeedback: false,
    // selectedItemColor: const Color.fromRGBO(160, 165, 182, 1),  // #a0a5b6
    // unselectedItemColor: const Color.fromRGBO(160, 165, 182, .7),
    selectedItemColor: ColorTheme.cardText,
    unselectedItemColor: ColorTheme.cardLabelText,
  ),

  // Scaffold Style
  scaffoldBackgroundColor: ColorTheme.background,

  // Icon Style (select icon size in [16, 20, 24])
  iconTheme: IconThemeData(color: ColorTheme.cardLabelText),

  // Text Style
  textTheme: TextTheme(
    headlineLarge: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: ColorTheme.cardText,
    ),
    headlineMedium: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: ColorTheme.cardText,
    ),
    titleMedium: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.bold,
      color: ColorTheme.cardText,
    ),
    titleSmall: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.bold,
      color: ColorTheme.cardText,
    ),
    bodyLarge: TextStyle(
      fontSize: 16,
      color: ColorTheme.cardText,
    ),
    bodyMedium: TextStyle(
      fontSize: 14,
      color: ColorTheme.cardText,
    ),
    bodySmall: TextStyle(
      fontSize: 12,
      color: ColorTheme.cardText,
    ),
    labelMedium: TextStyle(
      fontSize: 12,
      color: ColorTheme.cardLabelText,
    ),
    labelSmall: TextStyle(
      fontSize: 10,
      color: ColorTheme.cardLabelText,
    ),
  ),
);
