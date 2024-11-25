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
      color: Colors.black,
      buttonPosition: Position.bottomRight,
      bottomShadowColor:
          ColorUtils.getVerticalShadow(const Color(0xff9BCC3C)).toColor(),
      rightShadowColor:
          ColorUtils.getHorizontalShadow(const Color(0xff9BCC3C)).toColor(),
      animationDuration: const Duration(milliseconds: 30),
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
      border: Border.all(color: const Color(0xff74E900), width: 1.4),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 15),
        child: SizedBox(
          height: 20,
          width: context.width(context) * 0.9,
          child:
              const Text('Registration', style: TextStyle(color: Colors.white)),
        ),
      ),
    );
  }
}
