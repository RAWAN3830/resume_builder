// import 'package:flutter/material.dart';
// import 'package:resume/core/constant/extension.dart';
// import 'package:resume/presentation/common_widgets/common_buttons/common_save_button.dart';
// import 'package:resume/presentation/common_widgets/common_text/common_heading.dart';
// import 'package:resume/presentation/common_widgets/common_textfields/comman_textformfield.dart';
// import 'package:resume/presentation/common_widgets/common_textfields/common_longlinetextfield.dart';
//
// import '../core/constant/strings.dart';
//
// String? company;
// String? institute;
// String? roles;
//
// class ExperienceInfo extends StatefulWidget {
//   const ExperienceInfo({super.key});
//
//   @override
//   State<ExperienceInfo> createState() => _ExperienceInfoState();
// }
//
// enum EmpStatus { previously, currently }
//
// final formkey = GlobalKey<FormState>();
//
// class _ExperienceInfoState extends State<ExperienceInfo> {
//   int indexCount = 0;
//   EmpStatus m = EmpStatus.previously;
//   TextEditingController companyController = TextEditingController();
//   TextEditingController instituteController = TextEditingController();
//   TextEditingController roleController = TextEditingController();
//
//   @override
//   void setState(VoidCallback fn) {
//     // TODO: implement setState
//     companyController.text = company!;
//     instituteController.text = institute!;
//     roleController.text = roles!;
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     var height = context.height(context) * 0.02;
//
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.blue,
//         title: const Text('Experiences',
//             style: TextStyle(color: Colors.white, fontSize: 25)),
//       ),
//       body: SingleChildScrollView(
//         child: Form(
//             key: formkey,
//             child: Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   SizedBox(height: height),
//                   const CommonHeading(title: 'Company Name'),
//                   CommonTextformfield(
//                       labelText: 'Infosys',
//                       controller: companyController,
//                       errorText: 'enter value'),
//                   SizedBox(height: height),
//                   const CommonHeading(title: 'Institute / Collage'),
//                   CommonTextformfield(
//                       labelText: 'Mobile Devloper',
//                       controller: instituteController,
//                       errorText: 'enter valid value'),
//                   SizedBox(height: height),
//                   const CommonHeading(title: 'Roles (optional)'),
//                   CommonLonglineTextfield(
//                       controller: roleController,
//                       hintText:
//                           'working with team members to come up with new concepts end product analysis',
//                       errorText: 'role in Company'),
//                   SizedBox(height: height),
//                   const CommonHeading(title: 'Employed Status'),
//                   Row(children: [
//                     const CommonHeading(title: 'Previously Employed'),
//                     Radio(
//                         value: EmpStatus.previously,
//                         groupValue: m,
//                         onChanged: (EmpStatus? value) {
//                           setState(() {
//                             m = value!;
//                           });
//                         }),
//                   ]),
//                   Row(children: [
//                     Row(children: [
//                       const CommonHeading(title: 'Currently Employed'),
//                       Radio(
//                           value: EmpStatus.currently,
//                           groupValue: m,
//                           onChanged: (EmpStatus? value) {
//                             setState(() {
//                               m = value!;
//                             });
//                           }),
//                     ])
//                   ]),
//                   // CommonButton(onTap: (){}, title: 'Submit')
//                   CommonSaveButton(
//                       formKey: formkey,
//                     onTap: (){},
//                     name: Strings.saveContinue,)
//                 ],
//               ),
//             )),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:resume/core/constant/extension.dart';
import 'package:resume/domain/experience_model.dart';
import 'package:resume/presentation/common_widgets/common_buttons/common_save_button.dart';
import 'package:resume/presentation/common_widgets/common_text/common_heading.dart';
import 'package:resume/presentation/common_widgets/common_textfields/comman_textformfield.dart';
import 'package:resume/presentation/common_widgets/common_textfields/common_longlinetextfield.dart';
import 'package:resume/presentation/common_widgets/common_textfields/common_years_textfield.dart';
import '../core/constant/strings.dart';
import 'common_widgets/common_appbar/custome_appbar.dart';

class ExperienceInfo extends StatefulWidget {
  const ExperienceInfo({super.key});

  @override
  State<ExperienceInfo> createState() => _ExperienceInfoState();
}
  String? employer;
  String? jobTitle;
  String? startDate;
  String? endDate;
  String? location;
  String? description;

class _ExperienceInfoState extends State<ExperienceInfo> {
  final _formKey = GlobalKey<FormState>();
  final List<ExperienceModel> educationList = [];
  final List<Map<String, TextEditingController>> controllersList = [];
  final List<bool> expansionStates = [];

  void _addEducationFields() {
    if (controllersList.length < 3) {
      controllersList.add({
        'employer': TextEditingController(),
        'jobTitle': TextEditingController(),
        'description': TextEditingController(),
        'location': TextEditingController(),
        'startDate': TextEditingController(),
        'endDate': TextEditingController(),
      });
      expansionStates.add(true); // Start with expanded state
      setState(() {});
    }
  }
  // final _employerController = TextEditingController();
  // final _jobTitleController = TextEditingController();
  // final _startDateController = TextEditingController();
  // final _endDateController = TextEditingController();
  // final _locationController = TextEditingController();
  // final _descriptionController = TextEditingController();
  //

  @override
  void initState() {
    super.initState();
    _addEducationFields();
    // if (employer != null) _employerController.text = employer ?? "employer error";
    // if (jobTitle != null) _jobTitleController.text = jobTitle ?? "job title error";
    // if (location != null) _locationController.text = location ?? "location error";
    // if (startDate != null) _startDateController.text = startDate ?? "StartDate error";
    // if (endDate != null) _endDateController.text = endDate ?? "endDate error";
    // if (description != null) _descriptionController.text = description ?? "description error";

  }

  void _deleteExperiencesFields(int index) {
    if (index >= 0 && index < controllersList.length) {
      controllersList.removeAt(index);
      expansionStates.removeAt(index);
      setState(() {});
    }
  }

  void _saveExperiences() {
    if (_formKey.currentState!.validate()) {
      educationList.clear();
      for (var controllers in controllersList) {
        educationList.add(ExperienceModel(
          jobTitle: controllers['jobTitle']?.text,
          location: controllers['location']?.text,
          description: controllers['description']?.text,
          employer: controllers['employer']?.text,
          startDate: controllers['startDate']?.text,
          endDate: controllers['endDate']?.text,
        ));
      }
      debugPrint(
          'Education Details: ${educationList.map((e) => e.toString()).toList()}');
    }
  }


  @override
  void dispose() {
    // Clean up controllers
    // _employerController.dispose();
    // _jobTitleController.dispose();
    // _locationController.dispose();
    // _startDateController.dispose();
    // _endDateController.dispose();
    // _descriptionController.dispose();
    // super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = context.height(context) * 0.02;

    return Scaffold(

      appBar: const CustomAppBar(title:'Experiences'),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: height),
                const CommonHeading(title: 'Employer'),
                // CommonTextformfield(
                //   labelText: 'ex. TCS',
                //   controller: controllers['jobTitle'],
                //   errorText: 'Please enter a valid company name',
                // ),
                // SizedBox(height: height),
                // const CommonHeading(title: 'Job Title'),
                // CommonTextformfield(
                //   labelText: 'Full Stack dev.',
                //   controller: _jobTitleController,
                //   errorText: 'Please enter a valid value',
                // ),
                // SizedBox(height: height),
                // const CommonHeading(title: 'Location'),
                // CommonTextformfield(
                //   labelText: 'Ahmedabad , india',
                //   controller: _locationController,
                //   errorText: 'Please valid location',
                // ),
                // SizedBox(height: height),
                // CommonYearsTextfield(startDateController: _startDateController, endDateController: _endDateController),
                // SizedBox(height: height),
                // const CommonHeading(title: 'Description'),
                // CommonLonglineTextfield(
                //   controller: _descriptionController,
                //   hintText:
                //   'Describe your role (e.g., working with team members to develop new concepts)',
                //   errorText: 'Please describe your role',
                // ),


                SizedBox(height: height),
                CommonSaveButton(
                  formKey: _formKey,
                  onTap: _onSave,
                  name: Strings.saveContinue,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }


  void _onSave() {
    if (_formKey.currentState?.validate() ?? false) {
      // Handle save logic
    }
  }
}



