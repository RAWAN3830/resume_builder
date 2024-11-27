import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:resume/core/constant/assets_svg_image.dart';
import 'package:resume/core/constant/extension.dart';
import 'package:resume/core/constant/strings.dart';
import 'package:resume/core/constant/theme_colors.dart';
import 'package:resume/presentation/common_widgets/common_buttons/common_save_button.dart';
import 'package:resume/presentation/common_widgets/common_buttons/sign_up_button.dart';
import 'package:resume/presentation/common_widgets/common_textfields/common_require_Textfield.dart';

class RegistrationScreen extends StatelessWidget {
  const RegistrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    final formKey = GlobalKey<FormState>();
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
                Text(
                  Strings.registration,
                  style: TextStyle(
                      fontFamily: Strings.uberFont,
                      fontSize: context.width(context) * 0.1,
                      fontWeight: FontWeight.w600),
                ),
                Center(
                  child: Padding(
                    padding: EdgeInsets.all(context.height(context) * 0.015),
                    child: SvgPicture.asset(
                      AssetsSvgImage.registrationImage,
                      height: context.height(context) * 0.25,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                CommonRequiredTextFields(
                    controller: nameController,
                    labelText: Strings.labelTextForUserName,
                    errorText: Strings.errorTextForUserName),
                SizedBox(height: varHeight),
                CommonRequiredTextFields(
                    controller: emailController,
                    labelText: Strings.labelTextForEmail,
                    errorText: Strings.errorTextForEmail),
                SizedBox(height: varHeight),
                CommonRequiredTextFields(
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
