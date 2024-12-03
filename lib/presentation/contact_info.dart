import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:resume/core/constant/extension.dart';
import 'package:resume/core/constant/strings.dart';
import 'package:resume/presentation/common_widgets/common_buttons/common_reset_button.dart';
import 'package:resume/presentation/common_widgets/common_text/common_heading.dart';
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
    super.initState();
    if (firstname != null &&
        lastname != null &&
        email != null &&
        phone != null &&
        address != null) {
      firstNameController.text = firstname!;
      lastNameController.text = lastname!;
      emailController.text = email!;
      phoneController.text = phone!;
      addressController.text = address!;
    }
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
    var height = MediaQuery.of(context).size.height * 0.02;
    var width = MediaQuery.of(context).size.width;

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
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CommonHeading(title: 'First Name'),
                                CommonTextformfield(
                                  labelText: 'First Name',
                                  controller: firstNameController,
                                  errorText: 'Enter valid name',
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: width * 0.05),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CommonHeading(title: 'Last Name'),
                                CommonTextformfield(
                                  labelText: 'Last Name',
                                  controller: lastNameController,
                                  errorText: 'Enter valid name',
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: height),
                      CommonHeading(title: "Email"),
                      CommonTextformfield(
                        labelText: "Email",
                        controller: emailController,
                        errorText: 'Enter valid Mail',
                      ),
                      SizedBox(height: height),
                      CommonHeading(title: "Phone"),
                      CommonTextformfield(
                        labelText: 'Phone',
                        controller: phoneController,
                        errorText: 'Enter Phone NO',
                      ),
                      SizedBox(height: height),
                      CommonHeading(title: "Job Title"),
                      CommonTextformfield(
                        labelText: 'Full Stack Devloper',
                        controller: phoneController,
                        errorText: 'Enter Job Title',
                      ),
                      SizedBox(height: height),
                      CommonHeading(title: "Address"),
                      CommonLonglineTextfield(
                          controller: addressController,
                          hintText: "Address (Street , Building NO)",
                          errorText: 'Enter Address'),
                      SizedBox(height: height),
                      CommonHeading(title: 'Links'),
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CommonTextformfield(
                                  labelText: 'Your Link Here',
                                  controller: firstNameController,
                                  errorText: 'Enter valid Link',
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: width * 0.05),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CommonTextformfield(
                                  labelText: 'select..',
                                  controller: lastNameController,
                                  errorText: 'Enter valid value',
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: height),
                      Container(
                        height: context.height(context) * 0.05,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(color: Colors.black, width: 2)),
                        child: Center(child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(CupertinoIcons.plus,color: Colors.black,size: 30),
                            Text('ADD LINK',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 18),)
                          ],
                        ),),
                      ),
                      SizedBox(height: height),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          CommonSaveButton(
                            formKey: formKey,
                            onTap: () {},
                            name: Strings.saveContinue,
                          ),
                          CommonResetButton(formKey: formKey)
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// import 'dart:io';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:resume/core/constant/extension.dart';
// import 'package:resume/core/constant/strings.dart';
// import 'package:resume/presentation/common_widgets/common_buttons/common_reset_button.dart';
// import 'package:resume/presentation/common_widgets/common_text/common_heading.dart';
// import 'package:resume/presentation/common_widgets/common_textfields/comman_textformfield.dart';
// import 'package:resume/presentation/common_widgets/common_textfields/common_longlinetextfield.dart';
//
// import 'common_widgets/common_buttons/common_save_button.dart';
//
// String? firstname;
// String? lastname;
// String? email;
// String? phone;
// String? address;
//
// class ContactInfo extends StatefulWidget {
//   const ContactInfo({super.key});
//
//   @override
//   State<ContactInfo> createState() => _ContactInfoState();
// }
//
// class _ContactInfoState extends State<ContactInfo> {
//   int indexCount = 0;
//
//   TextEditingController firstNameController = TextEditingController();
//   TextEditingController lastNameController = TextEditingController();
//   TextEditingController emailController = TextEditingController();
//   TextEditingController phoneController = TextEditingController();
//   TextEditingController addressController = TextEditingController();
//   final formKey = GlobalKey<FormState>();
//   File? image;
//   @override
//   void initState() {
//     // TODO: implement initState
//     if (firstname != null && lastname != null && email != null && phone != null && address != null) {
//       firstNameController.text = firstname!;
//       emailController.text = email!;
//       phoneController.text = phone!;
//       addressController.text = address!;
//     }
//     super.initState();
//   }
//
//   pickImageFromCamera() async {
//     var imageFile = await ImagePicker().pickImage(source: ImageSource.camera);
//     if (imageFile != null) {
//       setState(() {
//         image = File(imageFile.path);
//       });
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     var height = context.height(context) * 0.02;
//     return GestureDetector(
//       onTap: () {
//         FocusManager.instance.primaryFocus?.unfocus();
//       },
//       child: Scaffold(
//         appBar: AppBar(
//           backgroundColor: Colors.blue,
//           title:
//               const Text('Contact Info', style: TextStyle(color: Colors.white)),
//         ),
//         body: SingleChildScrollView(
//           child: Column(
//            children: [
//               const SizedBox(height: 20),
//               Padding(
//                 padding: const EdgeInsets.all(20.0),
//                 child: Form(
//                   key: formKey,
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       SizedBox(height:height ),
//                       CommonHeading(title: 'First name'),
//                       CommonTextformfield(
//                         labelText: 'First Name',
//                         controller: firstNameController,
//                         errorText: 'Enter valid name',
//                       ),
//                       SizedBox(height:height ),
//                       CommonTextformfield(
//                         labelText: 'Last Name',
//                         controller: lastNameController,
//                         errorText: 'Enter valid name',
//                       ),
//                       SizedBox(height:height ),
//                       CommonTextformfield(
//                         labelText: "Email",
//                         controller: emailController,
//                         errorText: 'Enter valid Mail',
//                       ),
//
//                       SizedBox(height:height ),
//
//                       CommonTextformfield(
//                         labelText: 'phone',
//                         controller: phoneController,
//                         errorText: 'Enter Phone NO',
//                       ),
//                       SizedBox(height:height ),
//                       CommonLonglineTextfield(
//                           controller: addressController,
//                           hintText: "Address (Street , Building NO)",
//                           errorText: 'Enter Address'),
//                       SizedBox(height:height ),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceAround,
//                         children: [
//                          CommonSaveButton(formKey: formKey, onTap: (){}, name:Strings.saveContinue,),
//                           CommonResetButton(formKey: formKey)
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
