import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, widget) => ResponsiveBreakpoints.builder(
        child: BouncingScrollWrapper.builder(context, widget!),
        breakpoints: [
          // ResponsiveBreakpoints(child: child, breakpoints: breakpoints)
          Breakpoint(name: MOBILE, start: 0, end: 350),
          Breakpoint(name: TABLET, start: 351, end: 600),
          Breakpoint(name: DESKTOP, start: 601, end: 800),
          // ResponsiveBreakpoint.resize(350, name: MOBILE),
          // ResponsiveBreakpoint.resize(600, name: TABLET),
          // ResponsiveBreakpoint.resize(800, name: DESKTOP),
        ],
      ),
      home: const ResponsiveScreen(),
    );
  }
}

class ResponsiveScreen extends StatelessWidget {
  const ResponsiveScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Responsive Layout Example"),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {

          // Determine size category
          double containerWidth = constraints.maxWidth * 0.6;
          double containerHeight = constraints.maxHeight * 0.3;
          String displayText = "Small Screen";

          if (constraints.maxWidth >= 600 && constraints.maxWidth < 800) {
            displayText = "Medium Screen";
            containerWidth = constraints.maxWidth * 0.5;
            containerHeight = constraints.maxHeight * 0.4;
          } else if (constraints.maxWidth >= 800) {
            displayText = "Large Screen";
            containerWidth = constraints.maxWidth * 0.4;
            containerHeight = constraints.maxHeight * 0.5;
          }

          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  displayText,
                  style: TextStyle(
                    fontSize: ResponsiveValue(
                      context,
                      defaultValue: 18.0,
                      conditionalValues: [
                        const Condition.largerThan(name: MOBILE, value: 24.0),
                        const Condition.largerThan(name: TABLET, value: 32.0),
                      ],
                    ).value,
                  ),
                ),
                const SizedBox(height: 20),
                AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  width: containerWidth,
                  height: containerHeight,
                  color: Colors.blue,
                  child: const Center(
                    child: Text(
                      "Responsive Container",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:resume/core/constant/extension.dart';
// import 'package:resume/core/constant/strings.dart';
// import 'package:resume/presentation/common_widgets/common_buttons/common_save_button.dart';
// import 'package:resume/presentation/common_widgets/common_text/common_heading.dart';
// import 'package:resume/presentation/common_widgets/common_textfields/common_longlinetextfield.dart';
//
// import 'common_widgets/common_textfields/comman_textformfield.dart';
//
// String? career;
// String? designation;
//
// class CarrierObjective extends StatefulWidget {
//   const CarrierObjective({super.key});
//
//   @override
//   State<CarrierObjective> createState() => _CarrierObjectiveState();
// }
//
// class _CarrierObjectiveState extends State<CarrierObjective> {
//   TextEditingController careerController = TextEditingController();
//   TextEditingController designationController = TextEditingController();
//
//   final formKey = GlobalKey<FormState>();
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     if (career != null && designation != null) {
//       careerController.text = career!;
//       designationController.text = designation!;
//     }
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: InkWell(
//           onTap: () {
//             Navigator.of(context).pop();
//           },
//           child: const Icon(
//             CupertinoIcons.back,
//             color: Colors.white,
//           ),
//         ),
//         backgroundColor: Colors.blue,
//         title: const Text('Carrier Objective',
//             style: TextStyle(color: Colors.white, fontSize: 25)),
//       ),
//       body: SingleChildScrollView(
//         child: Form(
//           key: formKey,
//           child: Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 const CommonHeading(title:'Career Objective'),
//                 CommonLonglineTextfield(
//                     controller: careerController,
//                     hintText: 'Career Objective',
//                     errorText: 'Enter Career Obj'),
//
//                 // const Text(
//                 //   'Current Designation (Experienced Candidate)',
//                 //   style: TextStyle(
//                 //       color: Colors.blue,
//                 //       fontSize: 20,
//                 //       fontWeight: FontWeight.bold),
//                 // ),
//                 SizedBox(height: context.height(context) * 0.05,),
//                 const CommonHeading(title:'Designation'),
//                 CommonTextformfield(
//                   controller: designationController,
//                   labelText: 'Software Engineer',
//                   errorText: 'Designation require',
//                 ),
//                 SizedBox(height: context.height(context) * 0.05,),
//
//                 CommonSaveButton(
//                   formKey: formKey,
//                   onTap: (){},
//                   name: Strings.saveContinue,
//
//                 )
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
