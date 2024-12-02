
abstract class RegistrationState {
  const RegistrationState();

}

class RegistrationInitial extends RegistrationState {}

class RegistrationLoading extends RegistrationState {}

class RegistrationSuccess extends RegistrationState {
  final String userId;
  const RegistrationSuccess(this.userId);

}

class RegistrationFailure extends RegistrationState {
  final String error;

  const RegistrationFailure(this.error);

}
