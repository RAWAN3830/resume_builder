


import 'package:flutter/material.dart';
import 'package:resume/core/constant/extension.dart';
import 'package:resume/core/constant/theme_colors.dart';
import 'package:resume/domain/workspace_model.dart';
import 'package:resume/presentation/Declaration.dart';
import 'package:resume/presentation/Project.dart';
import 'package:resume/presentation/home_screen/skill_sets_screen.dart/skill_sets_screen.dart';
import 'package:resume/presentation/pdf_generator.dart';
import 'package:resume/presentation/skill_sets_screen.dart';

import '../Education.dart';
import '../Experiences.dart';
import '../contact_info.dart';

class DetailsCard extends StatelessWidget {
  final WorkSpaceModel workmodel;
  final int index;
  const DetailsCard({super.key, required this.workmodel, required this.index});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          switch (index) {
            case 0:
              context.push(context, target: const PersonalInfo());
            case 1:
              context.push(context, target: const EducationInfo());
              // context.push(context, target: const CarrierObjective());
            case 2:
              context.push(context, target: const ExperienceInfo());
              // context.push(context, target: const PersonalDetails());
            case 3:
              context.push(context, target: const SkillSetsScreen());
              // context.push(context, target: const EducationInfo());
            case 4:
              context.push(context, target: const ProjectInfo());
              // context.push(context, target: const ExperienceInfo());
            case 5:
              context.push(context, target:  const ResumeCreator());
              // context.push(context, target: const Achievement());
              // context.push(context, target: const TechSkills());
            case 6:
              context.push(context, target: const Declaration());
            //   context.push(context, target:Hobboies());
            // case 7:
              // context.push(context, target: const ProjectInfo());
            // case 8:
            //   context.push(context, target: const Achievement());
            // case 9:
            //   context.push(context, target: const Reference());
            // case 10:
            //   context.push(context, target: const Declaration());
          }
        },
        child: Container(
          height: context.height(context) * .10,
          width: context.width(context) * .4,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.4),
                blurRadius: 10,
                offset: const Offset(7, 7),
              ),
            ],
            borderRadius: BorderRadius.circular(5),
            color: ThemeColors.white,
            //   color:const Color(0xFFfefae0)

          ),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Padding(
                padding: const EdgeInsets.all(8.0)
                    .copyWith(top: context.height(context) * 0.02),
                child: Container(
                  height: context.height(context) * .08,
                  width: context.width(context) * .20,
                  decoration: const BoxDecoration(color: Colors.transparent),
                  child: workmodel.icon,
                ),
              ),
            ),
            SizedBox(
              height: context.height(context) * 0.0250,
            ),
            Expanded(
              child: Text(
                workmodel.title,
                style:  Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w500),

              ),
            )
          ]),
        ),
      ),
    );
  }
}
