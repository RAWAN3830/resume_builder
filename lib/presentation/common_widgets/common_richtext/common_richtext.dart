import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/constant/strings.dart';

class CommonRichText extends StatelessWidget {
  final String title;
  const CommonRichText({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text:  TextSpan(
        style:  TextStyle(
            fontFamily: 'CustomFont',
            fontSize: 32,
            color: Colors.black,
            fontWeight: FontWeight.w500
        ),
        children: <TextSpan>[
          TextSpan(text: title),
          TextSpan(text: '.', style: new TextStyle(fontFamily: 'CustomFont',
              fontSize: 50,
              color: Colors.lightGreen,
              fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }
}
