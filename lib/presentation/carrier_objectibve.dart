import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:resume/core/constant/extension.dart';
import 'package:resume/presentation/common_widgets/common_buttons/common_save_button.dart';
import 'package:resume/presentation/common_widgets/common_text/common_heading.dart';
import 'package:resume/presentation/common_widgets/common_textfields/common_longlinetextfield.dart';

import 'common_widgets/common_textfields/comman_textformfield.dart';

String? career;
String? designation;

class CarrierObjective extends StatefulWidget {
  const CarrierObjective({super.key});

  @override
  State<CarrierObjective> createState() => _CarrierObjectiveState();
}

class _CarrierObjectiveState extends State<CarrierObjective> {
  TextEditingController careerController = TextEditingController();
  TextEditingController designationController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    if (career != null && designation != null) {
      careerController.text = career!;
      designationController.text = designation!;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
        title: const Text('Carrier Objective',
            style: TextStyle(color: Colors.white, fontSize: 25)),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CommonHeading(title:'Career Objective'),
                CommonLonglineTextfield(
                    controller: careerController,
                    hintText: 'Career Objective',
                    errorText: 'Enter Career Obj'),

                // const Text(
                //   'Current Designation (Experienced Candidate)',
                //   style: TextStyle(
                //       color: Colors.blue,
                //       fontSize: 20,
                //       fontWeight: FontWeight.bold),
                // ),
                SizedBox(height: context.height(context) * 0.05,),
                CommonHeading(title:'Designation'),
                CommonTextformfield(
                  controller: designationController,
                  labelText: 'Software Engineer',
                  errorText: 'Designation require',
                ),
                SizedBox(height: context.height(context) * 0.05,),

                CommonSaveButton(
                  formKey: formKey,
                  buttonTitle: '',
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
