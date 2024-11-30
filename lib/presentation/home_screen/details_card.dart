import 'package:flutter/material.dart';
import 'package:resume/core/constant/extension.dart';
import 'package:resume/core/constant/theme_colors.dart';
import 'package:resume/domain/workspace_model.dart';
import 'package:resume/presentation/Declaration.dart';
import 'package:resume/presentation/Education.dart';
import 'package:resume/presentation/Experiences.dart';
import 'package:resume/presentation/Project.dart';
import 'package:resume/presentation/TechSkill.dart';
import 'package:resume/presentation/carrier_objectibve.dart';
import 'package:resume/presentation/personal_details.dart';

import '../../core/constant/strings.dart';
import '../Achievements.dart';
import '../References.dart';
import '../contact_info.dart';

class DetailsCard extends StatelessWidget {
  final WorkSpaceModel workmodel;
  final int index;
  const DetailsCard({super.key, required this.workmodel, required this.index});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      // child: Container(
      //   height: context.height(context) * .10,
      //   width: context.width(context) * .4,
      //   decoration: BoxDecoration(
      //     // color: Color(0xFFF6F6F6),
      //     color: ThemeColors.black,
      //     borderRadius: BorderRadius.circular(5), // Adjust for rounded corners if needed
      //     boxShadow: [
      //       BoxShadow(
      //         color: Colors.black.withOpacity(0.6), // Adjust shadow color and opacity
      //         blurRadius: 7, // Smoothness of the shadow
      //         offset: Offset(-1, 4), // Shadow position
      //       ),
      //     ],
      //   ),
      //   child: Column(
      //     crossAxisAlignment: CrossAxisAlignment.center,
      //     children: [
      //       Padding(
      //         padding: const EdgeInsets.all(8.0),
      //         child: Padding(
      //           padding: const EdgeInsets.all(8.0).copyWith(
      //             top: context.height(context) * 0.02,
      //           ),
      //           child: Stack(
      //             alignment: Alignment.center,
      //             children: [
      //               Container(
      //                 height: context.height(context) * .09,
      //                 width: context.height(context) * .09,
      //                 decoration: BoxDecoration(
      //                   boxShadow: [
      //                     BoxShadow(
      //                       color: Colors.lightGreenAccent.withOpacity(0.5),
      //                       blurRadius: 200,
      //                       offset: Offset(0, 4),
      //                     ),
      //                   ],
      //                   shape: BoxShape.circle,
      //                   color: Colors.green.withOpacity(0.01),
      //                 ),
      //               ),
      //               // Icon container
      //               Container(
      //                 height: context.height(context) * .07,
      //                 width: context.width(context) * .23,
      //                 decoration: const BoxDecoration(color: Colors.transparent),
      //                 child: workmodel.icon,
      //               ),
      //             ],
      //           ),
      //         ),
      //       ),
      //       SizedBox(
      //         height: context.height(context) * 0.0250,
      //       ),
      //       Expanded(
      //         child: Text(
      //           workmodel.title,
      //           style: const TextStyle(
      //             color: Colors.white,
      //             fontFamily: Strings.uberFont,
      //             fontWeight: FontWeight.bold,
      //             fontSize: 22,
      //           ),
      //         ),
      //       ),
      //     ],
      //   ),
      // )

      child: GestureDetector(
        onTap: () {
          switch (index) {
            case 0:
              context.push(context, target: const ContactInfo());
            case 1:
              context.push(context, target: const CarrierObjective());
            case 2:
              context.push(context, target: const PersonalDetails());
            case 3:
              context.push(context, target: const EducationInfo());
            case 4:
              context.push(context, target: const ExperienceInfo());
            case 5:
              context.push(context, target: const TechSkills());
            // case 6:
            //   context.push(context, target:Hobboies());
            case 7:
              context.push(context, target: const ProjectInfo());
            case 8:
              context.push(context, target: const Achievement());
            case 9:
              context.push(context, target: const Reference());
            case 10:
              context.push(context, target: const Declaration());
          }
        },
        child: Container(
          height: context.height(context) * .10,
          width: context.width(context) * .4,
          decoration: BoxDecoration(
            color: const Color(0xFFF6F6F6),
            borderRadius: BorderRadius.circular(
                5), // Adjust for rounded corners if needed
            boxShadow: [
              BoxShadow(
                color: Colors.black
                    .withOpacity(0.3), // Adjust shadow color and opacity
                blurRadius: 10, // Smoothness of the shadow
                offset: const Offset(-1, 4), // Shadow position
              ),
            ],
          ),
          // decoration: BoxDecoration(
          //   boxShadow: [
          //     BoxShadow(
          //       color: Colors.black.withOpacity(0.6),
          //       blurRadius: 8,
          //       offset: Offset(7, 7),
          //     ),
          //   ],
          //   borderRadius: BorderRadius.circular(5),
          //   color: ThemeColors.black,
          //
          // ),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Padding(
                padding: const EdgeInsets.all(8.0)
                    .copyWith(top: context.height(context) * 0.02),
                child: Container(
                  height: context.height(context) * .08,
                  width: context.width(context) * .23,
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
                style: const TextStyle(
                    // color: Colors.white,
                    fontFamily: Strings.uberFont,
                    fontWeight: FontWeight.bold,
                    fontSize: 22),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
