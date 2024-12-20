import 'package:flutter/cupertino.dart';
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
    return GestureDetector(
      onTap: (){
        formKey.currentState!.reset();
      },
      child: Container(
          height: context.width(context) * 0.14,
          width: context.width(context) * 0.15,
          decoration: BoxDecoration(
              color: ThemeColors.black, borderRadius: BorderRadius.circular(10)),
          child: Center(
              child: IconButton(
            onPressed: () {},
            icon: Icon(CupertinoIcons.delete),
            color: ThemeColors.white,
            iconSize: 30,
            alignment: Alignment.center,
          ))),
    );

  }
}
