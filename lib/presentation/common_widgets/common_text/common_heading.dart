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
          fontSize: context.width(context) * 0.045,
          fontWeight: FontWeight.w600,
        ),
        children: <TextSpan>[
          TextSpan(text: title),
          const TextSpan(text: '.', style: TextStyle(fontFamily: 'CustomFont',
              fontSize:35,
              color: Colors.lightGreen,
              fontWeight: FontWeight.w500)),
        ],
      ),
    );

  }
}
