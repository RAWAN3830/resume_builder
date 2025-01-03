import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:resume/core/constant/extension.dart';
import 'package:resume/core/constant/strings.dart';
import 'package:resume/infra/bloc/personal_info_bloc/personal_info_bloc.dart';
import 'package:resume/infra/bloc/personal_info_bloc/personal_info_state.dart';
import 'package:resume/presentation/common_widgets/common_buttons/common_add_field_button.dart';
import 'package:resume/presentation/common_widgets/common_buttons/common_reset_button.dart';
import 'package:resume/presentation/common_widgets/common_text/common_heading.dart';
import 'package:resume/presentation/common_widgets/common_textfields/comman_textformfield.dart';
import 'package:resume/presentation/common_widgets/common_textfields/common_longlinetextfield.dart';
import 'package:resume/presentation/home_screen/example.dart';
import '../domain/personal_info.dart';
import '../infra/bloc/personal_info_bloc/personal_info_event.dart';
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

//  final PersonalInfoModel personalInfoModel = PersonalInfoModel();
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
      lastNameController.text = lastname ?? '';
      emailController.text = email ?? '';
      phoneController.text = phone ?? '';
      jobTitleController.text = jobTitle ?? '';
      addressController.text = address ?? '';
    }
  }

  // pickImageFromCamera() async {
  //   var imageFile = await ImagePicker().pickImage(source: ImageSource.camera);
  //   if (imageFile != null) {
  //     setState(() {
  //       image = File(imageFile.path);
  //     });
  //   }
  // }

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
    var height = MediaQuery.of(context).size.height * 0.01;
    var width = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        appBar: const CustomAppBar(
          title: 'Contact info',
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [

              Padding(
                padding: const EdgeInsets.all(20.0).copyWith(top: 0),
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

                      const CommonHeading(title: "Email"),
                      CommonTextformfield(
                        labelText: "Email",
                        controller: emailController,
                        errorText: 'Enter valid Mail',
                      ),

                      const CommonHeading(title: "Phone"),
                      CommonTextformfield(
                        labelText: 'Phone',
                        controller: phoneController,
                        errorText: 'Enter Phone NO',
                      ),

                      const CommonHeading(title: "Job Title"),
                      CommonTextformfield(
                        labelText: 'Full Stack Devloper',
                        controller: jobTitleController,
                        errorText: 'Enter Job Title',
                      ),

                      const CommonHeading(title: "Address"),
                      CommonLonglineTextfield(
                          controller: addressController,
                          hintText: "Address (Street , Building NO)",
                          errorText: 'Enter Address'),

                      const CommonHeading(title: 'Links'),
                      ListView.builder(
                        shrinkWrap: true,
                        // Allows ListView to be rendered inside a scrollable parent
                        physics: const NeverScrollableScrollPhysics(),
                        // Prevents ListView from scrolling separately
                        itemCount: fieldControllers.length,
                        itemBuilder: (context, index) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Link ${index + 1}',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium
                                          ?.copyWith(
                                              fontWeight: FontWeight.bold)),
                                  IconButton(
                                    icon: const Icon(Icons.delete,
                                        color: Colors.red),
                                    onPressed: () => removeFields(index),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: CommonTextformfield(
                                      labelText: 'Link',
                                      controller: fieldControllers[index]
                                          ['link'] as TextEditingController,
                                      errorText: 'Enter valid link',
                                    ),
                                  ),
                                  SizedBox(
                                      width: context.width(context) * 0.03),
                                  Expanded(
                                    child: CommonTextformfield(
                                      labelText: 'Link Name',
                                      controller: fieldControllers[index]
                                          ['name'] as TextEditingController,
                                      errorText: 'Enter valid name',
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          );
                        },
                      ),
                      SizedBox(
                        height: height,
                      ),
                      CommonAddFieldButton(
                        onTap: addFields,
                        name: 'Add Field',
                      ),

                      // Container(
                      //   decoration: BoxDecoration(
                      //     border: Border.all(color: ThemeColors.black,width: 2)
                      //   ),
                      //   height: context.height(context) * 0.25,
                      //   width: double.infinity,
                      //   child: ListView.builder(
                      //     itemCount: fieldControllers.length,
                      //     itemBuilder: (context, index) {
                      //       return Card(
                      //         child: Padding(
                      //           padding: const EdgeInsets.all(8.0),
                      //           child: Column(
                      //             children: [
                      //               CommonTextformfield(labelText: 'Link', controller: fieldControllers[index]['link'] as TextEditingController, errorText: 'addData'),
                      //               const SizedBox(height: 8),
                      //               CommonTextformfield(labelText: 'LinkName', controller: fieldControllers[index]['name'] as TextEditingController, errorText: 'addData'),
                      //               const SizedBox(height: 8),
                      //               Align(
                      //                 alignment: Alignment.centerRight,
                      //                 child: IconButton(
                      //                   icon: const Icon(Icons.delete, color: Colors.red),
                      //                   onPressed: () => removeFields(index),
                      //                 ),
                      //               ),
                      //             ],
                      //           ),
                      //         ),
                      //       );
                      //     },
                      //   ),
                      // ),
                      //
                      // CommonAddFieldButton(onTap:  (){addFields();}, name: 'Add Fields'),

                      SizedBox(height: height),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          BlocConsumer<PersonalInfoBloc, PersonalInfoState>(
                              listener: (context, state) {
                                if (state is PersonalInfoSuccess) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(content: Text('Personal Info Added Successfully!')),
                                  );
                                } else if (state is PersonalInfoFailure) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text('Error: ${state.error}')),
                                  );
                                }
                              },
                              builder: (context, state) {
                                if (state is PersonalInfoLoading) {
                                  return const Center(child: CircularProgressIndicator());
                                }

                                return CommonSaveButton(
                                      formKey: formKey,
                                      onTap: () {
                                        if (formKey.currentState!.validate()) {
                                          formKey.currentState!.save();
                                          List<Links> allLinks =
                                              fieldControllers.map((field) {
                                            return Links(
                                              name: field['name']?.text ?? '',
                                              link: field['link']?.text ?? '',
                                            );
                                          }).toList();

                                          PersonalInfoModel personalInfoModel =
                                              PersonalInfoModel(
                                            firstname: firstNameController.text,
                                            lastname: lastNameController.text,
                                            email: emailController.text,
                                            phone: phoneController.text,
                                            jobTitle: jobTitleController.text,
                                            address: addressController.text,
                                            links: allLinks,
                                          );
                                          context.read<PersonalInfoBloc>().add(
                                            AddPersonalInfoEvent(personalInfoModel, context),
                                          );
                                          context.push(context, target: const PersonalInfoList());
                                        }
                                      },
                                      name: Strings.saveContinue,
                                    );
                            }
                          ),
                          CommonResetButton(formKey: formKey, onTap: (){},)
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
