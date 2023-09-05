import 'package:flutter/material.dart';

class AppTheme {
  static final ThemeData themeData = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    useMaterial3: true,
    primaryColor: AppColors.primaryColor,
    textTheme: TextTheme(
      headline1: TextStyle(
        color: AppColors.primaryColor,
        fontSize:18,
        fontWeight: FontWeight.w500,
      ),
      headline2: TextStyle(
        color: AppColors.primaryColor,
        fontSize: 12,
        fontWeight: FontWeight.w500,
      ),
      headline3: TextStyle(
        color: AppColors.primaryColor,
        fontSize: 12,
      ),
      // 添加其他文本样式
    ),
    cardColor:Color.fromRGBO(240, 240, 240, 1),
    shadowColor: Color(0xFF000000).withOpacity(0.08),
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.white,
      elevation: 0,
      titleTextStyle: TextStyle(
        color: AppColors.primaryColor,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
    buttonTheme: ButtonThemeData(
      textTheme: ButtonTextTheme.primary,
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(
          color: Color(0xFF030303),
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(
          color: Color(0xFF030303),
          width: 2,
        ),
      ),
      // 添加其他输入框装饰样式
    ),
  );
}

class AppColors {
  static const Color backgroundColor = Colors.white;
  static const Color primaryColor = Color(0xFF030303);
  static const Color cardColor = Color(0xFFF0F0F0);
  static const Color shadowColor = Color.fromRGBO(0, 0, 0, 0.08);
  static const Color unimportantIconColor = Color(0xFF7E7E7E);
// 其他颜色常量...
}
