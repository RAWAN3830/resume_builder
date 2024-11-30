import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:resume/core/constant/assets_svg_image.dart';
import 'package:resume/core/constant/extension.dart';
import 'package:resume/core/constant/strings.dart';
import 'package:resume/core/constant/theme_colors.dart';
import 'package:resume/presentation/auth_screen/login_screen.dart';
import 'package:resume/presentation/common_widgets/common_buttons/common_save_button.dart';
import 'package:resume/presentation/common_widgets/common_buttons/sign_up_button.dart';

import '../common_widgets/common_buttons/common_button.dart';
import '../common_widgets/common_text/common_richtext.dart';
import '../common_widgets/common_textfields/comman_textformfield.dart';
class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}
TextEditingController nameController = TextEditingController();
TextEditingController emailController = TextEditingController();
TextEditingController passwordController = TextEditingController();

final formKey = GlobalKey<FormState>();


class _RegistrationScreenState extends State<RegistrationScreen> {
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
                const CommonRichText(title: Strings.registration),

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
                CommonTextformfield(
                    controller: nameController,
                    labelText: Strings.labelTextForUserName,
                    errorText: Strings.errorTextForUserName),
                SizedBox(height: varHeight),
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
                      top: context.height(context) * 0.01,
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
                          fontSize: context.width(context) * 0.035,
                        ),
                      ),
                      Expanded(
                          child: Divider(
                            color: ThemeColors.black,
                            indent: context.width(context) * 0.02,
                          ))
                    ],
                  ),
                ),
                const SignUpButton(
                  buttonImage: AssetsSvgImage.googleImage,
                  buttonTitle: Strings.googleLogin,
                ),
                SizedBox(height: context.height(context) * 0.03),
                // CommonButton(onTap: (){
                //   context.push(context, target: const LoginScreen());
                // },title: 'continue',)
                Padding(
                  padding: const EdgeInsets.all(0).copyWith(left: 15,right:15),
                  child: CommonSaveButton(formKey: formKey, buttonTitle: Strings.login,),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

