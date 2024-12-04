import 'package:flutter/material.dart';
import 'package:resume/core/constant/extension.dart';
import 'package:resume/presentation/common_widgets/common_buttons/common_save_button.dart';
import 'package:resume/presentation/common_widgets/common_text/common_heading.dart';
import 'package:resume/presentation/common_widgets/common_textfields/comman_textformfield.dart';
import 'package:resume/presentation/common_widgets/common_textfields/common_longlinetextfield.dart';

import '../core/constant/strings.dart';

String? company;
String? institute;
String? roles;

class ExperienceInfo extends StatefulWidget {
  const ExperienceInfo({super.key});

  @override
  State<ExperienceInfo> createState() => _ExperienceInfoState();
}

enum EmpStatus { previously, currently }

final formkey = GlobalKey<FormState>();

class _ExperienceInfoState extends State<ExperienceInfo> {
  int indexCount = 0;
  EmpStatus m = EmpStatus.previously;
  TextEditingController companyController = TextEditingController();
  TextEditingController instituteController = TextEditingController();
  TextEditingController roleController = TextEditingController();

  @override
  void setState(VoidCallback fn) {
    // TODO: implement setState
    companyController.text = company!;
    instituteController.text = institute!;
    roleController.text = roles!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var height = context.height(context) * 0.02;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('Experiences',
            style: TextStyle(color: Colors.white, fontSize: 25)),
      ),
      body: SingleChildScrollView(
        child: Form(
            key: formkey,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: height),
                  const CommonHeading(title: 'Company Name'),
                  CommonTextformfield(
                      labelText: 'Infosys',
                      controller: companyController,
                      errorText: 'enter value'),
                  SizedBox(height: height),
                  const CommonHeading(title: 'Institute / Collage'),
                  CommonTextformfield(
                      labelText: 'Mobile Devloper',
                      controller: instituteController,
                      errorText: 'enter valid value'),
                  SizedBox(height: height),
                  const CommonHeading(title: 'Roles (optional)'),
                  CommonLonglineTextfield(
                      controller: roleController,
                      hintText:
                          'working with team members to come up with new concepts end product analysis',
                      errorText: 'role in Company'),
                  SizedBox(height: height),
                  const CommonHeading(title: 'Employed Status'),
                  Row(children: [
                    const CommonHeading(title: 'Previously Employed'),
                    Radio(
                        value: EmpStatus.previously,
                        groupValue: m,
                        onChanged: (EmpStatus? value) {
                          setState(() {
                            m = value!;
                          });
                        }),
                  ]),
                  Row(children: [
                    Row(children: [
                      const CommonHeading(title: 'Currently Employed'),
                      Radio(
                          value: EmpStatus.currently,
                          groupValue: m,
                          onChanged: (EmpStatus? value) {
                            setState(() {
                              m = value!;
                            });
                          }),
                    ])
                  ]),
                  // CommonButton(onTap: (){}, title: 'Submit')
                  CommonSaveButton(
                      formKey: formkey,
                    onTap: (){},
                    name: Strings.saveContinue,)
                ],
              ),
            )),
      ),
    );
  }
}
