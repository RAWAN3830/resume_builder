// import 'package:flutter/material.dart';
// import 'package:resume/core/constant/extension.dart';
// import 'package:resume/domain/experience_model.dart';
// import 'package:resume/presentation/common_widgets/common_buttons/common_add_field_button.dart';
// import 'package:resume/presentation/common_widgets/common_buttons/common_save_button.dart';
// import 'package:resume/presentation/common_widgets/common_text/common_heading.dart';
// import 'package:resume/presentation/common_widgets/common_textfields/comman_textformfield.dart';
// import 'package:resume/presentation/common_widgets/common_textfields/common_longlinetextfield.dart';
// import 'package:resume/presentation/common_widgets/common_textfields/common_years_textfield.dart';
// import '../core/constant/strings.dart';
// import 'common_widgets/common_appbar/custome_appbar.dart';
//
// class ExperienceInfo extends StatefulWidget {
//   const ExperienceInfo({super.key});
//
//   @override
//   State<ExperienceInfo> createState() => _ExperienceInfoState();
// }
//
// class _ExperienceInfoState extends State<ExperienceInfo> {
//   final _formKey = GlobalKey<FormState>();
//   final List<ExperienceModel> experienceList = [];
//   final List<Map<String, TextEditingController>> controllersList = [];
//   final List<bool> expansionStates = [];
//
//   @override
//   void initState() {
//     super.initState();
//     _addExperienceFields();
//   }
//
//   void _addExperienceFields() {
//     if (controllersList.length < 4) {
//       controllersList.add({
//         'employer': TextEditingController(),
//         'jobTitle': TextEditingController(),
//         'location': TextEditingController(),
//         'startDate': TextEditingController(),
//         'endDate': TextEditingController(),
//         'description': TextEditingController(),
//       });
//       expansionStates.add(true);
//       setState(() {});
//     }
//   }
//
//   void _deleteExperienceFields(int index) {
//     if (index >= 0 && index < controllersList.length) {
//       // Dispose controllers to prevent memory leaks
//       for (var controller in controllersList[index].values) {
//         controller.dispose();
//       }
//       controllersList.removeAt(index);
//       expansionStates.removeAt(index);
//       setState(() {});
//     }
//   }
//
//   void _saveExperiences() {
//     if (_formKey.currentState!.validate()) {
//       experienceList.clear();
//       for (var controllers in controllersList) {
//         experienceList.add(ExperienceModel(
//           employer: controllers['employer']?.text,
//           jobTitle: controllers['jobTitle']?.text,
//           location: controllers['location']?.text,
//           startDate: controllers['startDate']?.text,
//           endDate: controllers['endDate']?.text,
//           description: controllers['description']?.text,
//         ));
//       }
//       debugPrint('Experience Details: ${experienceList.map((e) => e.toString()).toList()}');
//     }
//   }
//
//   @override
//   void dispose() {
//     // Clean up all controllers
//     for (var controllers in controllersList) {
//       for (var controller in controllers.values) {
//         controller.dispose();
//       }
//     }
//     super.dispose();
//   }
//
//   Widget _buildExperienceForm(Map<String, TextEditingController> controllers, int index) {
//     final height = context.height(context) * 0.02;
//
//     return ExpansionTile(
//       initiallyExpanded: expansionStates[index],
//       onExpansionChanged: (expanded) {
//         setState(() {
//           expansionStates[index] = expanded;
//         });
//       },
//       title: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Text(
//             controllers['employer']!.text.isEmpty
//                 ? 'Experiences Details ${index + 1}'
//                 : controllers['employer']!.text,
//             style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)
//           ),
//           if (controllersList.length > 1)
//             IconButton(
//               onPressed: () => _deleteExperienceFields(index),
//               icon: const Icon(Icons.delete, color: Colors.red),
//             ),
//         ],
//       ),
//       // title: Text('Experience ${index + 1}'),
//       // trailing: Row(
//       //   mainAxisSize: MainAxisSize.min,
//       //   children: [
//       //     if (controllersList.length > 1)
//       //     IconButton(
//       //       icon: const Icon(Icons.delete, color: Colors.red),
//       //       onPressed: () => _deleteExperienceFields(index),
//       //     ),
//       //     const Icon(Icons.expand_more),
//       //   ],
//       // ),
//       children: [
//         Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const CommonHeading(title: 'Employer'),
//               CommonTextformfield(
//                 labelText: 'ex. TCS',
//                 controller: controllers['employer']!,
//                 errorText: 'Please enter a valid company name',
//               ),
//               SizedBox(height: height),
//
//               const CommonHeading(title: 'Job Title'),
//               CommonTextformfield(
//                 labelText: 'Full Stack dev.',
//                 controller: controllers['jobTitle']!,
//                 errorText: 'Please enter a valid job title',
//               ),
//               SizedBox(height: height),
//
//               const CommonHeading(title: 'Location'),
//               CommonTextformfield(
//                 labelText: 'Ahmedabad, India',
//                 controller: controllers['location']!,
//                 errorText: 'Please enter a valid location',
//               ),
//               SizedBox(height: height),
//
//               CommonYearsTextfield(
//                 startDateController: controllers['startDate']!,
//                 endDateController: controllers['endDate']!,
//               ),
//               SizedBox(height: height),
//
//               const CommonHeading(title: 'Description'),
//               CommonLonglineTextfield(
//                 controller: controllers['description']!,
//                 hintText: 'Describe your role and responsibilities',
//                 errorText: 'Please describe your role',
//               ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: const CustomAppBar(title: 'Experiences'),
//       body: SingleChildScrollView(
//         child: Form(
//           key: _formKey,
//           child: Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Column(
//               children: [
//                 ...List.generate(
//                   controllersList.length,
//                       (index) => _buildExperienceForm(controllersList[index], index),
//                 ),
//                 if (controllersList.length < 4)
//                   CommonAddFieldButton(onTap: (){_addExperienceFields();}, name: 'Add Experience'),
//                 const SizedBox(height: 16),
//                 CommonSaveButton(
//                   formKey: _formKey,
//                   onTap: _saveExperiences,
//                   name: Strings.saveContinue,
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:resume/core/constant/extension.dart';
import 'package:resume/core/constant/strings.dart';
import 'package:resume/presentation/common_widgets/common_buttons/common_add_field_button.dart';
import 'package:resume/presentation/common_widgets/common_buttons/common_save_button.dart';
import 'package:resume/presentation/common_widgets/common_text/common_heading.dart';
import 'package:resume/presentation/common_widgets/common_textfields/comman_textformfield.dart';
import 'package:resume/presentation/common_widgets/common_textfields/common_longlinetextfield.dart';
import 'package:resume/presentation/common_widgets/common_textfields/common_years_textfield.dart';
import 'package:resume/presentation/common_widgets/common_appbar/custome_appbar.dart';
import '../infra/bloc/experiences_bloc/experiences_bloc.dart';
import '../infra/bloc/experiences_bloc/experiences_events.dart';
import '../infra/bloc/experiences_bloc/experiences_state.dart';

class ExperienceScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  ExperienceScreen({Key? key}) : super(key: key);

  Widget _buildExperienceForm(
      Map<String, TextEditingController> controllers,
      int index,
      bool isExpanded,
      BuildContext context,
      ExperienceBloc bloc,
      ) {
    final height = context.height(context) * 0.02;

    return ExpansionTile(
      initiallyExpanded: isExpanded,
      onExpansionChanged: (expanded) {
        bloc.add(UpdateExpansionState(index, expanded));
      },
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            controllers['employer']!.text.isEmpty
                ? 'Experience Details ${index + 1}'
                : controllers['employer']!.text,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          if (bloc.state.controllersList.length > 1)
            IconButton(
              onPressed: () => bloc.add(DeleteExperienceField(index)),
              icon: const Icon(Icons.delete, color: Colors.red),
            ),
        ],
      ),
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CommonHeading(title: 'Employer'),
              CommonTextformfield(
                labelText: 'ex. Google',
                controller: controllers['employer']!,
                errorText: 'Please enter a valid company name',
              ),
              SizedBox(height: height),

              const CommonHeading(title: 'Job Title'),
              CommonTextformfield(
                labelText: 'Senior Software Engineer',
                controller: controllers['jobTitle']!,
                errorText: 'Please enter a valid job title',
              ),
              SizedBox(height: height),

              const CommonHeading(title: 'Location'),
              CommonTextformfield(
                labelText: 'San Francisco, USA',
                controller: controllers['location']!,
                errorText: 'Please enter a valid location',
              ),
              SizedBox(height: height),

              CommonYearsTextfield(
                startDateController: controllers['startDate']!,
                endDateController: controllers['endDate']!,
              ),
              SizedBox(height: height),

              const CommonHeading(title: 'Description'),
              CommonLonglineTextfield(
                controller: controllers['description']!,
                hintText: 'Describe your role and responsibilities',
                errorText: 'Please describe your role',
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ExperienceBloc(
        firestore: FirebaseFirestore.instance,
      )..add(AddExperienceField()),
      child: Builder(
        builder: (context) {
          final bloc = context.read<ExperienceBloc>();
          return Scaffold(
            appBar: const CustomAppBar(title: 'Experience'),
            body: BlocBuilder<ExperienceBloc, ExperienceState>(
              builder: (context, state) {
                return SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          ...List.generate(
                            state.controllersList.length,
                                (index) => _buildExperienceForm(
                              state.controllersList[index],
                              index,
                              state.expansionStates[index],
                              context,
                              bloc,
                            ),
                          ),
                          if (state.controllersList.length < 4)
                            CommonAddFieldButton(
                              onTap: () => bloc.add(AddExperienceField()),
                              name: 'Add Experience',
                            ),
                          const SizedBox(height: 16),
                          CommonSaveButton(
                            formKey: _formKey,
                            onTap: () => bloc.add(SaveExperience()),
                            name: Strings.saveContinue,
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}