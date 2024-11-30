// class EmailAuthState {
//   final String Email;
//   final String password;
//   final String name;
//
//   EmailAuthState({
//     required this.Email,
//     required this.password,
//     required this.name,
//   });
// }
//
// class InitalState extends EmailAuthState {
//   InitalState()
//       : super(
//       name: 'name_error',
//       Email: 'email_error',
//       password: 'password_error');
// }


abstract class RegistrationState {
  const RegistrationState();
  //
  // @override
  // List<Object> get props => [];
}

class RegistrationInitial extends RegistrationState {}

class RegistrationLoading extends RegistrationState {}

class RegistrationSuccess extends RegistrationState {
  final String userId;

  const RegistrationSuccess(this.userId);

  // @override
  // List<Object> get props => [userId];
}

class RegistrationFailure extends RegistrationState {
  final String error;

  const RegistrationFailure(this.error);
  //
  // @override
  // List<Object> get props => [error];
}
