import 'package:flutter/material.dart';

class DynamicTextFieldsState {
  final List<Map<String, TextEditingController>> fieldControllers;

  DynamicTextFieldsState({required this.fieldControllers});

  factory DynamicTextFieldsState.initial() {
    return DynamicTextFieldsState(fieldControllers: []);
  }

  DynamicTextFieldsState copyWith({
    List<Map<String, TextEditingController>>? fieldControllers,
  }) {
    return DynamicTextFieldsState(
      fieldControllers: fieldControllers ?? this.fieldControllers,
    );
  }
}
