import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:resume/core/constant/theme_colors.dart';
import 'package:resume/infra/bloc/skills_set_bloc/skills_set_bloc.dart';
import 'package:resume/infra/bloc/skills_set_bloc/skills_set_event.dart';

class SkillCategoryTile extends StatefulWidget {
  final String category;
  final List<String> skills;

  const SkillCategoryTile({
    super.key,
    required this.category,
    required this.skills,
  });

  @override
  State<SkillCategoryTile> createState() => _SkillCategoryTileState();
}

class _SkillCategoryTileState extends State<SkillCategoryTile> {
  final TextEditingController _skillController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _isExpanded = false;

  @override
  void dispose() {
    _skillController.dispose();
    super.dispose();
  }

  void _addSkill(BuildContext context) {
    if (_formKey.currentState?.validate() ?? false) {
      context.read<SkillsSetBloc>().add(AddSkill(
        skill: _skillController.text.trim(),
        category: widget.category,
      ));
      _skillController.clear();
    }
  }

  String? _validateSkill(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Please enter a skill';
    }
    if (widget.skills.contains(value.trim())) {
      return 'Skill already exists in this category';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          color: Colors.white,

          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12.0),
            child: ExpansionTile(
              title: Row(
                children: [
                  Icon(
                    Icons.category,
                    color:
                    _isExpanded ? ThemeColors.mainGreenColor : Colors.green,
                  ),
                  const SizedBox(width: 10),
                  Text(
                    widget.category,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: _isExpanded
                          ? ThemeColors.mainGreenColor
                          : Colors.black,
                    ),
                  ),
                ],
              ),
              onExpansionChanged: (expanded) {
                setState(() {
                  _isExpanded = expanded;
                });
              },
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Form(
                    key: _formKey,
                    child: Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: _skillController,
                            decoration: InputDecoration(
                              labelText: 'Add a skill',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25.0), // Rounded corners
                                borderSide: const BorderSide(color: Colors.grey),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25.0), // Rounded corners
                                borderSide: BorderSide(color: ThemeColors.mainGreenColor),
                              ),
                              contentPadding: const EdgeInsets.symmetric(
                                vertical: 10.0, // Reduce height
                                horizontal: 16.0, // Horizontal padding
                              ),
                            ),
                            validator: _validateSkill,
                          ),
                        ),

                        const SizedBox(width: 10),
                        ElevatedButton(
                          onPressed: () => _addSkill(context),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: ThemeColors.mainGreenColor,
                            foregroundColor: Colors.white,
                          ),
                          child: const Text('Add'),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Wrap(
                  spacing: 8.0,
                  runSpacing: 8.0,
                  children: widget.skills
                      .map(
                        (skill) => Chip(
                      label: Text(skill),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      // backgroundColor: Colors.lightGreenAccent.shade100,
                      deleteIcon: const Icon(Icons.close),
                      onDeleted: () {
                        context.read<SkillsSetBloc>().add(RemoveSkill(
                          skill: skill,
                          category: widget.category,
                        ));
                      },
                    ),
                  )
                      .toList(),
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ),

      ],
    );
  }
}
