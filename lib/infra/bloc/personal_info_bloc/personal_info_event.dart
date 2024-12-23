import '../../../domain/personal_info.dart';

abstract class PersonalInfoEvent {}

class SubmitPersonalInfo extends PersonalInfoEvent {
  final PersonalInfoModel personalInfo;

  SubmitPersonalInfo(this.personalInfo);
}
