import 'package:flutter/material.dart';
import 'package:resume/presentation/home_screen/home_screen.dart';

import 'auth_screen/login_screen.dart';
import 'auth_screen/registration_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
        useMaterial3: true,
      ),
       // home: const HomeScreen(),
      home: const LoginScreen(),
      //  home: const RegistrationScreen(),
    );
  }
}
