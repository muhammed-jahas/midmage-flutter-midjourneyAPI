import 'package:flutter/material.dart';
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
          appBarTheme: const AppBarTheme(
              backgroundColor:  AppColors.appBarColor1, elevation: 0),
          brightness: Brightness.dark,
          scaffoldBackgroundColor: AppColors.scaffoldBackgroundColor),
          
      home: const SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
