import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

String? name;
String? email;
String? phone;
String? address;

class ContactInfo extends StatefulWidget {
  const ContactInfo({super.key});

  @override
  State<ContactInfo> createState() => _ContactInfoState();
}

class _ContactInfoState extends State<ContactInfo> {
  int indexCount = 0;

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  File? image;
  @override
  void initState() {
    // TODO: implement initState
    if (name != null && email != null && phone != null && address != null)
    {
      nameController.text = name!;
      emailController.text = email!;
      phoneController.text = phone!;
      addressController.text = address!;
    }
    super.initState();
  }

  pickImageFromCamera() async
  {
    var imageFile=await ImagePicker().pickImage(source: ImageSource.camera);
    if(imageFile!=null)
    {
      setState(() {
        image=File(imageFile.path);
      });
    }
  }

  // pickImageFromGallery()
  // {
  //   var imagefileGallery =
  // }
  //


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text('Contact Info',style: TextStyle(color: Colors.white)),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    height: 40,
                    width: 200,
                    color: Colors.blueAccent,
                    child: InkWell(
                        onTap: () {
                          setState(() {
                            indexCount = 0;
                            Container(
                              height: 10,
                              width: 100,
                              color: Colors.red,
                            );
                           // Colors.red;
                          });
                        },
                        child: Center(child: Text('Contact',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color:Colors.white),))),
                  ),
                  Container(
                    height: 40,
                    width: 182,
                    color: Colors.blueAccent,
                    child: InkWell(
                        onTap: () {
                          setState(() {
                            indexCount = 1;
                          });
                        },
                        child: Center(child: Text('Photo',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color:Colors.white)))),
                  )
                ],
              ),
              SizedBox(height: 20),
              IndexedStack(
                index: indexCount,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Form(
                      key: formKey,
                      child: Column(
                        children: [
                          TextFormField(
                              controller: nameController,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Enter Name';
                                }
                              },
                              onSaved: (value) {
                                name = value;
                              },
                              keyboardType: TextInputType.name,
                              maxLength: 10,
                              decoration: InputDecoration(
                                  hintText: 'Name',
                                  prefixIcon: Icon(
                                      CupertinoIcons.person_alt_circle_fill, size: 30)
                              )),
                          SizedBox(height: 10,),
                          TextFormField(
                            controller: emailController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Enter E-mail";
                              }},
                            onSaved: (value) {
                              email = value;
                            },
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.email,
                                color: Colors.black,
                                size: 30,),
                              hintText: 'E - mail',
                            ),),

                          SizedBox(height: 30,),

                          TextFormField(
                            controller: phoneController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Enter Phone Number";}},
                            onSaved: (value) { phone = value;},
                            keyboardType: TextInputType.phone,
                            maxLength: 10,
                            decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.phone,
                                size: 30,
                              ),
                              hintText: "Phone",
                            ),
                          ),
                          SizedBox(height: 30,),
                          TextFormField(
                            controller: addressController,
                            maxLines: 3,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Enter Address";
                              }
                            },
                            onSaved: (value) {
                              address = value;
                            },
                            keyboardType: TextInputType.streetAddress,
                            decoration: InputDecoration(
                              prefixIcon: Padding(
                                padding: const EdgeInsets.only(bottom: 50,),
                                child: Icon(
                                  Icons.location_on,
                                  size: 30,
                                ),),

                              hintText: "Address (Street , Building NO)",
                            ),
                          ),
                          SizedBox(height: 30,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              ElevatedButton(
                                style:ButtonStyle(
                                    backgroundColor:MaterialStateColor.resolveWith((states) => Colors.blue),
                                    ),
                                  onPressed: () {
                                    if (formKey.currentState!.validate()) {
                                      print('Submit');
                                      formKey.currentState!.save();

                                      var snackbar = SnackBar(
                                          content: Text('Contact Info Submitted sucessfully.'));
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(snackbar);
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
                  Container(
                    height: 400,
                    // color: Colors.yellow,
                    child: Center(
                      child: Stack(
                        children: [
                          (image==null)?   Container(
                            height: 120,
                            width: 120,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.grey
                            ),
                            child: Center(child: Text('ADD',style: TextStyle(fontSize: 20,color: Colors.white),)),
                          ):Container(
                            height: 100, width: 100,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.grey,
                              image: DecorationImage(
                                image: FileImage(image!),
                                fit: BoxFit.cover
                              )
                            ),
                          ),
                          Positioned(
                            top: 10,
                            left: 90,
                            child: InkWell(
                              onTap: (){
                                pickImageFromCamera();
                              },
                              child: Container(
                                height: 25,
                                width: 25,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.blue),
                                child: Center(child: Icon(CupertinoIcons.add,color: Colors.white,)),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),

                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
