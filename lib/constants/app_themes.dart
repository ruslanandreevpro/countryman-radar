import 'package:flutter/material.dart';

class AppThemes {
  AppThemes._(); // это сделано для того, чтобы никто не мог создать экземпляр этого объекта

  static final ThemeData lightTheme = ThemeData(
    primaryColor: Color.fromRGBO(0, 29, 15, 1),
  );

  static final ThemeData darkTheme = ThemeData(
    primaryColor: Color.fromRGBO(0, 29, 15, 1),
  );
}