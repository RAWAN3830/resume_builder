import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:resume/core/constant/strings.dart';
import 'package:resume/core/constant/theme_colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;

  const CustomAppBar({Key? key, required this.title, this.actions})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      // toolbarHeight: 90,
      title: Text(title,
          style:  TextStyle(
              color: ThemeColors.black,
              fontFamily: Strings.uberFont,
              fontSize: 24,
              fontWeight: FontWeight.w500)),
      leading: InkWell(
        onTap: () {
          Navigator.of(context).pop();
        },
        child: const Icon(
          CupertinoIcons.back,
          color: Colors.white,
          size: 26
        ),
      ),
      actions: actions,
      backgroundColor: ThemeColors.mainGreenColor,
      elevation: 4.0,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
