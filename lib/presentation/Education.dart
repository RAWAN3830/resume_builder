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

                CommonHeading(title: 'Course/Degree'),
                CommonTextformfield(
                    controller: courseController,
                    labelText: 'Degree Info',
                    errorText: 'enter degree info'),
                SizedBox(height:height),


                CommonHeading(title: 'School/Collage/institute'),
                CommonTextformfield(
                    controller: collageController,
                    labelText: 'Collage Name',
                    errorText: 'Enter Collage Name'),
                SizedBox(height:height),


                CommonHeading(title: 'CGPA / SGPA'),
                CommonTextformfield(
                    controller: cgpaController,
                    labelText: '70 % (or) 7.0 CGPA',
                    errorText: "Enter CGPA"),
                SizedBox(height:height),

                CommonHeading(title: 'Year Of Pass'),
                CommonTextformfield(
                    controller: passingyearController,
                    labelText: '2020',
                    errorText: "Enter Year"),
                SizedBox(height:height),
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
