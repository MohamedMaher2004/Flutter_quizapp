import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
/*import 'package:page_transition/page_transition.dart';*/
import 'package:quizapp/quizapp_page.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
        duration: 3000,
        splash: Icons.home,
        splashIconSize: 60,
        nextScreen: QuizappPage(),
        splashTransition: SplashTransition.fadeTransition,
        /*pageTransitionType: PageTransitionType.scale,*/
        backgroundColor: Colors.blue);
  }
}
