// abstract class EmailAuthEvents{}
// class EmailAuth extends EmailAuthEvents{}
//


abstract class RegistrationEvent {
  const RegistrationEvent();

  // List<Object> get props => [];
}

class RegisterUserEvent extends RegistrationEvent {
  final String email;
  final String password;
  final String name;

  const RegisterUserEvent({
    required this.email,
    required this.password,
    required this.name,
  });

  // @override
  // List<Object> get props => [email, password, name];
}
