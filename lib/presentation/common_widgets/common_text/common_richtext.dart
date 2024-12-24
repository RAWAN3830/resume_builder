import 'package:flutter/material.dart';
import 'package:resume/core/constant/extension.dart';
import 'package:resume/core/constant/theme_colors.dart';

import '../../../core/constant/strings.dart';

class CommonRichText extends StatelessWidget {
  final String title;
  const CommonRichText({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text:  TextSpan(
        style: Theme.of(context).textTheme.displaySmall?.copyWith(fontWeight: FontWeight.bold),

        children: <TextSpan>[
          TextSpan(text: title),
          const TextSpan(text: '.', style: TextStyle(fontFamily: 'CustomFont',
              fontSize: 50,
              color: Colors.lightGreen,
              fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }
}
