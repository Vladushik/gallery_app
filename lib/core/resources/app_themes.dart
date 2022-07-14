import 'package:flutter/material.dart';
import 'package:gallery_app/core/resources/resources.dart';

class AppThemes {
  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: ColorsApp.backgroundColor,
    useMaterial3: true,
    appBarTheme: const AppBarTheme(
      titleTextStyle: TextStyle(color: Colors.black, fontSize: 24),
      color: ColorsApp.appBarColor,
      iconTheme: IconThemeData(),
    ),
    iconTheme: const IconThemeData(),
    textTheme: const TextTheme(bodyText2: TextStyle()),
  );
  static final darkTheme = ThemeData.dark().copyWith(
    useMaterial3: true,
  );
}
