// App에 공통적으로 적용될 컬러, 폰트, 텍스트 weight, 전역 테마 등 정의
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData dark = ThemeData(
      appBarTheme: const AppBarTheme(
          backgroundColor: Color.fromRGBO(21, 21, 21, 1),
          centerTitle: true,
          titleTextStyle: TextStyle(color: Colors.white, fontSize: 18)),
      colorScheme: const ColorScheme.dark());
}
