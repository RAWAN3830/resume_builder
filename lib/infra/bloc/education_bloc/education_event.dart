abstract class EducationEvent {}

class AddEducationField extends EducationEvent {}

class DeleteEducationField extends EducationEvent {
  final int index;

  DeleteEducationField(this.index);
}

class SaveEducation extends EducationEvent {}

class UpdateExpansionState extends EducationEvent {
  final int index;
  final bool isExpanded;

  UpdateExpansionState(this.index, this.isExpanded);
}