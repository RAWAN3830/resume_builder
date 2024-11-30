import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:resume/core/constant/extension.dart';
import 'package:resume/presentation/auth_screen/registration_screen.dart';
import 'package:resume/presentation/common_widgets/common_text/common_heading.dart';
import 'package:resume/presentation/common_widgets/common_textfields/comman_textformfield.dart';

String? Reference_name;
String? Designation;
String? Organization;

class Reference extends StatefulWidget {
  const Reference({super.key});

  @override
  State<Reference> createState() => _ReferenceState();
}

class _ReferenceState extends State<Reference> {
TextEditingController refrenceController = TextEditingController();
TextEditingController designationController = TextEditingController();
TextEditingController organizationController = TextEditingController();
final formkey = GlobalKey<FormState>();
@override
void initState() {
    // TODO: implement initState
   if(Reference_name != null && Designation != null && Organization != null) {
    refrenceController.text = Reference_name!;
    designationController.text = Designation!;
    organizationController.text = Organization!;
   }
    super.initState();
  }
@override
  Widget build(BuildContext context) {
  var height = context.height(context) * .02;
    return  Scaffold(
      backgroundColor: Colors.grey.shade300,
        appBar: AppBar(

        leading: InkWell(
        onTap: () {
          Navigator.of(context).pop();
      if(formkey.currentState!.validate())
        {
          Navigator.of(context).pop();
        }
    },
    child: const Icon(CupertinoIcons.back, color: Colors.white,),
    ),
    backgroundColor: Colors.blue,
    title: const Text('References',
    style: TextStyle(color: Colors.white, fontSize: 25)),
    ),
    body:Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        height: context.height(context) * .45,
        width: double.infinity,
        decoration:BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: height,),
             const CommonHeading(title: 'Reference Name'),
              // CommonTextformfield(labelText: 'name', controller: nameController, errorText: 'enter String'),
              SizedBox(height: height,),
              const CommonHeading(title: 'Designation'),
              CommonTextformfield(labelText: 'Marketing', controller: designationController, errorText: 'enter Designation'),
              SizedBox(height: height,),
              const CommonHeading(title: 'Company/Institute'),
              CommonTextformfield(labelText: 'organization', controller: organizationController, errorText: "enter valid company"),

            ],
          ),
        ),
      ),
    ),);
  }
}
