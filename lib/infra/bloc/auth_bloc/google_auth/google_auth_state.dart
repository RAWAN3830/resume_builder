
abstract class AuthState  {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthSuccess extends AuthState {
  final String userName;
  final String userEmail;
  final String? userPhotoUrl;

  AuthSuccess({required this.userName, required this.userEmail, this.userPhotoUrl});
}

class AuthFailure extends AuthState {
  final String errorMessage;

  AuthFailure({required this.errorMessage});
}
