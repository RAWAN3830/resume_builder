import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:resume/infra/bloc/education_bloc/education_bloc.dart';
import 'package:resume/infra/bloc/education_bloc/education_event.dart';
import 'package:resume/infra/bloc/education_bloc/education_state.dart';

import 'common_widgets/common_appbar/custome_appbar.dart';
import 'common_widgets/common_buttons/common_add_field_button.dart';
import 'common_widgets/common_buttons/common_reset_button.dart';
import 'common_widgets/common_buttons/common_save_button.dart';
import 'common_widgets/common_text/common_heading.dart';
import 'common_widgets/common_textfields/comman_textformfield.dart';
import 'common_widgets/common_textfields/common_years_textfield.dart';
import '../core/constant/extension.dart';
import '../core/constant/strings.dart';

class EducationInfo extends StatelessWidget {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  EducationInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => EducationBloc(),
      child: Scaffold(
        appBar: const CustomAppBar(title: 'Education'),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: BlocBuilder<EducationBloc, EducationState>(
              builder: (context, state) {
                return Form(
                  key: formKey,
                  child: Column(
                    children: [
                      ...List.generate(state.controllersList.length, (index) {
                        var controllers = state.controllersList[index];
                        return ExpansionTile(
                          initiallyExpanded: state.expansionStates[index],
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                controllers['institution']!.text.isEmpty
                                    ? 'Education Details ${index + 1}'
                                    : controllers['institution']!.text,
                                style: const TextStyle(fontWeight: FontWeight.bold),
                              ),
                              if (state.controllersList.length > 1)
                                IconButton(
                                  onPressed: () => context.read<EducationBloc>().add(DeleteEducationField(index)),
                                  icon: const Icon(Icons.delete, color: Colors.red),
                                ),
                            ],
                          ),
                          onExpansionChanged: (isExpanded) {
                            context.read<EducationBloc>().add(UpdateExpansionState(index, isExpanded));
                          },
                          expandedCrossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CommonHeading(title: 'Institution (${index + 1})'),
                            CommonTextformfield(
                                controller: controllers['institution']!,
                                labelText: 'xyz University',
                                errorText: 'Enter Institution'),

                            CommonHeading(title: 'Location (${index + 1})'),
                            CommonTextformfield(
                                controller: controllers['location']!,
                                labelText: 'Gujarat, India',
                                errorText: 'Enter Location'),

                            CommonHeading(title: 'Degree Type (${index + 1})'),
                            CommonTextformfield(
                                controller: controllers['degreeType']!,
                                labelText: 'Bachelors/Master',
                                errorText: 'Enter Degree Type'),

                            CommonHeading(title: 'Field of Study (${index + 1})'),
                            CommonTextformfield(
                                controller: controllers['fieldOfStudy']!,
                                labelText: 'Computer Science',
                                errorText: 'Enter Field of Study'),

                            CommonYearsTextfield(
                              startDateController: controllers['startDate']!,
                              endDateController: controllers['endDate']!,
                            ),
                          ],
                        );
                      }),
                      if (state.controllersList.length < 4)
                        SizedBox(height: context.height(context) * 0.02),
                      CommonAddFieldButton(
                        onTap: () {
                          context.read<EducationBloc>().add(AddEducationField());
                        },
                        name: 'Add Education',
                      ),
                      SizedBox(height: context.height(context) * 0.02),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          CommonSaveButton(
                            formKey: formKey,
                            onTap: () {
                              if (formKey.currentState!.validate()) {
                                context.read<EducationBloc>().add(SaveEducation());
                              }
                            },
                            name: Strings.saveContinue,
                          ),
                          CommonResetButton(
                            formKey: formKey,
                            onTap: () {
                              formKey.currentState!.reset();
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}