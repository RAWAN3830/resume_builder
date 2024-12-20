import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:resume/infra/bloc/auth_bloc/email_login/login_bloc.dart';
import 'package:resume/presentation/home_screen/home_screen.dart';
import 'package:resume/presentation/skill_sets_screen.dart';
import '../core/constant/strings.dart';
import '../firebase_options.dart';
import '../infra/bloc/auth_bloc/email_auth/email_auth_bloc.dart';
import '../infra/bloc/auth_bloc/google_auth/google_auth_bloc.dart';
import 'package:firebase_core/firebase_core.dart';



void main() async{
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
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => RegistrationBloc(),),
        BlocProvider(create: (context) => LoginBloc(),),
        BlocProvider(create: (context) => AuthBloc(),),
        // BlocProvider(create: (context) => DynamicTextFieldsBloc(),)
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
        // home: const LoginScreen(),
        // home: const RegistrationScreen(),
      ),
    );
  }
}
