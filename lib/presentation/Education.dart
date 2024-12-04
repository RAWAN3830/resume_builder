import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:resume/core/constant/extension.dart';
import 'package:resume/presentation/common_widgets/common_buttons/common_reset_button.dart';
import 'package:resume/presentation/common_widgets/common_buttons/common_save_button.dart';
import 'package:resume/presentation/common_widgets/common_text/common_heading.dart';
import '../core/constant/strings.dart';
import 'common_widgets/common_textfields/comman_textformfield.dart';

String? course;
String? collage;
String? cgpa;
String? passingYear;

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
      appBar: AppBar(
        toolbarHeight: 90,
        leading: InkWell(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: const Icon(
            CupertinoIcons.back,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.blue,
        title: const Text('Education',
            style: TextStyle(
                color: Colors.white,
                fontSize: 25,
                fontWeight: FontWeight.bold)),
      ),
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

                Row(
                  children: [

                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const CommonHeading(title: 'Start Year'),
                          CommonTextformfield(
                            labelText: 'Your Link Here',
                            controller: collageController,
                            errorText: 'Enter valid Link',
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: context.width(context) * 0.05),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const CommonHeading(title: 'End Year'),
                          CommonTextformfield(
                            labelText: 'select..',
                            controller: cgpaController,
                            errorText: 'Enter valid value',
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
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
