// import '../../../domain/experience_model.dart';
//
// abstract class ExperienceState{}
//
// class ExperienceInitial extends ExperienceState {}
//
// class ExperiencesLoading extends ExperienceState{}
//
// class ExperiencesSuccess extends ExperienceState{
//   final List<ExperienceModel> experienceModel;
//   ExperiencesSuccess(this.experienceModel);
// }
//
// class ExperiencesFailure extends ExperienceState{
//   final String error;
//   ExperiencesFailure(this.error);
// }
//
// class ExperiencesUpdated extends ExperienceState{
//   final List<ExperienceModel> experienceList;
//   ExperiencesUpdated(this.experienceList);
// }

import 'package:flutter/cupertino.dart';

class ExperienceState {
  final List<Map<String, TextEditingController>> controllersList;
  final List<bool> expansionStates;

  ExperienceState({required this.controllersList, required this.expansionStates});

  ExperienceState copyWith({
    List<Map<String, TextEditingController>>? controllersList,
    List<bool>? expansionStates,
  }) {
    return ExperienceState(
      controllersList: controllersList ?? this.controllersList,
      expansionStates: expansionStates ?? this.expansionStates,
    );
  }
}