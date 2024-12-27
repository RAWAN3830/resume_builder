import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:resume/core/constant/assets_svg_image.dart';
import 'package:resume/core/constant/extension.dart';
import 'package:resume/core/constant/strings.dart';
import 'package:resume/core/constant/theme_colors.dart';
import 'package:resume/infra/bloc/auth_bloc/email_auth/email_auth_bloc.dart';
import 'package:resume/infra/bloc/auth_bloc/email_auth/email_auth_state.dart';
import 'package:resume/presentation/auth_screen/login_screen.dart';
import 'package:resume/presentation/common_widgets/common_buttons/common_save_button.dart';
import 'package:resume/presentation/common_widgets/common_buttons/sign_up_button.dart';
import 'package:resume/presentation/home_screen/home_screen.dart';
import '../../infra/bloc/auth_bloc/email_auth/email_auth_event.dart';
import '../common_widgets/common_text/common_richtext.dart';
import '../common_widgets/common_textfields/comman_textformfield.dart';
class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}
final nameController = TextEditingController();
final emailController = TextEditingController();
final passwordController = TextEditingController();
final formKey = GlobalKey<FormState>();


class _RegistrationScreenState extends State<RegistrationScreen> {
  @override
  Widget build(BuildContext context) {
    var varHeight = context.height(context) * 0.02;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: BlocConsumer<RegistrationBloc,RegistrationState>(
        listener: (context, state) {
          if(state is RegistrationSuccess){
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Registration Successful!')),
            );
            context.pushAndRemoveUntil(context, target: const HomeScreen());
          }
          else if (state is RegistrationFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Error: ${state.error}')),
            );
          }
        },
        builder: (context, state) {
          if (state is RegistrationLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          return SingleChildScrollView(
            padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.height * 0.011,
              vertical: MediaQuery.of(context).size.height * 0.01,
            ),
            child: Form(
              key: formKey,
              child: Padding(
                padding: EdgeInsets.all(context.height(context) * 0.02)
                    .copyWith(top: context.height(context) * 0.010),
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
                      child:   Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Divider(
                                color: ThemeColors.black,
                                thickness: 1,
                                endIndent: 10,
                              ),
                            ),
                              Text(
                              Strings.or,
                                style: Theme.of(context).textTheme.titleLarge,

                              ),
                            Expanded(
                              child: Divider(
                                color: ThemeColors.black,
                                thickness: 1,
                                indent: 10,
                              ),
                            ),
                          ],
                        ),
                      ),

                    ),
                    const SignUpButton(
                      buttonImage: AssetsSvgImage.googleImage,
                      buttonTitle: Strings.googleLogin,
                    ),
                    SizedBox(height: varHeight),
                    CommonSaveButton(formKey: formKey, onTap: (){
                      if (formKey.currentState!.validate()) {
                        formKey.currentState!.save();
                        if (formKey.currentState?.validate() ?? false) {
                          context.read<RegistrationBloc>().add(
                            RegisterUserEvent(
                              email: emailController.text,
                              password: passwordController.text,
                              name: nameController.text,
                            ),
                          );
                        }
                        var snackBar =
                        const SnackBar(content: Text('Submitted successfully.'));
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);

                      }


                    }, name: Strings.saveContinue),

                          ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

