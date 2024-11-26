import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:resume/core/constant/extension.dart';

import '../../core/constant/strings.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 150,
        title: Text(
          Strings.homeScreenTitle,
          style: TextStyle(
              fontFamily: 'CustomFont',
              fontSize: 32,
              fontWeight: FontWeight.w500
          ),
        ),
      ) ,
      body: SingleChildScrollView(child: Column(
        children: [
          Container(height: context.height(context) * 0.2,width: context.width(context) * 0.4,color: Colors.red,)
        ],
      )),
    );
  }
}
