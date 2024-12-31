import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:resume/core/constant/extension.dart';
import 'package:resume/core/constant/strings.dart';
import 'package:resume/presentation/common_widgets/common_buttons/common_add_field_button.dart';
import 'package:resume/presentation/common_widgets/common_buttons/common_save_button.dart';
import 'package:resume/presentation/common_widgets/common_text/common_heading.dart';
import 'package:resume/presentation/common_widgets/common_textfields/comman_textformfield.dart';
import 'package:resume/presentation/common_widgets/common_textfields/common_longlinetextfield.dart';
import 'package:resume/presentation/common_widgets/common_textfields/common_years_textfield.dart';
import 'package:resume/presentation/common_widgets/common_appbar/custome_appbar.dart';
import '../infra/bloc/experiences_bloc/experiences_bloc.dart';
import '../infra/bloc/experiences_bloc/experiences_events.dart';
import '../infra/bloc/experiences_bloc/experiences_state.dart';
import 'common_widgets/common_buttons/common_reset_button.dart';

class ExperienceScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  ExperienceScreen({Key? key}) : super(key: key);

  Widget _buildExperienceForm(
      Map<String, TextEditingController> controllers,
      int index,
      bool isExpanded,
      BuildContext context,
      ExperienceBloc bloc,
      ) {

    return ExpansionTile(
      initiallyExpanded: isExpanded,
      onExpansionChanged: (expanded) {
        bloc.add(UpdateExpansionState(index, expanded));
      },
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            controllers['employer']!.text.isEmpty
                ? 'Experience Details ${index + 1}'
                : controllers['employer']!.text,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          if (bloc.state.controllersList.length > 1)
            IconButton(
              onPressed: () => bloc.add(DeleteExperienceField(index)),
              icon: const Icon(Icons.delete, color: Colors.red),
            ),
        ],
      ),
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0).copyWith(top: 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CommonHeading(title: 'Employer'),
              CommonTextformfield(
                labelText: 'ex. Google',
                controller: controllers['employer']!,
                errorText: 'Please enter a valid company name',
              ),

              const CommonHeading(title: 'Job Title'),
              CommonTextformfield(
                labelText: 'Senior Software Engineer',
                controller: controllers['jobTitle']!,
                errorText: 'Please enter a valid job title',
              ),

              const CommonHeading(title: 'Location'),
              CommonTextformfield(
                labelText: 'San Francisco, USA',
                controller: controllers['location']!,
                errorText: 'Please enter a valid location',
              ),

              CommonYearsTextfield(
                startDateController: controllers['startDate']!,
                endDateController: controllers['endDate']!,
              ),

              const CommonHeading(title: 'Description'),
              CommonLonglineTextfield(
                controller: controllers['description']!,
                hintText: 'Describe your role and responsibilities',
                errorText: 'Please describe your role',
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ExperienceBloc(
        firestore: FirebaseFirestore.instance,
      )..add(AddExperienceField()),
      child: Builder(
        builder: (context) {
          final bloc = context.read<ExperienceBloc>();
          return Scaffold(
            appBar: const CustomAppBar(title: 'Experience'),
            body: BlocBuilder<ExperienceBloc, ExperienceState>(
              builder: (context, state) {
                return SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          ...List.generate(
                            state.controllersList.length,
                                (index) => _buildExperienceForm(
                              state.controllersList[index],
                              index,
                              state.expansionStates[index],
                              context,
                              bloc,
                            ),
                          ),
                          if (state.controllersList.length < 4)
                            CommonAddFieldButton(
                              onTap: () => bloc.add(AddExperienceField()),
                              name: 'Add Experience',
                            ),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              CommonSaveButton(
                                formKey: _formKey,
                                onTap: () => bloc.add(SaveExperience()),
                                name: Strings.saveContinue,
                              ),
                              CommonResetButton(
                                formKey: _formKey,
                                onTap: () {
                                  _formKey.currentState!.reset();
                                },
                              ),
                            ],
                          ),

                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}