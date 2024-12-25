import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:resume/infra/bloc/skills_set_bloc/skills_set_bloc.dart';
import 'package:resume/infra/bloc/skills_set_bloc/skills_set_event.dart';
import 'package:resume/infra/bloc/skills_set_bloc/skills_set_state.dart';

class SkillInputForm extends StatefulWidget {
  const SkillInputForm({super.key});

  @override
  State<SkillInputForm> createState() => _SkillInputFormState();
}

class _SkillInputFormState extends State<SkillInputForm> {
  final _formKey = GlobalKey<FormState>();
  final _skillController = TextEditingController();

  @override
  void dispose() {
    _skillController.dispose();
    super.dispose();
  }

  // void _addSkill(BuildContext context, SkillsSetState state) {
  //   if (_formKey.currentState?.validate() ?? false) {
  //     context.read<SkillsSetBloc>().add(AddSkill(
  //           skill: _skillController.text.trim(),
  //           category: state.selectedCategory,
  //         ));
  //     _skillController.clear();
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SkillsSetBloc, SkillsSetState>(
      builder: (context, state) {
        return Column(
          children: [
            DropdownButtonFormField<String>(
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
            ),
            const SizedBox(height: 16),
            Form(
              key: _formKey,
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _skillController,
                      decoration: const InputDecoration(
                        labelText: 'Add a skill',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Please enter a skill';
                        }
                        if (state.categories[state.selectedCategory]!
                            .contains(value.trim())) {
                          return 'Skill already exists in this category';
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState?.validate() ?? false) {
                        context.read<SkillsSetBloc>().add(AddSkill(
                              skill: _skillController.text.trim(),
                              category: state.selectedCategory,
                            ));
                        _skillController.clear();
                      }
                    },
                    child: const Text('Add'),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
