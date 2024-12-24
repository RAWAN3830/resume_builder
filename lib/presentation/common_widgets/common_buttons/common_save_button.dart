
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:resume/core/constant/extension.dart';
import 'package:resume/core/constant/theme_colors.dart';

import '../../../core/constant/strings.dart';
class CommonSaveButton extends StatelessWidget {
  final Function onTap;
  final String name;
  final GlobalKey<FormState> formKey;

  const CommonSaveButton({
    super.key,
    required this.formKey,
    required this.onTap,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (formKey.currentState!.validate()) {
          formKey.currentState!.save();
          onTap();

          var snackBar =
          const SnackBar(content: Text('Submitted successfully.'));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      },
      child: Container(
        height: context.height(context) * 0.07,
        width: context.width(context) * 0.7,
        decoration: BoxDecoration(
          color: ThemeColors.black,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            name,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Colors.white),
            // style: TextStyle(
            //   color: ThemeColors.white,
            //   fontFamily: Strings.uberFont,
            //   fontSize: context.width(context) * 0.05,
            //   fontWeight: FontWeight.w500,
            // ),
          ),
        ),
      ),
    );
  }
}

