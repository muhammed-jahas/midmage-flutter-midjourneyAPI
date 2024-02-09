import 'package:flutter/material.dart';

class AppColors {
  static const int _primaryValue = 0xFFFF3D3D; // Updated with the new primary color

  static const MaterialColor primaryColor = MaterialColor(
    _primaryValue,
    <int, Color>{
      50: Color(0xFFFFE0E0),
      100: Color(0xFFFFB3B3),
      200: Color(0xFFFF8080),
      300: Color(0xFFFF4D4D),
      400: Color(0xFFFF2626),
      500: Color(_primaryValue),
      600: Color(0xFFCC0000),
      700: Color(0xFFB80000),
      800: Color(0xFF9E0000),
      900: Color(0xFF7A0000),
    },
  );

  static const Color alertColor = Color(0xFFE01B1B);
  static const Color secondaryColor = Color(0xFF0E403D);
  static const Color yellowColor = Color(0xFFDBFF00);
  static const Color whiteColor = Color(0xFFFFFFFF);
  static const Color greyColor = Color(0xFFF2F6FF);
  static const Color scaffoldBackgroundColor= Color(0xFF1C1C1C);
  static const Color appBarColor1= Color(0xFF252525);
  static const Color borderColor= Color(0xFF3A3A3A);

  // static const Color accentColor = Color(0xFF9C27B0);
  // static const Color textColor = Color(0xFF333333);
}
