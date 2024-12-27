import 'package:flutter/material.dart';
import 'package:resume/domain/experience_model.dart';


abstract class ExperiencesEvent{}

class AddExperiencesEvent extends ExperiencesEvent{
  final ExperienceModel experienceModel;
  final BuildContext context;

  AddExperiencesEvent(this.experienceModel, this.context);
}

class UpdateExperiencesEvent extends ExperiencesEvent{
  final ExperienceModel experienceModel;
  final int index;

  UpdateExperiencesEvent(this.experienceModel, this.index);
}

class DeleteExperience extends ExperiencesEvent {
  final int index;
  DeleteExperience(this.index);
}

// class GetEducationEvent extends EducationEvent{}
//
// class ResetEducation extends EducationEvent {}

class LoadingEducation extends ExperiencesEvent {}

