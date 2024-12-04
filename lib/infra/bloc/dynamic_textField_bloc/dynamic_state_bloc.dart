import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter/material.dart';

import 'dynamic_text_event.dart';
import 'dynamic_text_state.dart';

class DynamicTextFieldsBloc extends Bloc<DynamicTextFieldsEvent, DynamicTextFieldsState> {
  DynamicTextFieldsBloc() : super(DynamicTextFieldsState.initial()) {
    // Register event handlers
    on<AddFieldEvent>(_onAddFieldEvent);
    on<RemoveFieldEvent>(_onRemoveFieldEvent);
  }

  void _onAddFieldEvent(AddFieldEvent event, Emitter<DynamicTextFieldsState> emit) {
    // Add a new field
    final updatedFields = List<Map<String, TextEditingController>>.from(state.fieldControllers);
    updatedFields.add({'link': TextEditingController(), 'name': TextEditingController()});
    emit(state.copyWith(fieldControllers: updatedFields));
  }

  void _onRemoveFieldEvent(RemoveFieldEvent event, Emitter<DynamicTextFieldsState> emit) {
    // Remove a field
    final updatedFields = List<Map<String, TextEditingController>>.from(state.fieldControllers);
    updatedFields.removeAt(event.index);
    emit(state.copyWith(fieldControllers: updatedFields));
  }
}
