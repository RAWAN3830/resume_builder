import 'package:flutter_bloc/flutter_bloc.dart';
import 'education_event.dart';
import 'education_state.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class EducationBloc extends Bloc<EducationEvent, EducationState> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final String _userId = 'uniqueUserId'; // Hardcoded user ID

  EducationBloc()
      : super(EducationState(controllersList: [], expansionStates: [])) {
    on<AddEducationField>(_onAddEducationField);
    on<DeleteEducationField>(_onDeleteEducationField);
    on<SaveEducation>(_onSaveEducation);
    on<UpdateExpansionState>(_onUpdateExpansionState);
  }

  void _onAddEducationField(AddEducationField event, Emitter<EducationState> emit) {
    if (state.controllersList.length < 4) {
      final newControllersList = List<Map<String, TextEditingController>>.from(state.controllersList)
        ..add({
          'institution': TextEditingController(),
          'location': TextEditingController(),
          'degreeType': TextEditingController(),
          'fieldOfStudy': TextEditingController(),
          'startDate': TextEditingController(),
          'endDate': TextEditingController(),
        });

      final newExpansionStates = List<bool>.from(state.expansionStates)..add(true);

      emit(state.copyWith(
        controllersList: newControllersList,
        expansionStates: newExpansionStates,
      ));
    }
  }

  void _onDeleteEducationField(DeleteEducationField event, Emitter<EducationState> emit) {
    if (event.index >= 0 && event.index < state.controllersList.length) {
      final newControllersList = List<Map<String, TextEditingController>>.from(state.controllersList)
        ..removeAt(event.index);

      final newExpansionStates = List<bool>.from(state.expansionStates)..removeAt(event.index);

      emit(state.copyWith(
        controllersList: newControllersList,
        expansionStates: newExpansionStates,
      ));
    }
  }

  Future<void> _onSaveEducation(SaveEducation event, Emitter<EducationState> emit) async {
    List<Map<String, dynamic>> educationData = state.controllersList.map((controllers) {
      return {
        'institution': controllers['institution']?.text ?? '',
        'location': controllers['location']?.text ?? '',
        'degreeType': controllers['degreeType']?.text ?? '',
        'fieldOfStudy': controllers['fieldOfStudy']?.text ?? '',
        'startDate': controllers['startDate']?.text ?? '',
        'endDate': controllers['endDate']?.text ?? '',
      };
    }).toList();

    try {
      await _firestore.collection('users').doc(_userId).set({
        'education': educationData,
      });
      debugPrint('Education details saved successfully!');
    } catch (e) {
      debugPrint('Error saving education details: $e');
    }
  }

  void _onUpdateExpansionState(UpdateExpansionState event, Emitter<EducationState> emit) {
    final newExpansionStates = List<bool>.from(state.expansionStates)
      ..[event.index] = event.isExpanded;

    emit(state.copyWith(expansionStates: newExpansionStates));
  }
}