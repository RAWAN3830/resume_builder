import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

String? Reference_name;
String? Designation;
String? Organization;

class Reference extends StatefulWidget {
  const Reference({super.key});

  @override
  State<Reference> createState() => _ReferenceState();
}

class _ReferenceState extends State<Reference> {
TextEditingController RefrenceController = TextEditingController();
TextEditingController DesignationController = TextEditingController();
TextEditingController OrganizationController = TextEditingController();
final formkey = GlobalKey<FormState>();
@override
void initState() {
    // TODO: implement initState
   if(Reference_name != null && Designation != null && Organization != null) {
    RefrenceController.text = Reference_name!;
    DesignationController.text = Designation!;
    OrganizationController.text = Organization!;
   }
    super.initState();
  }
@override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.grey.shade300,
        appBar: AppBar(
        toolbarHeight: 90,
        leading: InkWell(
        onTap: () {
          Navigator.of(context).pop();
      if(formkey.currentState!.validate())
        {
          Navigator.of(context).pop();
          // formkey.currentState!.save();
          //
          // var snakebar = SnackBar(content: Text(
          //   'Saved Successfully'));
          // ScaffoldMessenger.of(context).showSnackBar(snakebar);

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
        height: 500,
        width: 500,
        decoration:BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(20)),
        child: Column(
          children: [
            const SizedBox(height: 20,),
            const Padding(
              padding: EdgeInsets.only(right:140),
              child: Text('Reference Name',style: TextStyle(color: Colors.blue,fontSize:20,fontWeight: FontWeight.bold
              ),),
            ),
            Padding(
              padding: const EdgeInsets.only(top:10,left: 30,right: 30),
              child: TextFormField(
                controller: RefrenceController,
                validator: (value){
                  if(value!.isEmpty)
                  { return ' Enter Name ';}
                  return null;
                },
                onSaved: (value){
                  Reference_name = value;
                },
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'name',),
              ),
            ),
            const SizedBox(height: 20,),
            const Padding(
              padding: EdgeInsets.only(right:190),
              child: Text('Designation',style: TextStyle(color: Colors.blue,fontSize:20,fontWeight: FontWeight.bold
              ),),
            ),
            Padding(
              padding: const EdgeInsets.only(top:10,left: 30,right: 30),
              child: TextFormField(
                controller: DesignationController,
                validator: (value){
                  if(value!.isEmpty)
                  {return 'Marketing';}
                  return null;
                },
                onSaved: (value){
                   Designation = value;
                },
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: '5 - Programmers',),
              ),
            ),
            const SizedBox(height: 20,),
            const Padding(
              padding: EdgeInsets.only(right:190),
              child: Text('Designation',style: TextStyle(color: Colors.blue,fontSize:20,fontWeight: FontWeight.bold
              ),),
            ),
            Padding(
              padding: const EdgeInsets.only(top:10,left: 30,right: 30),
              child: TextFormField(
                controller: OrganizationController,
                validator: (value){
                  if(value!.isEmpty)
                  {return 'organization name';}
                  return null;
                },
                onSaved: (value){
                  Organization = value;
                },
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Organization',),
              ),
            ),
          ],
        ),
      ),
    ),);
  }
}
