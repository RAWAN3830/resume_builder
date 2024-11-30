import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:resume/core/constant/extension.dart';
import 'package:resume/core/constant/strings.dart';

class SignUpButton extends StatelessWidget {
  const SignUpButton(
      {super.key, required this.buttonImage, required this.buttonTitle});

  final String buttonImage;
  final String buttonTitle;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: context.height(context) * 0.07,
        width: double.infinity,
        decoration: BoxDecoration(color: Colors.black12,
          borderRadius: BorderRadius.circular(10),
          // border: Border.all(
          //     width: context.width(context) * 0.003, color: ThemeColors.black),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CircleAvatar(
              backgroundColor: Colors.transparent,
              child: SvgPicture.asset(
                buttonImage,
                fit: BoxFit.fill,
              ),
            ),
            Text(
              buttonTitle,
              style: TextStyle(
                  fontFamily: Strings.uberFont,
                   fontSize: context.width(context) * 0.045,
                  fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }
}
