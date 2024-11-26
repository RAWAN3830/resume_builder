import 'package:flutter/material.dart';
import 'package:neopop/utils/color_utils.dart';
import 'package:neopop/utils/constants.dart';
import 'package:neopop/widgets/buttons/neopop_button/neopop_button.dart';
import 'package:resume/core/constant/extension.dart';

class CommonSaveButton extends StatelessWidget {
  final GlobalKey<FormState> formKey;

  const CommonSaveButton({
    super.key,
    required this.formKey,
  });


  @override
  Widget build(BuildContext context) {

    return NeoPopButton(
      color: Colors.transparent,
      buttonPosition: Position.bottomRight,
      bottomShadowColor:
          ColorUtils.getVerticalShadow(const Color(0xff9EF01A)).toColor(),
          // ColorUtils.getVerticalShadow(const Color(0xff9BCC3C)).toColor(),
      rightShadowColor:
          ColorUtils.getHorizontalShadow(const Color(0xff9EF01A)).toColor(),
          // ColorUtils.getHorizontalShadow(const Color(0xff9BCC3C)).toColor(),
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
      border: Border.all(color: const Color(0xff9EF01A), width: 1.4),
      // border: Border.all(color: const Color(0xff74E900), width: 1.4),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 15),
        child: Center(
          child: SizedBox(
            height: 30,
            width: context.width(context) * 0.6,
            child:
                Center(child: const Text('Registration', style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold))),
          ),
        ),
      ),
    );
  }
}
