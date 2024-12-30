import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:resume/core/theme_data/breakpoint_enum.dart';
import 'package:resume/infra/bloc/auth_bloc/email_login/login_bloc.dart';
import 'package:resume/infra/bloc/personal_info_bloc/personal_info_bloc.dart';
import 'package:resume/infra/bloc/skills_set_bloc/skills_set_bloc.dart';
import 'package:resume/presentation/home_screen/home_screen.dart';
import '../core/constant/strings.dart';
import '../firebase_options.dart';
import '../infra/bloc/auth_bloc/email_auth/email_auth_bloc.dart';
import '../infra/bloc/auth_bloc/google_auth/google_auth_bloc.dart';
import 'package:firebase_core/firebase_core.dart';

import 'auth_screen/registration_screen.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveBreakpoints.builder(
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => RegistrationBloc(),
          ),
          BlocProvider(
            create: (context) => LoginBloc(),
          ),
          BlocProvider(
            create: (context) => AuthBloc(),
          ),
          BlocProvider(
            create: (context) => PersonalInfoBloc(),
          ),
          BlocProvider(
            create: (context) => SkillsSetBloc(),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            fontFamily: Strings.uberFont,
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightGreen),
            useMaterial3: true,
          ),
          // home: const SkillSetsScreen(),
          home: const HomeScreen(),
          // home:  DynamicTextFields(),
          //  home: const LoginScreen(),
          //  home: const RegistrationScreen(),
        ),
      ),
      breakpoints: [
        BreakpointEnum.mobile.point,
        BreakpointEnum.tablet.point,
        BreakpointEnum.desktop.point,
      ],
    );
  }
}
