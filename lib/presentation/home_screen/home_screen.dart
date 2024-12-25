// import 'package:flutter/material.dart';
// import 'package:resume/core/constant/extension.dart';
// import 'package:resume/domain/workspace_model.dart';
// import 'package:resume/presentation/home_screen/details_card.dart';
// //TODO:create a Navigator for all screen
// // Solution : 1. create switch-case 2. create Navigator path in list
// // 3. give paht using if else
//
// import '../../core/constant/strings.dart';
// import '../common_widgets/common_appbar/custome_appbar.dart';
// import '../common_widgets/common_text/common_richtext.dart';
//
// class HomeScreen extends StatefulWidget {
 //   const HomeScreen({super.key});
//
//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }
//
// class _HomeScreenState extends State<HomeScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // appBar: CustomAppBar(title: Strings.homeScreenTitle,),
//       appBar: AppBar(
//         toolbarHeight: context.height(context) * 0.12,
//         title:const CommonRichText(title: Strings.homeScreenTitle,)
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               // child: Container(),
//               child: GridView.builder(
//                 physics: const NeverScrollableScrollPhysics(),
//                 shrinkWrap: true,
//                 gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                   crossAxisCount: 2, // Number of columns in the grid
//                   crossAxisSpacing: 10.0, // Horizontal spacing
//                   mainAxisSpacing: 10.0, // Vertical spacing
//                 ),
//                 itemCount: workSpaceModelList.length,
//                 itemBuilder: (context, index) {
//                   return DetailsCard(workmodel: workSpaceModelList[index], index: index,);
//                 },
//               ),
//             ),
//           ],
//         ),
//       )
//     );
//   }
// }
// // import 'package:flutter/material.dart';
// // import 'package:responsive_framework/responsive_framework.dart';
// // import 'package:resume/core/constant/extension.dart';
// // import 'package:resume/domain/workspace_model.dart';
// // import 'package:resume/presentation/home_screen/details_card.dart';
// // import '../../core/constant/strings.dart';
// // import '../../core/theme_data/breakpoint_enum.dart';
// // import '../common_widgets/common_appbar/custome_appbar.dart';
// // import '../common_widgets/common_text/common_richtext.dart';
// //
// // class HomeScreen extends StatefulWidget {
// //   const HomeScreen({super.key});
// //
// //   @override
// //   State<HomeScreen> createState() => _HomeScreenState();
// // }
// //
// // class _HomeScreenState extends State<HomeScreen> {
// //   BreakpointEnum _getCurrentBreakpoint(BuildContext context) {
// //     final currentBreakpoint = ResponsiveWrapper.of(context).activeBreakpoint;
// //     return BreakpointEnum.breakpointEnum(currentBreakpoint);
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     final currentBreakpoint = _getCurrentBreakpoint(context);
// //     int crossAxisCount;
// //
// //     switch (currentBreakpoint) {
// //       case BreakpointEnum.mobile:
// //         crossAxisCount = 2;
// //         break;
// //       case BreakpointEnum.tablet:
// //         crossAxisCount = 3;
// //         break;
// //       case BreakpointEnum.desktop:
// //         crossAxisCount = 4;
// //         break;
// //     }
// //
// //     return Scaffold(
// //       appBar: AppBar(
// //         toolbarHeight: context.height(context) * 0.12,
// //         title: const CommonRichText(title: Strings.homeScreenTitle),
// //       ),
// //       body: SingleChildScrollView(
// //         child: Column(
// //           children: [
// //             Padding(
// //               padding: const EdgeInsets.all(8.0),
// //               child: GridView.builder(
// //                 physics: const NeverScrollableScrollPhysics(),
// //                 shrinkWrap: true,
// //                 gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
// //                   crossAxisCount: crossAxisCount, // Set dynamically based on breakpoint
// //                   crossAxisSpacing: 10.0, // Horizontal spacing
// //                   mainAxisSpacing: 10.0, // Vertical spacing
// //                 ),
// //                 itemCount: workSpaceModelList.length,
// //                 itemBuilder: (context, index) {
// //                   return DetailsCard(
// //                     workmodel: workSpaceModelList[index],
// //                     index: index,
// //                   );
// //                 },
// //               ),
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }



import 'package:flutter/material.dart';
import 'package:resume/core/constant/extension.dart';
import 'package:resume/domain/workspace_model.dart';
import 'package:resume/presentation/home_screen/details_card.dart';
import '../../core/constant/strings.dart';
import '../common_widgets/common_text/common_richtext.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _getCrossAxisCount(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    if (screenWidth < 600) {
      return 2; // Mobile
    } else if (screenWidth >= 600 && screenWidth < 1200) {
      return 3; // Tablet
    } else {
      return 4; // Desktop
    }
  }

  @override
  Widget build(BuildContext context) {
    int crossAxisCount = _getCrossAxisCount(context);

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: context.height(context) * 0.12,
        title: const CommonRichText(title: Strings.homeScreenTitle),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount, // Set dynamically based on screen width
                  crossAxisSpacing: 10.0, // Horizontal spacing
                  mainAxisSpacing: 10.0, // Vertical spacing
                ),
                itemCount: workSpaceModelList.length,
                itemBuilder: (context, index) {
                  return DetailsCard(
                    workmodel: workSpaceModelList[index],
                    index: index,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}