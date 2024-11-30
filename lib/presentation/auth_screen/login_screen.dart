import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:resume/core/constant/extension.dart';

import '../../core/constant/assets_svg_image.dart';
import '../../core/constant/strings.dart';
import '../../core/constant/theme_colors.dart';
import '../common_widgets/common_buttons/common_save_button.dart';
import '../common_widgets/common_buttons/sign_up_button.dart';
import '../common_widgets/common_text/common_richtext.dart';
import '../common_widgets/common_textfields/comman_textformfield.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var varHeight = context.height(context) * 0.02;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Padding(
            padding: EdgeInsets.all(context.height(context) * 0.02)
                .copyWith(top: context.height(context) * 0.085),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CommonRichText(title: Strings.login),
                // Text(
                //   Strings.login,
                //   style: TextStyle(

                // ),
                Center(
                  child: Padding(
                    padding: EdgeInsets.all(context.height(context) * 0.015),
                    child: SvgPicture.asset(
                      AssetsSvgImage.loginImage4,
                      height: context.height(context) * 0.25,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                CommonTextformfield(
                    controller: emailController,
                    labelText: Strings.labelTextForEmail,
                    errorText: Strings.errorTextForEmail),
                SizedBox(height: varHeight),
                CommonTextformfield(
                    controller: passwordController,
                    labelText: Strings.labelTextForPassword,
                    errorText: Strings.errorTextForPassword),
                Padding(
                  padding: EdgeInsets.only(
                      top: context.height(context) * 0.025,
                      bottom: context.height(context) * 0.03),
                  child: Row(
                    children: [
                      Expanded(
                          child: Divider(
                              color: ThemeColors.black,
                              endIndent: context.width(context) * 0.03)),
                      Text(
                        Strings.or,
                        style: TextStyle(
                          fontFamily: Strings.uberFont,
                          fontSize: context.width(context) * 0.045,
                        ),
                   ),
                      Expanded(
                          child: Divider(
                        color: ThemeColors.black,
                        indent: context.width(context) * 0.03,
                      ))
                    ],
                  ),
                ),
                const SignUpButton(
                  buttonImage: AssetsSvgImage.googleImage,
                  buttonTitle: Strings.googleLogin,
                ),
                SizedBox(height: context.height(context) * 0.05),
                CommonSaveButton(formKey: formKey, buttonTitle: Strings.login,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
