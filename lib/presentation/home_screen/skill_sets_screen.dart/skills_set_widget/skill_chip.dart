// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:resume/infra/bloc/skills_set_bloc/skills_set_bloc.dart';
// import 'package:resume/infra/bloc/skills_set_bloc/skills_set_event.dart';
//
// class SkillChip extends StatelessWidget {
//   final String skill;
//   final String category;
//
//   const SkillChip({
//     super.key,
//     required this.skill,
//     required this.category,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Chip(
//       label: Text(skill),
//       deleteIcon: const Icon(Icons.close, size: 18),
//       onDeleted: () {
//         context.read<SkillsSetBloc>().add(RemoveSkill(
//           skill: skill,
//           category: category,
//         ));
//       },
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:resume/infra/bloc/skills_set_bloc/skills_set_bloc.dart';
import 'package:resume/infra/bloc/skills_set_bloc/skills_set_event.dart';

class SkillChip extends StatelessWidget {
  final String skill;
  final String category;

  const SkillChip({
    super.key,
    required this.skill,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    return Chip(
      backgroundColor: Colors.white,
      label: Text(skill ,style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w500),),
      deleteIcon: const Icon(Icons.close, size: 18),
      onDeleted: () {
        context.read<SkillsSetBloc>().add(RemoveSkill(
          skill: skill,
          category: category,
        ));
      },
    );
  }
}