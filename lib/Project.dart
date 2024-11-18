import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
String? title;
String? roles;
String? technologies;
String? descripation;
class ProjectEmp extends StatefulWidget {
  const ProjectEmp({super.key});

  @override
  State<ProjectEmp> createState() => _ProjectEmpState();
}

class _ProjectEmpState extends State<ProjectEmp> {
  TextEditingController courseController = TextEditingController();
  TextEditingController collageController = TextEditingController();
  TextEditingController cgpaController = TextEditingController();
  TextEditingController passingyearController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  bool c_Programming = false;
  bool Cpp = false;
  bool Flutter = false;
  bool solidity = false;



  @override
  void initState() {
    // TODO: implement initState
    if(title != null && roles != null && technologies != null && descripation != null)
    {
      courseController.text = title!;
      collageController.text = roles!;
      cgpaController.text = technologies!;
      passingyearController.text = descripation!;
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
          title: Text('Projects',
              style: TextStyle(color: Colors.white, fontSize: 25)),
        ),
      body:SingleChildScrollView(
      child: Form(
      key: formKey,
      child: Column(
        children: [
          SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.only(right:200),
            child: Text('Project Title',style: TextStyle(color: Colors.blue,fontSize:20,fontWeight: FontWeight.bold
            ),),
          ),
          Padding(
            padding: const EdgeInsets.only(top:10,left: 30,right: 30),
            child: TextFormField(
              controller: courseController,
              validator: (value){
                if(value!.isEmpty)
                {  return 'enter project title'; }
              },
              onSaved: (value){
                title = value;
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Resume Builder App',),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right:180),
            child: Text('Technologies',style: TextStyle(color: Colors.blue,fontSize:22,fontWeight: FontWeight.bold
            ),),
          ),
          CheckboxListTile(
            contentPadding: EdgeInsets.only(left:20,right: 150),

            value: c_Programming,
              onChanged:(value){
                setState(() {
                  c_Programming = value!;
                });
          },
            title: Text('C Programming',style: TextStyle(fontSize: 20)),

          ),
          CheckboxListTile(
            contentPadding: EdgeInsets.only(left:20,right: 150),

            value: Cpp,
            onChanged:(value){
              setState(() {
                Cpp = value!;
              });
            },
            title: Text('C ++',style: TextStyle(fontSize: 20)),

          ),
          CheckboxListTile(
            contentPadding: EdgeInsets.only(left:20,right: 150),
            value: Flutter,
            onChanged:(value){
              setState(() {
                Flutter = value!;
              });
            },
            title: Text('Flutter',style: TextStyle(fontSize: 20)),

          ),
          SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.only(right:270),
            child: Text('Roles',style: TextStyle(color: Colors.blue,fontSize:20,fontWeight: FontWeight.bold
            ),),
          ),
          Padding(
            padding: const EdgeInsets.only(top:10,left: 30,right: 30),
            child: TextFormField(
              controller: collageController,
              validator: (value){
                if(value!.isEmpty)
                { return 'enter role ';}
              },
              onSaved: (value){
                roles = value;
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Cole , Analysis',),
            ),
          ),
          SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.only(right:190),
            child: Text('Technologies',style: TextStyle(color: Colors.blue,fontSize:20,fontWeight: FontWeight.bold
            ),),
          ),
          Padding(
            padding: const EdgeInsets.only(top:10,left: 30,right: 30),
            child: TextFormField(
              controller: cgpaController,
              validator: (value){
                if(value!.isEmpty)
                {return 'project Technologies';}
              },
              onSaved: (value){
                technologies= value;
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: '5 - Programmers',),
            ),
          ),
          SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.only(right:150),
            child: Text('Project Description',style: TextStyle(color: Colors.blue,fontSize:20,fontWeight: FontWeight.bold
            ),),
          ),
          Padding(
            padding: const EdgeInsets.only(top:10,left: 30,right: 30),
            child: TextFormField(
              controller: passingyearController,
              validator: (value){
                if(value!.isEmpty)
                {return 'Enter Description';}
              },
              onSaved:(value){
                descripation = value;
              },
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter your project Description',),
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
              // ElevatedButton(
              //     style: ButtonStyle(
              //         backgroundColor:MaterialStateColor.resolveWith((states) => Colors.blue)),
              //     onPressed: () {
              //       formKey.currentState!.reset();
              //     },
              //     child: Text('Reset',style: TextStyle(fontSize: 18,color: Colors.white)))

            ],
          ),
        ],
      ),
    ),
    ),);
  }
}
