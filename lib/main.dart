import 'package:flutter/material.dart';
import 'package:flutter_midjourney_app/features/prompt/presentation/create_prompt_screen.dart';
import 'package:flutter_midjourney_app/features/prompt/presentation/splash_screen.dart';
import 'package:flutter_midjourney_app/resources/app_colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          fontFamily: 'oldburg',
          // primaryColor: const Color(0xFFFF3D3D),
          //   primaryColorDark: const Color(0xFFFF3D3D),

          appBarTheme: AppBarTheme(
              backgroundColor: AppColors.appBarColor1, elevation: 0),
          brightness: Brightness.dark,
          scaffoldBackgroundColor: AppColors.scaffoldBackgroundColor),
      home: SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
