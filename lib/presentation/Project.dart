import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:resume/core/constant/extension.dart';
import 'package:resume/presentation/common_widgets/common_buttons/common_reset_button.dart';
import 'package:resume/presentation/common_widgets/common_buttons/common_save_button.dart';
import 'package:resume/presentation/common_widgets/common_text/common_heading.dart';
import 'package:resume/presentation/common_widgets/common_textfields/common_longlinetextfield.dart';

import '../core/constant/strings.dart';
import 'common_widgets/common_appbar/custome_appbar.dart';
import 'common_widgets/common_textfields/comman_textformfield.dart';

String? title;
String? roles;
String? technologies;
String? descripation;

class ProjectInfo extends StatefulWidget {
  const ProjectInfo({super.key});

  @override
  State<ProjectInfo> createState() => _ProjectInfoState();
}

class _ProjectInfoState extends State<ProjectInfo> {
  TextEditingController projectController = TextEditingController();
  TextEditingController roleController = TextEditingController();
  TextEditingController techController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    if (title != null &&
        roles != null &&
        technologies != null &&
        descripation != null) {
      projectController.text = title!;
      roleController.text = roles!;
      techController.text = technologies!;
      descriptionController.text = descripation!;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var height = context.height(context) * 0.03;
    return Scaffold(
      appBar: const CustomAppBar(title:'Projects'),

      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                const CommonHeading(title: 'Project Title'),
                CommonTextformfield(
                    controller: projectController,
                    labelText: 'Project Title',
                    errorText: 'enter project title'),
                SizedBox(
                  height: height,
                ),
                const CommonHeading(title: 'Roles'),
                CommonTextformfield(
                    controller: roleController,
                    labelText: 'Manager , Analysist',
                    errorText: 'Enter Role'),
                SizedBox(
                  height: height,
                ),
                const CommonHeading(title: 'Technologies'),
                CommonTextformfield(
                    controller: techController,
                    labelText: 'Max 5 Language',
                    errorText: "Enter Technologies"),
                SizedBox(
                  height: height,
                ),
                const CommonHeading(title: 'Project Description'),
                CommonLonglineTextfield(
                    controller: descriptionController,
                    hintText: 'Description',
                    errorText: "Enter Description"),
                SizedBox(
                  height: height ,
                ),
                SizedBox(
                  height: height ,
                ),
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
