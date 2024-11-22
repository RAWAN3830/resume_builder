import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:resume/presentation/common_widgets/common_buttons/common_reset_button.dart';
import 'package:resume/presentation/common_widgets/common_textfields/comman_textformfield.dart';
import 'package:resume/presentation/common_widgets/common_textfields/common_longlinetextfield.dart';
import 'package:resume/strings.dart';

import 'common_widgets/common_buttons/common_save_button.dart';

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
    if (name != null && email != null && phone != null && address != null) {
      nameController.text = name!;
      emailController.text = email!;
      phoneController.text = phone!;
      addressController.text = address!;
    }
    super.initState();
  }

  pickImageFromCamera() async {
    var imageFile = await ImagePicker().pickImage(source: ImageSource.camera);
    if (imageFile != null) {
      setState(() {
        image = File(imageFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title:
              const Text('Contact Info', style: TextStyle(color: Colors.white)),
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
                        child: const Center(
                            child: Text(
                          'Contact',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ))),
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
                        child: const Center(
                            child: Text('Photo',
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white)))),
                  )
                ],
              ),
              const SizedBox(height: 20),
              IndexedStack(
                index: indexCount,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Form(
                      key: formKey,
                      child: Column(
                        children: [
                          CommonTextformfield(
                            hinttext: 'Name',
                            icon: CupertinoIcons.person_alt_circle_fill,
                            controller: nameController,
                            errortext: 'Enter valid name',
                          ),

                          const SizedBox(
                            height: 10,
                          ),

                          CommonTextformfield(
                            hinttext: "Email",
                            icon: Icons.email,
                            controller: emailController,
                            errortext: 'Enter valid Mail',
                          ),

                          const SizedBox(
                            height: 30,
                          ),

                          CommonTextformfield(
                            hinttext: 'phone',
                            icon: Icons.phone,
                            controller: phoneController,
                            errortext: 'Enter Phone NO',
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          CommonLonglineTextfield(
                              controller: addressController,
                              hinttext: "Address (Street , Building NO)",
                              errortext: 'Enter Address'),
                          const SizedBox(
                            height: 30,
                          ),
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
                  SizedBox(
                    height: 400,
                    // color: Colors.yellow,
                    child: Center(
                      child: Stack(
                        children: [
                          (image == null)
                              ? Container(
                                  height: 120,
                                  width: 120,
                                  decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.grey),
                                  child: const Center(
                                      child: Text(
                                    'ADD',
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.white),
                                  )),
                                )
                              : Container(
                                  height: 100,
                                  width: 100,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.grey,
                                      image: DecorationImage(
                                          image: FileImage(image!),
                                          fit: BoxFit.cover)),
                                ),
                          Positioned(
                            top: 10,
                            left: 90,
                            child: InkWell(
                              onTap: () {
                                pickImageFromCamera();
                              },
                              child: Container(
                                height: 25,
                                width: 25,
                                decoration: const BoxDecoration(
                                    shape: BoxShape.circle, color: Colors.blue),
                                child: const Center(
                                    child: Icon(
                                  CupertinoIcons.add,
                                  color: Colors.white,
                                )),
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
