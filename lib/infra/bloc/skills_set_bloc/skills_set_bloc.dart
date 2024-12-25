import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:resume/infra/bloc/skills_set_bloc/skills_set_event.dart';
import 'package:resume/infra/bloc/skills_set_bloc/skills_set_state.dart';

class SkillsSetBloc extends Bloc<SkillsSetEvent, SkillsSetState> {
  SkillsSetBloc() : super(SkillsSetState.initial()) {
    on<AddSkill>(_onAddSkill);
    on<RemoveSkill>(_onRemoveSkill);
    on<ChangeCategory>(_onChangeCategory);
  }

  void _onAddSkill(AddSkill event, Emitter<SkillsSetState> emit) {
    final currentSkills = List<String>.from(state.categories[event.category] ?? []);

    if (currentSkills.contains(event.skill)) {
      emit(state.copyWith(error: 'Skill already exists in this category'));
      return;
    }

    final updatedCategories = Map<String, List<String>>.from(state.categories);
    updatedCategories[event.category] = [...currentSkills, event.skill];

    emit(state.copyWith(
      categories: updatedCategories,
      error: null,
    ));
  }

  void _onRemoveSkill(RemoveSkill event, Emitter<SkillsSetState> emit) {
    final currentSkills = List<String>.from(state.categories[event.category] ?? []);
    currentSkills.remove(event.skill);

    final updatedCategories = Map<String, List<String>>.from(state.categories);
    updatedCategories[event.category] = currentSkills;

    emit(state.copyWith(categories: updatedCategories));
  }

  void _onChangeCategory(ChangeCategory event, Emitter<SkillsSetState> emit) {
    emit(state.copyWith(selectedCategory: event.category));
  }
}