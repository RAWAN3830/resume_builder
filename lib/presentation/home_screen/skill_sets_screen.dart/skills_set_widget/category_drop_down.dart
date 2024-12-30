import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:resume/infra/bloc/skills_set_bloc/skills_set_bloc.dart';
import 'package:resume/infra/bloc/skills_set_bloc/skills_set_event.dart';
import 'package:resume/infra/bloc/skills_set_bloc/skills_set_state.dart';

class CategoryDropdown extends StatelessWidget {
  const CategoryDropdown({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SkillsSetBloc, SkillsSetState>(
      builder: (context, state) {
        return DropdownButtonFormField<String>(
          value: state.selectedCategory,
          decoration: const InputDecoration(
            labelText: 'Select Category',
            border: OutlineInputBorder(),
          ),
          items: state.categories.keys
              .map((category) => DropdownMenuItem(
            value: category,
            child: Text(category),
          ))
              .toList(),
          onChanged: (value) {
            if (value != null) {
              context
                  .read<SkillsSetBloc>()
                  .add(ChangeCategory(category: value));
            }
          },
        );
      },
    );
  }
}