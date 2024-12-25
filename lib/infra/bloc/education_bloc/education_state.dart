import 'package:resume/domain/education_model.dart';

import '../../../domain/personal_info.dart';

abstract class EducationState {}

class EducationInitial extends EducationState {}

class EducationLoading extends EducationState {}

class EducationSuccess extends EducationState {}

class EducationFailure extends EducationState {
  final String error;
  EducationFailure(this.error);
}

class EducationLoaded extends EducationState {
  final List<EducationModel> educationList;

  EducationLoaded(this.educationList );
}