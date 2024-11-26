
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:resume/presentation/common_widgets/common_buttons/common_reset_button.dart';
import 'package:resume/presentation/common_widgets/common_buttons/common_save_button.dart';
import 'package:resume/presentation/common_widgets/common_textfields/common_require_Textfield.dart';

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
    if(course != null && collage != null && cgpa != null && passingYear != null)
      {
        courseController.text = course!;
        collageController.text = collage!;
        cgpaController.text = cgpa!;
        passingyearController.text = passingYear!;
      }
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 90,
        leading: InkWell(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: const Icon(CupertinoIcons.back, color: Colors.white,),
        ),
        backgroundColor: Colors.blue,
        title: const Text('Education',
            style: TextStyle(color: Colors.white, fontSize: 25,fontWeight: FontWeight.bold)),
      ),
      body:
      SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
             children: [
               const SizedBox(height: 10,),
                const Text('Course/Degree',style: TextStyle(color: Colors.blue,fontSize:20,fontWeight: FontWeight.bold
                 ),),
              CommonRequiredTextFields(controller: courseController, labelText: 'Degree Info', errorText:'enter degree info'),
               const SizedBox(height: 10,),
               const Text('School/Collage/institute',style: TextStyle(color: Colors.blue,fontSize:20,fontWeight: FontWeight.bold
               ),),
              CommonRequiredTextFields(controller: collageController, labelText: 'Collage Name', errorText: 'Enter Collage Name'),
               const SizedBox(height: 10,),
               const Text('CGPA / SGPA',style: TextStyle(color: Colors.blue,fontSize:20,fontWeight: FontWeight.bold
               ),),
              CommonRequiredTextFields(controller: cgpaController, labelText: '70 % (or) 7.0 CGPA', errorText: "Enter CGPA"),
               const SizedBox(height: 10,),
               const Text('Year Of Pass',style: TextStyle(color: Colors.blue,fontSize:20,fontWeight: FontWeight.bold
               ),),
               CommonRequiredTextFields(controller: passingyearController, labelText: '2020', errorText: "Enter Year"),
               const SizedBox(height: 20,),

               Row(
                 mainAxisAlignment: MainAxisAlignment.spaceAround,
                 children: [
                   CommonSaveButton(formKey: formKey),
                   CommonResetButton(formKey: formKey)
                 ],
               ),
                ],
          ),
        ),
      ),
    );
  }
}
