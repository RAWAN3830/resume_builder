// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:resume/infra/bloc/auth_bloc/email_auth/email_auth_event.dart';
// import 'package:resume/infra/bloc/auth_bloc/email_auth/email_auth_state.dart';
//
// class EmailAuthBlocs extends Bloc<EmailAuthState,EmailAuthEvents>{
//   EmailAuthBlocs():super(InitalState()){
//     on<EmailAuth>(())
//   }
// }

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../services/auth_service/firebase_auth.dart';
import 'email_auth_event.dart';
import 'email_auth_state.dart';

class RegistrationBloc extends Bloc<RegistrationEvent, RegistrationState> {
  RegistrationBloc() : super(RegistrationInitial()) {
    on<RegisterUserEvent>(_onRegisterUser);
  }

  Future<void> _onRegisterUser(
      RegisterUserEvent event, Emitter<RegistrationState> emit) async {
    emit(RegistrationLoading());

    try {
      final userCredential = await FirebaseAuthService.registerUser(
        email: event.email,
        password: event.password,
        name: event.name,
      );

      emit(RegistrationSuccess(userCredential.user!.uid));

    } on FirebaseAuthException catch (authError) {
      emit(RegistrationFailure('Authentication Error: ${authError.message}'));
    } catch (fireStoreError) {
      emit(RegistrationFailure('Database Error: ${fireStoreError.toString()}'));
    }
  }
}
