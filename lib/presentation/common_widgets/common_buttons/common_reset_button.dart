import 'package:flutter/material.dart';
import 'package:neopop/utils/color_utils.dart';
import 'package:neopop/utils/constants.dart';
import 'package:neopop/widgets/buttons/neopop_button/neopop_button.dart';
import 'package:resume/core/constant/extension.dart';

import '../../../core/constant/strings.dart';
import '../../../core/constant/theme_colors.dart';

class CommonResetButton extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  const CommonResetButton({super.key, required this.formKey});

  @override
  Widget build(BuildContext context) {
    return NeoPopButton(
      color: Colors.transparent,
      buttonPosition: Position.bottomRight,
      bottomShadowColor:
      ColorUtils.getVerticalShadow(ThemeColors.mainGreenColor).toColor(),
      rightShadowColor:
      ColorUtils.getHorizontalShadow(ThemeColors.mainGreenColor).toColor(),
      animationDuration: const Duration(milliseconds: 20),
      depth: kButtonDepth,
      onTapUp: () {
        formKey.currentState!.reset();
      },
      border: Border.all(color: ThemeColors.mainGreenColor, width: 2),
      // border: Border.all(color: const Color(0xff74E900), width: 1.4),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 05, vertical: 15),
        child: Center(
          child: SizedBox(
            height: context.width(context) * 0.06,
            width: context.width(context) * 0.2,
            child:  Center(
                child: Text(Strings.reset,
                    style: TextStyle(
                        fontFamily: Strings.uberFont,
                        fontSize: context.width(context) * 0.055,
                        fontWeight: FontWeight.bold))),
          ),
        ),
      ),
    );
    // return  ElevatedButton(
    //     style: ButtonStyle(
    //     ),
    //     // backgroundColor:WidgetStateColor.resolveWith((states) => Colors.blue)),
    //     onPressed: () {  formKey.currentState!.reset(); },
    //     child: const Text('Reset',style: TextStyle(fontSize: 18,color: Colors.white)));
  }
}
