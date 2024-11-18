import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:resume/personal_details.dart';

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
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          toolbarHeight: 100,
          title: Text('Experiences',
              style: TextStyle(color: Colors.white, fontSize: 25)),
        ),
        body: SingleChildScrollView(
          child: Form(
              key: formkey,
              child: Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Company Name',
                    style: TextStyle(
                        color: Colors.blue,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10, left: 30, right: 30),
                    child: TextFormField(
                      controller: companyController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'enter Company name';
                        }
                      },
                      onSaved: (value) {
                        company = value;
                      },
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Infosys',
                          hintStyle: TextStyle(
                              fontSize: 20, color: Colors.grey.shade400)),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Institute / Collage',
                    style: TextStyle(
                        color: Colors.blue,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10, left: 30, right: 30),
                    child: TextFormField(
                      controller: instituteController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'entery Require';
                        }
                      },
                      onSaved: (value) {
                        institute = value;
                      },
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Quality test Engineer',
                          hintStyle: TextStyle(
                              fontSize: 20, color: Colors.grey.shade400)),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Roles (optional)',
                    style: TextStyle(
                        color: Colors.blue,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10, left: 30, right: 30),
                    child: TextFormField(
                      controller: roleController,
                      maxLines: 4,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'role in Company';
                        }
                      },
                      onSaved: (value) {
                        roles = value;
                      },
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText:
                              'working with team members to come up with new concepts end product analysis',
                          hintStyle: TextStyle(
                              fontSize: 20, color: Colors.grey.shade400)),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Merital Status',
                    style: TextStyle(
                        color: Colors.blue,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                  Row(
                    children: [
                      Text("Previuos",style:TextStyle(fontSize:18,color:Colors.blue)),
                      Radio(value: EmpStatus.previously,
                          groupValue: m,
                          onChanged: (EmpStatus? value){
                        setState(() {
                          m = value!;
                        });
                          }),
                    ]),
                  Row(
                    children: [
                      Text("Currently",style:TextStyle(fontSize:18,color: Colors.blue)),
                      Radio(value: EmpStatus.currently,
                          groupValue: m,
                          onChanged: (EmpStatus? value){
                            setState(() {
                              m = value!;
                            });
                          }),
                    ])
                      ]),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                            children: [
                              Text("Date Joined",style:TextStyle(fontSize:18,color:Colors.blue)),
                              Container(
                                height: 30,
                                width: 100,
                                color: Colors.orange,
                              )
                              // TextField(
                              //
                              //  // controller: companyController,
                              //  //  validator: (value) {
                              //  //    if (value!.isEmpty) {
                              //  //      return 'enter Company name';
                              //  //    }
                              //  //  },
                              //  //  onSaved: (value) {
                              //  //    company = value;
                              //  //  },
                              //   decoration: InputDecoration(
                              //       //border: OutlineInputBorder(),
                              //       hintText: 'Infosys',
                              //       hintStyle: TextStyle(
                              //           fontSize: 20, color: Colors.grey.shade400)),
                              // ),
                            ]),
                        Column(
                            children: [
                              Text("Date Exit",style:TextStyle(fontSize:18,color: Colors.blue)),
                              Container(
                                height: 30,
                                width: 100,
                                color: Colors.orange,
                              )
                              // TextField(
                              //   // controller: companyController,
                              //   // validator: (value) {
                              //   //   if (value!.isEmpty) {
                              //   //     return 'enter Company name';
                              //   //   }
                              //   // },
                              //   // onSaved: (value) {
                              //   //   company = value;
                              //   // },
                              //
                              //   decoration: InputDecoration(
                              //       border: OutlineInputBorder(),
                              //       hintText: 'Infosys',
                              //       hintStyle: TextStyle(
                              //           fontSize: 20, color: Colors.grey.shade400)),
                              // ),
                            ])
                      ]),
                  ElevatedButton(
                      style:ButtonStyle(
                        backgroundColor:MaterialStateColor.resolveWith((states) => Colors.blue),
                      ),
                      onPressed: () {
                          if (formkey.currentState!.validate()) {
                            print('Submit');
                            formkey.currentState!.save();

                            var snackbar = SnackBar(
                                content: Text('Contact Info Submitted sucessfully.'));
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackbar);
                          }
                      },
                      child: Text('Submit',style: TextStyle(fontSize: 18,color: Colors.white),)),

                ],
              )),
        ),

    );
  }
}
