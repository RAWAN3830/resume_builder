import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:resume/core/constant/extension.dart';
import 'package:resume/core/constant/strings.dart';

import '../../../infra/bloc/auth_bloc/google_auth/google_auth_bloc.dart';
import '../../../infra/bloc/auth_bloc/google_auth/google_auth_event.dart';
import '../../../infra/bloc/auth_bloc/google_auth/google_auth_state.dart';

class SignUpButton extends StatelessWidget {
  const SignUpButton(
      {super.key, required this.buttonImage, required this.buttonTitle});

  final String buttonImage;
  final String buttonTitle;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc,AuthState>(
      listener: (context, state) {
        if (state is AuthFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.errorMessage)),
          );
        } else if (state is AuthSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Welcome, ${state.userName}!")),
          );
        }
      },
      builder: (context, state) {
        if (state is AuthInitial) {
          return GestureDetector(
            onTap: (){
                return context.read<AuthBloc>().add(GoogleSignInEvent());
            },
            child: Center(
              child: Container(
                height: context.height(context) * 0.07,
                width: double.infinity,
                decoration: BoxDecoration(color: Colors.black12,
                  borderRadius: BorderRadius.circular(10),
                  // border: Border.all(
                  //     width: context.width(context) * 0.003, color: ThemeColors.black),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.transparent,
                      child: SvgPicture.asset(buttonImage,
                        fit: BoxFit.fill,
                      ),
                    ),
                    Text(
                      buttonTitle,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ],
                ),
              ),
            ),
          );
        } else if (state is AuthLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        else if (state is AuthSuccess) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Welcome, ${state.userName}!"),
                if (state.userPhotoUrl != null)
                  Image.network(state.userPhotoUrl!),
              ],
            ),
          );
        } else if (state is AuthFailure) {
          return Center(child: Text("Error: ${state.errorMessage}"));
        }
        return const SizedBox.shrink();
      },
    );

  }
}
