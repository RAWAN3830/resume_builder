import 'package:flutter/material.dart';
import 'package:resume/presentation/home_screen/home_screen.dart';
import '../firebase_options.dart';
import 'auth_screen/login_screen.dart';
import 'auth_screen/registration_screen.dart';
import 'package:firebase_core/firebase_core.dart';


void main() async{
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightGreen),
        useMaterial3: true,
      ),
       home: const HomeScreen(),
      // home: const LoginScreen(),
      //  home: const RegistrationScreen(),
    );
  }
}
