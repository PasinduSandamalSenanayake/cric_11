import 'package:cric_11/src/theme/widgets_theme/text_theme.dart';
import 'package:flutter/material.dart';

class AppTheme{

  AppTheme._(); // this is to make sure that no one can instantiate this class

  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    textTheme: TTextTheme.lightTextTheme,
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    textTheme: TTextTheme.darkTextTheme,
  );
}