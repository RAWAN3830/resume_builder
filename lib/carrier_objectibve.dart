import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
    if(career != null && designation != null)
      {
        careerController.text = career!;
        designationController.text = designation!;
      }
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 90,
        leading: InkWell(
          onTap: (){
            Navigator.of(context).pop();
          },
          child: Icon(CupertinoIcons.back,color: Colors.white,),
        ),
        backgroundColor: Colors.blue,
        title: Text('Carrier Objective',style: TextStyle(color: Colors.white,fontSize: 25)),
      ),
      body:
      SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(right:190,top: 20),
                child: Text('Career Objective',style: TextStyle(color: Colors.blue,fontSize:20,fontWeight: FontWeight.bold
                ),),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextFormField(
                  controller: careerController,
                  validator: (value){
                    if(career!.isEmpty)
                      {
                        return 'Enter Career Obj';
                      }
                  },
                  onSaved: (value){
                    career = value;
                  },

                  maxLines: 6,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Descripation',),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(right:10,top: 10,left: 20),
                child: Text('Current Designation (Experienced Candidate',style: TextStyle(color: Colors.blue,fontSize:20,fontWeight: FontWeight.bold
                ),),
              ),

              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextFormField(
                  controller: designationController,
                  validator: (value){
                    if(designation!.isEmpty)
                      {return 'Designation require';}
                  },
                  onSaved: (value){
                    designation = value;
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Software Engineer',),
                ),
              ),
               SizedBox(height: 20,),
              ElevatedButton(
                  style:ButtonStyle(
                    backgroundColor:MaterialStateColor.resolveWith((states) => Colors.blue),
                  ),
                  onPressed: () {
                    if(formKey.currentState!.validate())
                      {
                        print('Submit');
                        var snackbar = SnackBar(content: Text('Successfully Saved !!'));
                        ScaffoldMessenger.of(context).showSnackBar(snackbar);

                        formKey.currentState!.save();
                      }
                   
                  },
                  child: Text('Submit',style: TextStyle(fontSize: 18,color: Colors.white),)),

            ],
          ),
        ),
      ),
    );
  }
}
