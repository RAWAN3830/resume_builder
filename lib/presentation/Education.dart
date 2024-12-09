import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:resume/core/constant/extension.dart';
import 'package:resume/presentation/Project.dart';
import 'package:resume/presentation/common_widgets/common_buttons/common_reset_button.dart';
import 'package:resume/presentation/common_widgets/common_buttons/common_save_button.dart';
import 'package:resume/presentation/common_widgets/common_text/common_heading.dart';
import 'package:resume/presentation/common_widgets/common_textfields/common_years_textfield.dart';
import '../core/constant/strings.dart';
import 'common_widgets/common_appbar/custome_appbar.dart';
import 'common_widgets/common_textfields/comman_textformfield.dart';

String? course;
String? collage;
String? cgpa;
String? passingYear;
String? startDate;
String? endDate;

class EducationInfo extends StatefulWidget {
  const EducationInfo({super.key});

  @override
  State<EducationInfo> createState() => _EducationInfoState();
}

class _EducationInfoState extends State<EducationInfo> {
  // int indexCount = 0;
  TextEditingController courseController = TextEditingController();
  TextEditingController collageController = TextEditingController();
  TextEditingController cgpaController = TextEditingController();
  TextEditingController passingyearController = TextEditingController();
  TextEditingController startDateController = TextEditingController();
  TextEditingController endDateController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    if (course != null &&
        collage != null &&
        cgpa != null &&
        passingYear != null) {
      courseController.text = course!;
      collageController.text = collage!;
      cgpaController.text = cgpa!;
      passingyearController.text = passingYear!;
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
                    controller: courseController,
                    labelText: 'xyz University',
                    errorText: 'enter degree info'),
                SizedBox(height:height),


                const CommonHeading(title: 'Location'),
                CommonTextformfield(
                    controller: collageController,
                    labelText: 'Gujarat, india',
                    errorText: 'Enter Location'),
                SizedBox(height:height),


                const CommonHeading(title: 'Degree Type'),
                CommonTextformfield(
                    controller: cgpaController,
                    labelText: 'Bachelors/Master',
                    errorText: "Enter Degree"),
                SizedBox(height:height),

                const CommonHeading(title: 'Field of Study'),
                CommonTextformfield(
                    controller: passingyearController,
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
