import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import '../../../domain/experience_model.dart';
import '../../services/experience_service/experience_repository.dart';
import 'experiences_events.dart';
import 'experiences_state.dart';

class ExperienceBloc extends Bloc<ExperienceEvent, ExperienceState> {
  final CollectionReference personalInfoCollection =
  FirebaseFirestore.instance.collection('Experience');
  final FirebaseAuth _auth = FirebaseAuth.instance;

  ExperienceBloc({FirebaseFirestore? firestore})
      : super(ExperienceState(controllersList: [], expansionStates: [])) {
    on<AddExperienceField>(_onAddExperienceField);
    on<DeleteExperienceField>(_onDeleteExperienceField);
    on<SaveExperience>(_onSaveExperience);
    on<UpdateExpansionState>(_onUpdateExpansionState);
  }

  void _onAddExperienceField(AddExperienceField event, Emitter<ExperienceState> emit) {
    if (state.controllersList.length < 4) {
      final newControllersList = List<Map<String, TextEditingController>>.from(state.controllersList)
        ..add({
          'employer': TextEditingController(),
          'jobTitle': TextEditingController(),
          'location': TextEditingController(),
          'startDate': TextEditingController(),
          'endDate': TextEditingController(),
          'description': TextEditingController(),
        });

      final newExpansionStates = List<bool>.from(state.expansionStates)..add(true);

      emit(state.copyWith(
        controllersList: newControllersList,
        expansionStates: newExpansionStates,
      ));
    }
  }

  void _onDeleteExperienceField(DeleteExperienceField event, Emitter<ExperienceState> emit) {
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

  Future<void> _onSaveExperience(SaveExperience event, Emitter<ExperienceState> emit) async {
    List<Map<String, dynamic>> experienceData = state.controllersList.map((controllers) {
      return {
        'employer': controllers['employer']?.text ?? '',
        'jobTitle': controllers['jobTitle']?.text ?? '',
        'location': controllers['location']?.text ?? '',
        'startDate': controllers['startDate']?.text ?? '',
        'endDate': controllers['endDate']?.text ?? '',
        'description': controllers['description']?.text ?? '',
      };
    }).toList();

    try {
      final User? user = _auth.currentUser; // Get the current logged-in user
      if (user == null) {
        debugPrint('No authenticated user found.');
        return;
      }

      final String userId = user.uid; // Fetch the unique user ID

      await personalInfoCollection.doc(userId).set({
        'experience': experienceData,
      }, SetOptions(merge: true)); // Merge to avoid overwriting other fields
      debugPrint('Experience details saved successfully!');
    } catch (e) {
      debugPrint('Error saving experience details: $e');
    }
  }

  void _onUpdateExpansionState(UpdateExpansionState event, Emitter<ExperienceState> emit) {
    final newExpansionStates = List<bool>.from(state.expansionStates)
      ..[event.index] = event.isExpanded;

    emit(state.copyWith(expansionStates: newExpansionStates));
  }

  @override
  Future<void> close() {
    for (var controllers in state.controllersList) {
      for (var controller in controllers.values) {
        controller.dispose();
      }
    }
    return super.close();
  }
}

