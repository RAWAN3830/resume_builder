import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:resume/infra/bloc/skills_set_bloc/skills_set_bloc.dart';
import 'package:resume/infra/bloc/skills_set_bloc/skills_set_state.dart';

import 'skill_chip.dart';

class SkillCategoryList extends StatelessWidget {
  const SkillCategoryList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SkillsSetBloc, SkillsSetState>(
      builder: (context, state) {
        return ListView.builder(
          itemCount: state.categories.length,
          itemBuilder: (context, index) {
            final category = state.categories.keys.elementAt(index);
            final skills = state.categories[category]!;

            return Card(
              margin: const EdgeInsets.only(bottom: 8.0),
              child: ExpansionTile(
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(category),
                    Text(
                      '${skills.length} skills',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Wrap(
                      spacing: 8.0,
                      runSpacing: 8.0,
                      children: skills.map((skill) => SkillChip(
                        skill: skill,
                        category: category,
                      )).toList(),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}