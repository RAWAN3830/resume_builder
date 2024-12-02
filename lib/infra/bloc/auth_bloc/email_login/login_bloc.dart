import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:resume/infra/bloc/auth_bloc/email_login/login_event.dart';
import 'package:resume/infra/bloc/auth_bloc/email_login/login_state.dart';
import '../../../services/auth_service/firebase_auth.dart';


class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<LoginUserEvent>(_onLoginUser);
  }

  Future<void> _onLoginUser(
      LoginUserEvent event, Emitter<LoginState> emit) async {
    emit(LoginLoading());

    try {
      final userCredential = await FirebaseAuthService.loginUser(
        email: event.email,
        password: event.password,
      );

      emit(LoginSuccess(userCredential.user!.uid));
    }
    on FirebaseAuthException catch (authError) {
      emit(LoginFailure('Authentication Error: ${authError.message}'));
    }
    catch (fireStoreError) {
      emit(LoginFailure('Database Error: ${fireStoreError.toString()}'));
    }
  }
}
//
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// import '../../../services/auth_service/firebase_auth.dart';
// import 'login_event.dart';
// import 'login_state.dart';
//
// class LoginBloc extends Bloc<LoginEvent, LoginState> {
//   LoginBloc() : super(LoginInitial()) {
//     on<LoginUserEvent>(_onLoginUser);
//   }
//
//   Future<void> _onLoginUser(
//       LoginUserEvent event, Emitter<LoginState> emit) async {
//     emit(LoginLoading()); // Emit loading state
//
//     try {
//       // Call the FirebaseAuthService for login
//       final userCredential = await FirebaseAuthService.loginUser(
//         email: event.email,
//         password: event.password,
//       );
//
//       // Emit success with user UID
//       emit(LoginSuccess(userCredential.user!.uid));
//     } on FirebaseAuthException catch (authError) {
//       // Emit failure on Firebase authentication errors
//       emit(LoginFailure('Authentication Error: ${authError.message}'));
//     } catch (error) {
//       // Emit failure on general errors
//       emit(LoginFailure('An error occurred: ${error.toString()}'));
//     }
//   }
// }