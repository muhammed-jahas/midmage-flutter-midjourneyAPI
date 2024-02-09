import 'package:flutter/material.dart';
import 'package:flutter_midjourney_app/features/prompt/presentation/create_prompt_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    gotoCreatePromptScreen();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Container(
               decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage('assets/images/splash-background.png'),fit: BoxFit.cover)
                  ),
              child: Center(
                child: Image.asset(
                  'assets/images/midener-logo-2.png',
                  height: 100,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
  
  void gotoCreatePromptScreen() async {
    await Future.delayed(Duration(seconds: 2));
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const CreatePromptScreen(),));
  }
}
