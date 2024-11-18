
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
          child: Icon(CupertinoIcons.back, color: Colors.white,),
        ),
        backgroundColor: Colors.blue,
        title: Text('Education',
            style: TextStyle(color: Colors.white, fontSize: 25,fontWeight: FontWeight.bold)),
      ),
      body:
      SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
             children: [
               SizedBox(height: 10,),
                Text('Course/Degree',style: TextStyle(color: Colors.blue,fontSize:20,fontWeight: FontWeight.bold
                 ),),
               Padding(
                 padding: const EdgeInsets.only(top:10,left: 30,right: 30),
                 child: TextFormField(
                   controller: courseController,
                   validator: (value){
                     if(value!.isEmpty)
                       {  return 'enter course'; }
                   },
                   onSaved: (value){
                       course = value;
                   },
                   decoration: InputDecoration(
                     border: OutlineInputBorder(),
                     hintText: 'Degree Info',),
                 ),
               ),
               SizedBox(height: 10,),
               Text('School/Collage/institute',style: TextStyle(color: Colors.blue,fontSize:20,fontWeight: FontWeight.bold
               ),),
               Padding(
                 padding: const EdgeInsets.only(top:10,left: 30,right: 30),
                 child: TextFormField(
                   controller: collageController,
                   validator: (value){
                     if(value!.isEmpty)
                       { return 'enter collage name';}
                   },
                   onSaved: (value){
                     collage = value;
                     },
                   decoration: InputDecoration(
                     border: OutlineInputBorder(),
                     hintText: 'Collage Name',),
                 ),
               ),
               SizedBox(height: 10,),
               Text('CGPA / SGPA',style: TextStyle(color: Colors.blue,fontSize:20,fontWeight: FontWeight.bold
               ),),
               Padding(
                 padding: const EdgeInsets.only(top:10,left: 30,right: 30),
                 child: TextFormField(
                   controller: cgpaController,
                   validator: (value){
                     if(value!.isEmpty)
                       {return 'enter CGPA';}
                   },
                   onSaved: (value){
                     cgpa = value;
                   },
                   decoration: InputDecoration(
                     border: OutlineInputBorder(),
                     hintText: '70 % (or) 7.0 CGPA',),
                 ),
               ),
               SizedBox(height: 10,),
               Text('Year Of Pass',style: TextStyle(color: Colors.blue,fontSize:20,fontWeight: FontWeight.bold
               ),),
               Padding(
                 padding: const EdgeInsets.only(top:10,left: 30,right: 30),
                 child: TextFormField(
                   controller: passingyearController,
                   validator: (value){
                     if(value!.isEmpty)
                       {return 'enter year of passing';}
                   },
                   onSaved:(value){
                     passingYear = value;
                   },
                   keyboardType: TextInputType.number,
                   decoration: InputDecoration(
                     border: OutlineInputBorder(),
                     hintText: '2020',),
                 ),
               ),
               SizedBox(height: 20,),

               Row(
                 mainAxisAlignment: MainAxisAlignment.spaceAround,
                 children: [
                   ElevatedButton(
                       style:ButtonStyle(
                         backgroundColor:MaterialStateColor.resolveWith((states) => Colors.blue),
                       ),
                       onPressed: () {
                         if(formKey.currentState!.validate())
                         {
                           print('submit');

                           var snakebar = SnackBar(content: Text(
                               'Edu Sucessfully Saved'));
                           ScaffoldMessenger.of(context).showSnackBar(snakebar);

                           formKey.currentState!.save();
                         }
                       },
                       child: Text('Submit',style: TextStyle(fontSize: 18,color: Colors.white),)),
                   ElevatedButton(
                       style: ButtonStyle(
                           backgroundColor:MaterialStateColor.resolveWith((states) => Colors.blue)),
                       onPressed: () {
                         formKey.currentState!.reset();
                       },
                       child: Text('Reset',style: TextStyle(fontSize: 18,color: Colors.white)))

                 ],
               ),
                ],
          ),
        ),
      ),
    );
  }
}
