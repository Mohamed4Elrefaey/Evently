import 'package:evently/core/resources/AssetsManager.dart';
import 'package:evently/core/resources/StringsManager.dart';
import 'package:evently/ui/home/homeScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../start_screen/startScreen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  static const String routeName = "SplashScreen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Stack(
            children: [
              Center(
                child: Image.asset(
                  AssetsManager.logo,
                  color: Theme
                      .of(context)
                      .colorScheme
                      .primary,
                ),
              )
                  .animate(
                onComplete: (controller) {
                  if (FirebaseAuth.instance.currentUser == null) {
                    Navigator.pushReplacementNamed(
                      context,
                      StartScreen.routeName,
                    );
                  } else {
                    Navigator.pushReplacementNamed(
                        context, Homescreen.routeName);
                  }
                },
              )
                  .scaleX(duration: Duration(seconds: 1))
                  .then()
                  .scale(
                duration: Duration(seconds: 1),
                begin: Offset(0.5, 0.5),
              ),
              Positioned(
                left: 0,
                right: 0,
                bottom: constraints.maxHeight * 0.064,
                child: Column(
                  children: [
                    Image.asset(AssetsManager.splashBranding),
                    SizedBox(height: 8),
                    Text(
                      StringsManager.splashTitle,
                      style: Theme
                          .of(context)
                          .textTheme
                          .bodySmall,
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
