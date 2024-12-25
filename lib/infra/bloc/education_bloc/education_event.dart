import 'package:flutter/cupertino.dart';
import 'package:resume/domain/education_model.dart';

abstract class EducationEvent{}

class AddEducationEvent extends EducationEvent {
  final EducationModel? educationModel;
  final BuildContext? context;

  AddEducationEvent (this.educationModel, this.context);
}

class GetEducationEvent extends EducationEvent {}