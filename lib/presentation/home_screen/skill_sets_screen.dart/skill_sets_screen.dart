// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:resume/infra/bloc/skills_set_bloc/skills_set_bloc.dart';
// import 'package:resume/presentation/home_screen/skill_sets_screen.dart/skills_set_widget/skill_category_list.dart';
// import 'package:resume/presentation/home_screen/skill_sets_screen.dart/skills_set_widget/skill_input_form.dart';
//
// class SkillSetsScreen extends StatelessWidget {
//   const SkillSetsScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => SkillsSetBloc(),
//       child: const SkillSetsView(),
//     );
//   }
// }
//
// class SkillSetsView extends StatelessWidget {
//   const SkillSetsView({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Skill Set')),
//       body: const Padding(
//         padding: EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             SkillInputForm(),
//             SizedBox(height: 16),
//             Expanded(child: SkillCategoryList()),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:resume/infra/bloc/skills_set_bloc/skills_set_bloc.dart';
import 'package:resume/presentation/home_screen/skill_sets_screen.dart/skills_set_widget/skill_category_list.dart';
import 'package:resume/presentation/home_screen/skill_sets_screen.dart/skills_set_widget/skill_input_form.dart';


class SkillsScreen extends StatelessWidget {
  const SkillsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SkillsSetBloc(),
      child: const SkillsView(),
    );
  }
}

class SkillsView extends StatelessWidget {
  const SkillsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Skill Set')),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            // SkillInputForm(),
            // SizedBox(height: 16),
            Expanded(child: SkillCategoryList()),
          ],
        ),
      ),
    );
  }
}