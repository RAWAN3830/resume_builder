// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:resume/infra/bloc/skills_set_bloc/skills_set_event.dart';
// import 'package:resume/infra/bloc/skills_set_bloc/skills_set_state.dart';
//
// class SkillsSetBloc extends Bloc<SkillsSetEvent, SkillsSetState> {
//   SkillsSetBloc() : super(SkillsSetState.initial()) {
//     on<AddSkill>(_onAddSkill);
//     on<RemoveSkill>(_onRemoveSkill);
//     on<ChangeCategory>(_onChangeCategory);
//   }
//
//   void _onAddSkill(AddSkill event, Emitter<SkillsSetState> emit) {
//     final currentSkills = List<String>.from(state.categories[event.category] ?? []);
//
//     if (currentSkills.contains(event.skill)) {
//       emit(state.copyWith(error: 'Skill already exists in this category'));
//       return;
//     }
//
//     final updatedCategories = Map<String, List<String>>.from(state.categories);
//     updatedCategories[event.category] = [...currentSkills, event.skill];
//
//     emit(state.copyWith(
//       categories: updatedCategories,
//       error: null,
//     ));
//   }
//
//   void _onRemoveSkill(RemoveSkill event, Emitter<SkillsSetState> emit) {
//     final currentSkills = List<String>.from(state.categories[event.category] ?? []);
//     currentSkills.remove(event.skill);
//
//     final updatedCategories = Map<String, List<String>>.from(state.categories);
//     updatedCategories[event.category] = currentSkills;
//
//     emit(state.copyWith(categories: updatedCategories));
//   }
//
//   void _onChangeCategory(ChangeCategory event, Emitter<SkillsSetState> emit) {
//     emit(state.copyWith(selectedCategory: event.category));
//   }
// }

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'skills_set_event.dart';
import 'skills_set_state.dart';

class SkillsSetBloc extends Bloc<SkillsSetEvent, SkillsSetState> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  SkillsSetBloc() : super(SkillsSetState()) {
    on<LoadSkills>(_onLoadSkills);
    on<AddSkill>(_onAddSkill);
    on<RemoveSkill>(_onRemoveSkill);
    on<ChangeCategory>(_onChangeCategory);

    // Load initial data
    add(LoadSkills());
  }

  Future<void> _onLoadSkills(LoadSkills event, Emitter<SkillsSetState> emit) async {
    try {
      emit(state.copyWith(isLoading: true));

      final snapshot = await _firestore.collection('skills_categories').get();
      final Map<String, List<String>> categories = {};

      for (var doc in snapshot.docs) {
        categories[doc.id] = List<String>.from(doc.data()['skills'] ?? []);
      }

      // If no categories exist in Firestore, initialize with defaults
      if (categories.isEmpty) {
        categories.addAll(SkillsSetState.defaultCategories);
        // Save default categories to Firestore
        for (var entry in categories.entries) {
          await _firestore.collection('skills_categories').doc(entry.key).set({
            'skills': entry.value,
          });
        }
      }

      emit(state.copyWith(
        categories: categories,
        isLoading: false,
        selectedCategory: categories.keys.first,
      ));
    } catch (e) {
      emit(state.copyWith(
        isLoading: false,
        error: 'Failed to load skills: ${e.toString()}',
      ));
    }
  }

  Future<void> _onAddSkill(AddSkill event, Emitter<SkillsSetState> emit) async {
    try {
      final currentSkills = List<String>.from(state.categories[event.category] ?? []);
      if (!currentSkills.contains(event.skill)) {
        currentSkills.add(event.skill);

        final updatedCategories = Map<String, List<String>>.from(state.categories);
        updatedCategories[event.category] = currentSkills;

        // Update Firestore
        await _firestore
            .collection('skills_categories')
            .doc(event.category)
            .set({'skills': currentSkills});

        emit(state.copyWith(categories: updatedCategories));
      }
    } catch (e) {
      emit(state.copyWith(error: 'Failed to add skill: ${e.toString()}'));
    }
  }

  Future<void> _onRemoveSkill(RemoveSkill event, Emitter<SkillsSetState> emit) async {
    try {
      final currentSkills = List<String>.from(state.categories[event.category] ?? []);
      currentSkills.remove(event.skill);

      final updatedCategories = Map<String, List<String>>.from(state.categories);
      updatedCategories[event.category] = currentSkills;

      // Update Firestore
      await _firestore
          .collection('skills_categories')
          .doc(event.category)
          .set({'skills': currentSkills});

      emit(state.copyWith(categories: updatedCategories));
    } catch (e) {
      emit(state.copyWith(error: 'Failed to remove skill: ${e.toString()}'));
    }
  }

  void _onChangeCategory(ChangeCategory event, Emitter<SkillsSetState> emit) {
    emit(state.copyWith(selectedCategory: event.category));
  }
}