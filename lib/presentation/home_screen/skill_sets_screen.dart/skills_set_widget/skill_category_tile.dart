import 'package:flutter/material.dart';
import 'skill_chip.dart';

class SkillCategoryTile extends StatelessWidget {
  final String category;
  final List<String> skills;

  const SkillCategoryTile({
    super.key,
    required this.category,
    required this.skills,
  });

  @override
  Widget build(BuildContext context) {
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
              children: skills
                  .map((skill) => SkillChip(
                skill: skill,
                category: category,
              ))
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}