// import 'package:flutter/material.dart';
// import 'skill_chip.dart';
//
// class SkillCategoryTile extends StatelessWidget {
//   final String category;
//   final List<String> skills;
//
//   const SkillCategoryTile({
//     super.key,
//     required this.category,
//     required this.skills,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       margin: const EdgeInsets.only(bottom: 8.0),
//       child: ExpansionTile(
//         title: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Text(category),
//             Text(
//               '${skills.length} skills',
//               style: Theme.of(context).textTheme.bodySmall,
//             ),
//           ],
//         ),
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Wrap(
//               spacing: 8.0,
//               runSpacing: 8.0,
//               children: skills
//                   .map((skill) => SkillChip(
//                 skill: skill,
//                 category: category,
//               ))
//                   .toList(),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

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
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12.0),
            child: ExpansionTile(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.category,
                        color: _isExpanded
                            ? ThemeColors.mainGreenColor
                            : Colors.green,
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
                  // Skill count displayed here
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8.0, vertical: 4.0),
                    decoration: BoxDecoration(
                      color: ThemeColors.mainGreenColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Text(
                      '${widget.skills.length} skills',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: ThemeColors.mainGreenColor,
                      ),
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
                                borderRadius: BorderRadius.circular(12.0),
                                borderSide:
                                const BorderSide(color: Colors.grey),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12.0),
                                borderSide: BorderSide(
                                    color: ThemeColors.mainGreenColor),
                              ),
                              contentPadding: const EdgeInsets.symmetric(
                                vertical: 12.0,
                                horizontal: 16.0,
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
                      backgroundColor: Colors.lightGreenAccent.shade200,
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
        const Divider(
          color: Colors.grey,
          thickness: 1.0,
          height: 20,
        ),
      ],
    );
  }
}
