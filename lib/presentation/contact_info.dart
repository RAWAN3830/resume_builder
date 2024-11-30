import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:resume/core/constant/extension.dart';
import 'package:resume/presentation/common_widgets/common_buttons/common_reset_button.dart';
import 'package:resume/presentation/common_widgets/common_textfields/comman_textformfield.dart';
import 'package:resume/presentation/common_widgets/common_textfields/common_longlinetextfield.dart';

import 'common_widgets/common_buttons/common_save_button.dart';

String? firstname;
String? lastname;
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

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  File? image;
  @override
  void initState() {
    // TODO: implement initState
    if (firstname != null && lastname != null && email != null && phone != null && address != null) {
      firstNameController.text = firstname!;
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
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0).copyWith(left: context.height(context) * 0.02,top:context.height(context) * 0.02),
                    child: Container(
                       height: context.height(context) * 0.2,
                      width: context.width(context) * 0.3,
                      decoration: BoxDecoration(
                          color: const Color(0xFFF6F6F6),
                          borderRadius: BorderRadius.circular(
                              5),
                          boxShadow: [
                      BoxShadow(
                      color: Colors.black
                          .withOpacity(0.3),
                      blurRadius: 7,
                      offset: const Offset(-1, 4), // Shadow position
                    ),]
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0).copyWith(right: context.height(context) * 0.02),
                      child: Column(
                        children: [
                          CommonTextformfield(
                            labelText: 'First Name',
                            controller: firstNameController,
                            errorText: 'Enter valid name',
                          ),
                          SizedBox(height: context.height(context) * 0.04,),
                          CommonTextformfield(
                            labelText: 'Last Name',
                            controller: lastNameController,
                            errorText: 'Enter valid name',
                          ),

                        ],
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 10,
                      ),

                      CommonTextformfield(
                        labelText: "Email",
                        controller: emailController,
                        errorText: 'Enter valid Mail',
                      ),

                      const SizedBox(
                        height: 30,
                      ),

                      CommonTextformfield(
                        labelText: 'phone',
                        controller: phoneController,
                        errorText: 'Enter Phone NO',
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      CommonLonglineTextfield(
                          controller: addressController,
                          hintText: "Address (Street , Building NO)",
                          errorText: 'Enter Address'),
                      const SizedBox(
                        height: 30,
                      ),
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
              // SizedBox(
              //   height: 400,
              //   // color: Colors.yellow,
              //   child: Center(
              //     child: Stack(
              //       children: [
              //         (image == null)
              //             ? Container(
              //                 height: 120,
              //                 width: 120,
              //                 decoration: const BoxDecoration(
              //                     shape: BoxShape.circle,
              //                     color: Colors.grey),
              //                 child: const Center(
              //                     child: Text(
              //                   'ADD',
              //                   style: TextStyle(
              //                       fontSize: 20, color: Colors.white),
              //                 )),
              //               )
              //             : Container(
              //                 height: 100,
              //                 width: 100,
              //                 decoration: BoxDecoration(
              //                     shape: BoxShape.circle,
              //                     color: Colors.grey,
              //                     image: DecorationImage(
              //                         image: FileImage(image!),
              //                         fit: BoxFit.cover)),
              //               ),
              //         Positioned(
              //           top: 10,
              //           left: 90,
              //           child: InkWell(
              //             onTap: () {
              //               pickImageFromCamera();
              //             },
              //             child: Container(
              //               height: 25,
              //               width: 25,
              //               decoration: const BoxDecoration(
              //                   shape: BoxShape.circle, color: Colors.blue),
              //               child: const Center(
              //                   child: Icon(
              //                 CupertinoIcons.add,
              //                 color: Colors.white,
              //               )),
              //             ),
              //           ),
              //         )
              //       ],
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
