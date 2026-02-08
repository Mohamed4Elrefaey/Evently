import 'package:easy_localization/easy_localization.dart';
import 'package:evently/core/providers/User_provider.dart';
import 'package:evently/core/providers/theme_provider.dart';
import 'package:evently/core/remote/local/presManager.dart';
import 'package:evently/core/resources/AppTheme.dart';
import 'package:evently/ui/Add_event/add_event_screen.dart';
import 'package:evently/ui/ForgetPass/ForgetPass.dart';
import 'package:evently/ui/home/homeScreen.dart';
import 'package:evently/ui/login_screen/LoginScreen.dart';
import 'package:evently/ui/onboarding/OnboardingScreen.dart';
import 'package:evently/ui/signup/Signup.dart';
import 'package:evently/ui/splash_screen/splashScreen.dart';
import 'package:evently/ui/start_screen/startScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'core/Firebase/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized(); // initialize easy localization
  await PrefsManager.init();
  // initialize Firebase
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          // create an object from ThemeProvider
          create: (context) =>
              ThemeProvider()
                ..initTheme(), // .. to access methods into an object
        ),
      ],
      child: EasyLocalization(
        // You must wrap MyApp with EasyLocalization
        fallbackLocale: Locale('en'),
        startLocale: Locale("ar"),
        supportedLocales: [Locale("ar"), Locale("en")],
        path: 'assets/translation',
        child: const MyApp(),
      ),
      // You must wrap MyApp with ChangeNotifierProvider
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // Access the same Object
    ThemeProvider provider = Provider.of<ThemeProvider>(
      context,
    ); // I access the provider through the context -- widget tree
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: provider.mode,
      debugShowCheckedModeBanner: false,
      initialRoute: StartScreen.routeName,
      routes: {
        Homescreen.routeName: (_) => ChangeNotifierProvider(
          create: (context) => UserProvider(),
          child: Homescreen(),
        ),
        SplashScreen.routeName: (_) => SplashScreen(),
        StartScreen.routeName: (_) => StartScreen(),
        OnboardingScreen.routeName: (_) => OnboardingScreen(),
        LoginScreen.routeName: (_) => LoginScreen(),
        SignupScreen.routeName: (_) => SignupScreen(),
        ForgetPass.routeName: (_) => ForgetPass(),
        AddEventScreen.routeName: (_) => AddEventScreen(),
      },
    );
  }
}
