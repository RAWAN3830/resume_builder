import 'package:flutter/material.dart';
import 'package:resume/core/constant/extension.dart';
import 'package:resume/core/constant/strings.dart';
import 'package:resume/presentation/common_widgets/common_buttons/common_save_button.dart';
import 'package:resume/presentation/common_widgets/common_textfields/common_require_Textfield.dart';

class RegistrationScreen extends StatelessWidget {
  const RegistrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    final formKey = GlobalKey<FormState>();
    var varHeight = context.height(context)*0.025;


    return Scaffold(
      body: Form(
        key: formKey,
        child: Padding(
          padding:  EdgeInsets.all(context.height(context)*0.01).copyWith(top: context.height(context)*0.1),
          child: Column(
            children: [
              const Text(
                Strings.registration,
                style: TextStyle(
                  fontFamily: 'CustomFont',
                  fontSize: 30,
                ),
              ),
              SizedBox(height: varHeight),
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
              SizedBox(height: varHeight),
              const Row(
                children: [
                  Expanded(child: Divider()),
                  Text(
                    'OR',
                    style: TextStyle(
                      fontFamily: 'CustomFont',
                      fontSize: 16,
                    ),
                  ),
                  Expanded(child: Divider())
                ],
              ),
              SizedBox(height: varHeight),
              CommonSaveButton(formKey: formKey)
            ],
          ),
        ),
      ),
    );
  }
}
