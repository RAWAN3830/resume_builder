import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:resume/core/constant/extension.dart';
import 'package:resume/presentation/common_widgets/common_buttons/common_reset_button.dart';
import 'package:resume/presentation/common_widgets/common_buttons/common_save_button.dart';
import 'package:resume/presentation/common_widgets/common_text/common_heading.dart';
import 'package:resume/presentation/common_widgets/common_textfields/common_years_textfield.dart';
import '../core/constant/strings.dart';
import '../domain/education_model.dart';
import 'common_widgets/common_appbar/custome_appbar.dart';
import 'common_widgets/common_textfields/comman_textformfield.dart';

class EducationInfo extends StatefulWidget {
  const EducationInfo({super.key});

  @override
  State<EducationInfo> createState() => _EducationInfoState();
}

class _EducationInfoState extends State<EducationInfo> {
  final formKey = GlobalKey<FormState>();
  final List<EducationModel> educationList = [];
  final List<Map<String, TextEditingController>> controllersList = [];
  final List<bool> expansionStates = [];

  @override
  void initState() {
    super.initState();
    // Initialize with one education entry
    _addEducationFields();
  }

  void _addEducationFields() {
    if (controllersList.length < 4) {
      controllersList.add({
        'institution': TextEditingController(),
        'location': TextEditingController(),
        'degreeType': TextEditingController(),
        'fieldOfStudy': TextEditingController(),
        'startDate': TextEditingController(),
        'endDate': TextEditingController(),
      });
      expansionStates.add(true); // Start with expanded state
      setState(() {});
    }
  }

  void _deleteEducationFields(int index) {
    if (index >= 0 && index < controllersList.length) {
      controllersList.removeAt(index);
      expansionStates.removeAt(index);
      setState(() {});
    }
  }

  void _saveEducation() {
    if (formKey.currentState!.validate()) {
      educationList.clear();
      for (var controllers in controllersList) {
        educationList.add(EducationModel(
          institution: controllers['institution']?.text,
          location: controllers['location']?.text,
          degreeType: controllers['degreeType']?.text,
          fieldOfStudy: controllers['fieldOfStudy']?.text,
          startDate: controllers['startDate']?.text,
          endDate: controllers['endDate']?.text,
        ));
      }
      debugPrint('Education Details: ${educationList.map((e) => e.toString()).toList()}');
    }
  }

  @override
  Widget build(BuildContext context) {
    var height = context.height(context) * 0.02;
    return Scaffold(
      appBar: const CustomAppBar(title: 'Education'),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ...List.generate(controllersList.length, (index) {
                  var controllers = controllersList[index];
                  return ExpansionTile(
                    initiallyExpanded: expansionStates[index],
                    title: Text(
                      controllers['institution']!.text.isEmpty
                          ? 'Education Details ${index + 1}'
                          : controllers['institution']!.text,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    onExpansionChanged: (isExpanded) {
                      setState(() {
                        expansionStates[index] = isExpanded;
                      });
                    },
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CommonHeading(title: 'Institution (${index + 1})'),
                          if (controllersList.length > 1)
                            IconButton(
                              onPressed: () => _deleteEducationFields(index),
                              icon: const Icon(Icons.delete, color: Colors.red),
                            ),
                        ],
                      ),
                      CommonTextformfield(
                          controller: controllers['institution']!,
                          labelText: 'xyz University',
                          errorText: 'Enter Institution'),
                      SizedBox(height: height),

                      CommonHeading(title: 'Location (${index + 1})'),
                      CommonTextformfield(
                          controller: controllers['location']!,
                          labelText: 'Gujarat, India',
                          errorText: 'Enter Location'),
                      SizedBox(height: height),

                      CommonHeading(title: 'Degree Type (${index + 1})'),
                      CommonTextformfield(
                          controller: controllers['degreeType']!,
                          labelText: 'Bachelors/Master',
                          errorText: 'Enter Degree Type'),
                      SizedBox(height: height),

                      CommonHeading(title: 'Field of Study (${index + 1})'),
                      CommonTextformfield(
                          controller: controllers['fieldOfStudy']!,
                          labelText: 'Computer Science',
                          errorText: 'Enter Field of Study'),
                      SizedBox(height: height),

                      CommonYearsTextfield(
                        startDateController: controllers['startDate']!,
                        endDateController: controllers['endDate']!,
                      ),
                      SizedBox(height: height),
                    ],
                  );
                }),
                if (controllersList.length < 4)
                  Center(
                    child: ElevatedButton(
                      onPressed: _addEducationFields,
                      child: const Text('Add Another Education'),
                    ),
                  ),
                SizedBox(height: height),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CommonSaveButton(
                      formKey: formKey,
                      onTap: _saveEducation,
                      name: Strings.saveContinue,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

