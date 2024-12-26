import 'package:flutter/cupertino.dart';
import '../../../domain/education_model.dart';

abstract class EducationEvent {}

class AddEducation extends EducationEvent {
  final BuildContext context;
  final EducationModel education;

  AddEducation(this.education, this.context);
}

class UpdateEducation extends EducationEvent {
  final int index;
  final EducationModel updatedEducation;
  UpdateEducation(this.index, this.updatedEducation);
}

class DeleteEducation extends EducationEvent {
  final int index;
  DeleteEducation(this.index);
}
class GetEducationEvent extends EducationEvent{}

class ResetEducation extends EducationEvent {}

class LoadingEducation extends EducationEvent {}
