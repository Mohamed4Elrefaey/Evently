import 'package:evently/core/resources/AppTheme.dart';
import 'package:evently/ui/ForgetPass/ForgetPass.dart';
import 'package:evently/ui/home/homeScreen.dart';
import 'package:evently/ui/login_screen/LoginScreen.dart';
import 'package:evently/ui/onboarding/OnboardingScreen.dart';
import 'package:evently/ui/signup/Signup.dart';
import 'package:evently/ui/splash_screen/splashScreen.dart';
import 'package:evently/ui/start_screen/startScreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.dark,
      debugShowCheckedModeBanner: false,
      initialRoute: Homescreen.routeName,
      routes: {
        Homescreen.routeName : (_) => Homescreen(),
        SplashScreen.routeName: (_) => SplashScreen(),
        StartScreen.routeName: (_) => StartScreen(),
        OnboardingScreen.routeName: (_) => OnboardingScreen(),
        LoginScreen.routeName: (_) => LoginScreen(),
        SignupScreen.routeName: (_) => SignupScreen(),
        ForgetPass.routeName: (_) => ForgetPass(),
      },
    );
  }
}
