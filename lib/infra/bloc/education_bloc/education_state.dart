import '../../../domain/education_model.dart';

abstract class EducationState {}

class EducationInitial extends EducationState {}

class  EducationLoading extends EducationState {}

class  EducationSuccess extends EducationState {}

class  EducationFailure extends EducationState {
  final String error;

  EducationFailure(this.error);
}

class EducationUpdated extends EducationState {
  final List<EducationModel> educationList;

  EducationUpdated(this.educationList);
}
