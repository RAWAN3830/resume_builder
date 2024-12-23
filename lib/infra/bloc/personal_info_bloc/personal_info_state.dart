abstract class PersonalInfoState {}

class PersonalInfoInitial extends PersonalInfoState {}

class PersonalInfoSubmitting extends PersonalInfoState {}

class PersonalInfoSuccess extends PersonalInfoState {}

class PersonalInfoFailure extends PersonalInfoState {
  final String error;

  PersonalInfoFailure(this.error);
}
