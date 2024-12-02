import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../services/auth_service/firebase_google_auth.dart';
import 'google_auth_event.dart';
import 'google_auth_state.dart';


class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<GoogleSignInEvent>(_onGoogleSignIn);
  }

  Future<void> _onGoogleSignIn(
      GoogleSignInEvent event,
      Emitter<AuthState> emit,
      ) async {
    emit(AuthLoading());
    try {
      final credential = await FirebaseGoogleAuth.googleSignUp();
      if (credential == null) {
        emit(AuthFailure(errorMessage: "Google Sign-In failed."));
        return;
      }

      final user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        emit(AuthSuccess(
          userName: user.displayName ?? "No Name",
          userEmail: user.email ?? "No Email",
          userPhotoUrl: user.photoURL,
        ));
      } else {
        emit(AuthFailure(errorMessage: "User not found after sign-in."));
      }
    } catch (e) {
      emit(AuthFailure(errorMessage: e.toString()));
    }
  }
}
