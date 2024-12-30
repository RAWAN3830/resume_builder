import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:resume/core/constant/extension.dart';
import 'package:resume/presentation/auth_screen/registration_screen.dart';
import 'package:resume/presentation/common_widgets/common_buttons/common_save_button.dart';
import 'package:resume/presentation/home_screen/home_screen.dart';
import '../../core/constant/assets_svg_image.dart';
import '../../core/constant/strings.dart';
import '../../core/constant/theme_colors.dart';
import '../../infra/bloc/auth_bloc/email_login/login_bloc.dart';
import '../../infra/bloc/auth_bloc/email_login/login_event.dart';
import '../../infra/bloc/auth_bloc/email_login/login_state.dart';
import '../common_widgets/common_buttons/sign_up_button.dart';
import '../common_widgets/common_text/common_richtext.dart';
import '../common_widgets/common_textfields/comman_textformfield.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
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
            child: BlocConsumer<LoginBloc, LoginState>(
              builder: (context, state) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (state is LoginLoading)
                      const Center(child: CircularProgressIndicator()),
                    if (state is LoginFailure)
                      Text(
                        "Error: ${state.error}",
                        style: const TextStyle(color: Colors.red),
                      ),
                    SizedBox(height: varHeight),
                    Center(
                      child: Padding(
                        padding:
                            EdgeInsets.all(context.height(context) * 0.015),
                        child: SvgPicture.asset(
                          AssetsSvgImage.loginImage,
                          height: context.height(context) * 0.25,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const CommonRichText(title: Strings.login),
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
                            style: Theme.of(context).textTheme.titleSmall,
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
                    // SizedBox(height: context.height(context) * 0.05),
                    SizedBox(height: varHeight),
                    Center(
                      child: CommonSaveButton(
                          formKey: formKey,
                          onTap: () {
                            if (formKey.currentState?.validate() ?? false) {
                              context.read<LoginBloc>().add(LoginUserEvent(
                                    email: emailController.text,
                                    password: passwordController.text,
                                  ));

                            }
                          },
                          name: 'Login'),
                    ),
                    SizedBox(height: varHeight),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Dont Have Account ? ', style: Theme.of(context).textTheme.bodyLarge),
                        GestureDetector(onTap:(){
                          context.push(context, target: RegistrationScreen());
                        },child: Text(' Register Hear', style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w500,color: ThemeColors.mainGreenColor),))
                      ],
                    )
                  ],
                );
              },
              listener: (context, state) {
                if (state is LoginSuccess) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text(' Successful!')),
                  );
                  context.pushAndRemoveUntil(context,
                      target: const HomeScreen());
                } else if (state is LoginFailure) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Error: ${state.error}')),
                  );
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
