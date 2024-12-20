import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:resume/core/constant/extension.dart';
import 'package:resume/core/constant/strings.dart';
import 'package:resume/core/constant/theme_colors.dart';
import 'package:resume/presentation/common_widgets/common_buttons/common_reset_button.dart';
import 'package:resume/presentation/common_widgets/common_text/common_heading.dart';
import 'package:resume/presentation/common_widgets/common_textfields/comman_textformfield.dart';
import 'package:resume/presentation/common_widgets/common_textfields/common_longlinetextfield.dart';
import '../domain/personal_info.dart';
import 'common_widgets/common_appbar/custome_appbar.dart';
import 'common_widgets/common_buttons/common_save_button.dart';

String? firstname;
String? lastname;
String? email;
String? phone;
String? jobTitle;
String? address;


class PersonalInfo extends StatefulWidget {
  const PersonalInfo({super.key});

  @override
  State<PersonalInfo> createState() => _PersonalInfoState();
}

class _PersonalInfoState extends State<PersonalInfo> {
  int indexCount = 0;

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController jobTitleController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  List<Map<String, TextEditingController>> fieldControllers = [];
  File? image;

  @override
  void initState() {
    super.initState();
    if (firstname != null &&
        lastname != null &&
        email != null &&
        phone != null &&
        jobTitle != null &&
        address != null) {
      firstNameController.text = firstname ?? '';
      lastNameController.text = lastname!;
      emailController.text = email!;
      phoneController.text = phone!;
      jobTitleController.text = jobTitle!;
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

  void addFields() {
    setState(() {
      fieldControllers.add({
        'link': TextEditingController(),
        'name': TextEditingController(),
      });
    });
  }

  void removeFields(int index) {
    setState(() {
      fieldControllers.removeAt(index);
    });
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
        appBar:  CustomAppBar(title: 'Contact info',

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
                                const CommonHeading(title: 'First Name'),
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
                                const CommonHeading(title: 'Last Name'),
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
                      const CommonHeading(title: "Email"),
                      CommonTextformfield(
                        labelText: "Email",
                        controller: emailController,
                        errorText: 'Enter valid Mail',
                      ),
                      SizedBox(height: height),
                      const CommonHeading(title: "Phone"),
                      CommonTextformfield(
                        labelText: 'Phone',
                        controller: phoneController,
                        errorText: 'Enter Phone NO',
                      ),
                      SizedBox(height: height),
                      const CommonHeading(title: "Job Title"),
                      CommonTextformfield(
                        labelText: 'Full Stack Devloper',
                        controller: jobTitleController,
                        errorText: 'Enter Job Title',
                      ),
                      SizedBox(height: height),
                      const CommonHeading(title: "Address"),
                      CommonLonglineTextfield(
                          controller: addressController,
                          hintText: "Address (Street , Building NO)",
                          errorText: 'Enter Address'),
                      SizedBox(height: height),
                      const CommonHeading(title: 'Links'),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: ThemeColors.black,width: 2)
                        ),
                        height: context.height(context) * 0.25,
                        width: double.infinity,
                        child: ListView.builder(
                          itemCount: fieldControllers.length,
                          itemBuilder: (context, index) {
                            return Card(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    CommonTextformfield(labelText: 'Link', controller: fieldControllers[index]['link'] as TextEditingController, errorText: 'addData'),
                                    const SizedBox(height: 8),
                                    CommonTextformfield(labelText: 'LinkName', controller: fieldControllers[index]['name'] as TextEditingController, errorText: 'addData'),
                                    const SizedBox(height: 8),
                                    Align(
                                      alignment: Alignment.centerRight,
                                      child: IconButton(
                                        icon: const Icon(Icons.delete, color: Colors.red),
                                        onPressed: () => removeFields(index),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      ElevatedButton(
                        onPressed: addFields,
                        child: const Text('Add Fields'),
                      ),

                      SizedBox(height: height),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          CommonSaveButton(
                            formKey: formKey,
                            onTap: () {
                              if (formKey.currentState!.validate()) {

                                List<Links> allLinks = fieldControllers.map((field) {
                                  return Links(
                                    name: field['name']?.text ?? 'error',
                                    link: field['link']?.text ?? 'error',
                                  );
                                }).toList();


                                PersonalInfoModel personalInfo = PersonalInfoModel(
                                  firstname: firstNameController.text,
                                  lastname: lastNameController.text,
                                  email: emailController.text,
                                  phone: phoneController.text,
                                  jobTitle: jobTitleController.text,
                                  address: addressController.text,
                                  links: allLinks,
                                );

                                print("Personal Info Saved: ${personalInfo.firstname}");
                                print("Links: ${personalInfo.links.map((e) => '${e.name}: ${e.link}').join(", ")}");

                              }
                            },
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



