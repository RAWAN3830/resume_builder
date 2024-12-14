import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:resume/core/constant/extension.dart';
import 'package:resume/presentation/common_widgets/common_buttons/common_reset_button.dart';
import 'package:resume/presentation/common_widgets/common_buttons/common_save_button.dart';
import 'package:resume/presentation/common_widgets/common_text/common_heading.dart';
import 'package:resume/presentation/common_widgets/common_textfields/common_years_textfield.dart';
import '../core/constant/strings.dart';
import 'common_widgets/common_appbar/custome_appbar.dart';
import 'common_widgets/common_textfields/comman_textformfield.dart';

String? institution;
String? location;
String? degreeType;
String? fieldOfStudy;
String? startDate;
String? endDate;

class EducationInfo extends StatefulWidget {
  const EducationInfo({super.key});

  @override
  State<EducationInfo> createState() => _EducationInfoState();
}

class _EducationInfoState extends State<EducationInfo> {
  // int indexCount = 0;
  TextEditingController institutionController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController degreeTypeController = TextEditingController();
  TextEditingController fieldOfStudyController = TextEditingController();
  TextEditingController startDateController = TextEditingController();
  TextEditingController endDateController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    if (institution != null &&
        location != null &&
        degreeType != null &&
        fieldOfStudy != null) {
      institutionController.text = institution ?? '';
      locationController.text = location ?? '';
      degreeTypeController.text = degreeType ?? '';
      fieldOfStudyController.text = fieldOfStudy ?? '';
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var height = context.height(context) * 0.02;
    return Scaffold(
      appBar: const CustomAppBar(title:'Education'),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                const CommonHeading(title: 'Institution'),
                CommonTextformfield(
                    controller: institutionController,
                    labelText: 'xyz University',
                    errorText: 'enter degree info'),
                SizedBox(height:height),


                const CommonHeading(title: 'Location'),
                CommonTextformfield(
                    controller: locationController,
                    labelText: 'Gujarat, india',
                    errorText: 'Enter Location'),
                SizedBox(height:height),


                const CommonHeading(title: 'Degree Type'),
                CommonTextformfield(
                    controller: degreeTypeController,
                    labelText: 'Bachelors/Master',
                    errorText: "Enter Degree"),
                SizedBox(height:height),

                const CommonHeading(title: 'Field of Study'),
                CommonTextformfield(
                    controller: fieldOfStudyController,
                    labelText: 'Computer Science',
                    errorText: "Enter field"),
                SizedBox(height:height),
                CommonYearsTextfield(startDateController: startDateController, endDateController: endDateController),
                SizedBox(height:height),


                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CommonSaveButton(
                      formKey: formKey,
                      onTap: (){},
                      name: Strings.saveContinue,
                    ),
                    CommonResetButton(formKey: formKey)
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
