import 'package:nohunger/screen/splash/splash_screen.dart';
import 'package:nohunger/screen/user/screens/onboarding/onboarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:nohunger/utilities/theme/app_theme.dart';
import 'package:nohunger/route/router.dart' as router;



void main() {
  try {
    runApp(const MyApp());
  } catch (e, stackTrace) {
    print("Error starting app: $e");
    print(stackTrace);
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'noHunger',
      theme: AppTheme.lightTheme(context),
      themeMode: ThemeMode.light,
      home: const SplashScreen(
        nextScreen: OnBordingScreen(),
      ),
      onGenerateRoute: router.generateRoute,
    );
  }
}

 

// import 'package:client/utilities/theme/app_theme.dart';
// import 'package:flutter/material.dart';
// import 'package:client/route/route_constants.dart';
// import 'package:client/route/router.dart' as router;

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'noHunger',
//       theme: AppTheme.lightTheme(context),
//       // Dark theme is inclided in the Full template
//       themeMode: ThemeMode.light,
//       //  home: const EntryPoint(),
//       onGenerateRoute: router.generateRoute,
//       initialRoute: onbordingScreenRoute,
//     );
//   }
// }