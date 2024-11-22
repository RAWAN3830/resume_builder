import 'dart:async';
import 'package:flutter/material.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {


  @override
  void initState() {
    // TODO: implement initState
    Timer(const Duration(seconds: 3), () {
      Navigator.of(context).pushNamedAndRemoveUntil('homepage', (route) => false);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Splash Screen'),),
      body: const Center(child: Text('Welcome'),),
    );
  }
}
