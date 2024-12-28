import 'package:flutter/cupertino.dart';

class EducationState {
  final List<Map<String, TextEditingController>> controllersList;
  final List<bool> expansionStates;

  EducationState({required this.controllersList, required this.expansionStates});

  EducationState copyWith({
    List<Map<String, TextEditingController>>? controllersList,
    List<bool>? expansionStates,
  }) {
    return EducationState(
      controllersList: controllersList ?? this.controllersList,
      expansionStates: expansionStates ?? this.expansionStates,
    );
  }
}