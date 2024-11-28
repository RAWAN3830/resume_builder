import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:resume/presentation/common_widgets/common_buttons/common_reset_button.dart';
import 'package:resume/presentation/common_widgets/common_buttons/common_save_button.dart';
import 'package:resume/presentation/common_widgets/common_textfields/common_require_Textfield.dart';
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
    if(title != null && roles != null && technologies != null && descripation != null)
    {
      projectController.text = title!;
      roleController.text = roles!;
      techController.text = technologies!;
      descriptionController.text = descripation!;
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
          title: const Text('Projects',
              style: TextStyle(color: Colors.white, fontSize: 25)),
        ),
      body:SingleChildScrollView(
      child: Form(
      key: formKey,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
         crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            const Text('Project Title',style: TextStyle(color: Colors.blue,fontSize:20,fontWeight: FontWeight.bold
            ),),
            CommonRequiredTextFields(controller: projectController, labelText: 'Project Title', errorText: 'enter project title'),


            const Text('Roles',style: TextStyle(color: Colors.blue,fontSize:20,fontWeight: FontWeight.bold
            ),),
            CommonRequiredTextFields(controller: roleController, labelText: 'Manager , Analysist', errorText: 'Enter Role'),

            const Text('Technologies',style: TextStyle(color: Colors.blue,fontSize:20,fontWeight: FontWeight.bold
            ),),
            CommonRequiredTextFields(controller: techController, labelText: 'Max 5 Language', errorText: "Enter Technologies"),


            const Text('Project Description',style: TextStyle(color: Colors.blue,fontSize:20,fontWeight: FontWeight.bold
            ),),
            CommonRequiredTextFields(controller: descriptionController, labelText: "Description", errorText: "Enter Description"),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CommonSaveButton(formKey: formKey, buttonTitle: '',),
                CommonResetButton(formKey: formKey)
              ],
            ),
          ],
        ),
      ),
    ),
    ),);
  }
}
