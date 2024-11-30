import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:resume/core/constant/extension.dart';

import '../../../core/constant/strings.dart';
import '../../../core/constant/theme_colors.dart';

class CommonHeading extends StatelessWidget {
  final String title;
  const CommonHeading({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text:  TextSpan(
        style:  TextStyle(
          fontFamily: Strings.uberFont,
          color: ThemeColors.black,
          fontSize: context.width(context) * 0.040,
          fontWeight: FontWeight.w600,
        ),
        children: <TextSpan>[
          TextSpan(text: title),
          TextSpan(text: '.', style: new TextStyle(fontFamily: 'CustomFont',
              // fontSize: context.height(context) * 0.03,
              fontSize:35,
              color: Colors.lightGreen,
              fontWeight: FontWeight.w500)),
        ],
      ),
    );
    // return   Text(
    //  '${title} .',
    //   style:  TextStyle(
    //       color:Colors.black,
    //       fontFamily: Strings.uberFont,
    //       fontSize: context.width(context) * 0.040,
    //       fontWeight: FontWeight.bold),
    // );
  }
}
