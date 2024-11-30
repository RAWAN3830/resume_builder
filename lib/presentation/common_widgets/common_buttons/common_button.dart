import 'package:flutter/cupertino.dart';
import 'package:resume/core/constant/extension.dart';
import 'package:resume/core/constant/strings.dart';
import 'package:resume/core/constant/theme_colors.dart';

class CommonButton extends StatelessWidget {
  final Function onTap;
  final String title;
  const CommonButton({super.key, required this.onTap, required this.title});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){onTap;},
      child: Container(
        height: context.height(context) * 0.07,
        width: context.width(context) * 9,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: ThemeColors.black,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(title,
                style: TextStyle(
                    color: ThemeColors.white,
                    fontSize: context.height(context) * 0.022,
                    fontWeight: FontWeight.w500,
                    fontFamily: Strings.uberFont)),
            // SizedBox(width: context.width(context) * 0.04,),
            // Icon(CupertinoIcons.right_chevron,color:ThemeColors.white,)
          ],
        ),
      ),
    );
  }
}

