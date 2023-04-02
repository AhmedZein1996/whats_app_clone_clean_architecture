import 'package:flutter/material.dart';
import 'package:whats_app_clone_clean_architecture/presentation/screens/splash_screen.dart';
import 'package:whats_app_clone_clean_architecture/presentation/theme/style.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Whatsapp Clone',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ThemeData().colorScheme.copyWith(
              primary: primaryColor,
            ),
        primaryColor: primaryColor,
      ),
      home: const SplashScreen(),
    );
  }
}
