import '../../../domain/personal_info.dart';

abstract class PersonalInfoState {}

class PersonalInfoInitial extends PersonalInfoState {}

class PersonalInfoLoading extends PersonalInfoState {}

class PersonalInfoSuccess extends PersonalInfoState {}

class PersonalInfoFailure extends PersonalInfoState {
  final String error;

  PersonalInfoFailure(this.error);
}

class PersonalInfoLoaded extends PersonalInfoState {
  final List<PersonalInfoModel> personalInfoList;

  PersonalInfoLoaded(this.personalInfoList);
}