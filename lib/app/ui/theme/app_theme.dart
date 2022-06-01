import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app_colors.dart';

final ThemeData appThemeData = ThemeData(
  primaryColor: Palette.primary,
  appBarTheme: const AppBarTheme(
    systemOverlayStyle:
        SystemUiOverlayStyle(statusBarIconBrightness: Brightness.dark),
  ),
  textSelectionTheme: TextSelectionThemeData(
    cursorColor: Palette.primary,
    selectionColor: Palette.primary.withAlpha(30),
    selectionHandleColor: Palette.primary,
  ),
  backgroundColor: Colors.white,
  scaffoldBackgroundColor: Colors.white,
  primaryTextTheme: const TextTheme(
    headline6: TextStyle(
      fontSize: 14.0,
      color: Colors.black,
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0.0,
    ),
  ),
  fontFamily: 'Roboto',
);
