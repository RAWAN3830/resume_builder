import 'package:flutter/material.dart';
import 'package:resume/core/constant/extension.dart';
import 'package:resume/domain/workspace_model.dart';

import '../../core/constant/strings.dart';

class DetailsCard extends StatelessWidget {
  final WorkSpaceModel workmodel;
  const   DetailsCard({super.key, required this.workmodel});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      // child: Container(
      //   height: context.height(context) * .10,
      //   width: context.width(context) * .4,
      //   decoration: BoxDecoration(
      //     borderRadius: BorderRadius.circular(5),
      //     color: Colors.black,
      //     boxShadow: [
      //       BoxShadow(
      //         color: Colors.black.withOpacity(0.6),
      //         blurRadius: 8,
      //         offset: Offset(7, 7),
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



      child: Container(
        height: context.height(context) * .10,
        width: context.width(context) * .4,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.6),
              blurRadius: 8,
              offset: Offset(7, 7),
            ),
          ],
          borderRadius: BorderRadius.circular(5),
          color: Colors.black,

        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Padding(
              padding: const EdgeInsets.all(8.0).copyWith(top: context.height(context)*0.02),
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
                  color: Colors.white,
                  fontFamily: Strings.uberFont,
                  fontWeight: FontWeight.bold,
                  fontSize: 22),
            ),
          )
        ]),
      ),
    );
  }
}
