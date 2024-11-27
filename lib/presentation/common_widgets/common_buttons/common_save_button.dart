import 'package:flutter/material.dart';
import 'package:neopop/utils/color_utils.dart';
import 'package:neopop/utils/constants.dart';
import 'package:neopop/widgets/buttons/neopop_button/neopop_button.dart';
import 'package:resume/core/constant/extension.dart';
import 'package:resume/core/constant/strings.dart';
import 'package:resume/core/constant/theme_colors.dart';

class CommonSaveButton extends StatelessWidget {
  final GlobalKey<FormState> formKey;

  const CommonSaveButton({
    super.key,
    required this.formKey,
    required String buttonTitle,
  });

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
        if (formKey.currentState!.validate()) {
          print('Submit');
          formKey.currentState!.save();

          var snackBar =
              const SnackBar(content: Text('Submitted successfully.'));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      },
      border: Border.all(color: ThemeColors.mainGreenColor, width: 1.4),
      // border: Border.all(color: const Color(0xff74E900), width: 1.4),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 15),
        child: Center(
          child: SizedBox(
            height: context.width(context) * 0.06,
            width: context.width(context) * 0.6,
            child:  Center(
                child: Text(Strings.registration,
                    style: TextStyle(
                        fontFamily: Strings.uberFont,
                        fontSize: context.width(context) * 0.055,
                        fontWeight: FontWeight.bold))),
          ),
        ),
      ),
    );
  }
}
