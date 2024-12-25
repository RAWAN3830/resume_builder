import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:resume/infra/bloc/personal_info_bloc/personal_info_bloc.dart';
import 'package:resume/infra/bloc/personal_info_bloc/personal_info_event.dart';
import 'package:resume/infra/bloc/personal_info_bloc/personal_info_state.dart';

class PersonalInfoList extends StatelessWidget {
  const PersonalInfoList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PersonalInfoBloc()..add(GetPersonalInfoEvent()),
      child: Scaffold(
        appBar: AppBar(title: Text('Personal Info')),
        body: BlocBuilder<PersonalInfoBloc, PersonalInfoState>(
          builder: (context, state) {
            if (state is PersonalInfoLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is PersonalInfoFailure) {
              return Center(child: Text('Error: ${state.error}'));
            } else if (state is PersonalInfoLoaded) {
              final data = state.personalInfoList;
              if (data.isEmpty) {
                return Center(child: Text('No data available.'));
              } else {
                return ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    final info = data[index];
                    return ListTile(
                      title: Text('${info.firstname} ${info.lastname}'),
                      subtitle: Text(info.email),
                    );
                  },
                );
              }
            } else {
              return const Center(child: Text('Please wait...'));
            }
          },
        ),
      ),
    );
  }
}