import '../../../domain/experience_model.dart';

abstract class ExperienceState{}

class ExperienceInitial extends ExperienceState {}

class ExperiencesLoading extends ExperienceState{}

class ExperiencesSuccess extends ExperienceState{
  final List<ExperienceModel> experienceModel;
  ExperiencesSuccess(this.experienceModel);
}

class ExperiencesFailure extends ExperienceState{
  final String error;
  ExperiencesFailure(this.error);
}

class ExperiencesUpdated extends ExperienceState{
  final List<ExperienceModel> experienceList;
  ExperiencesUpdated(this.experienceList);
}