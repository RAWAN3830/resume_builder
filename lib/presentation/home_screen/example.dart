import 'package:flutter/material.dart';
import 'package:resume/domain/personal_info.dart';
import 'package:resume/infra/services/firebase_service/get_personal_info_to_firebase.dart';
import 'package:resume/infra/services/firebase_service/personal_info_repository.dart';

class PersonalInfoList extends StatelessWidget {
  final GetPersonalInfoToFirebase repository = GetPersonalInfoToFirebase();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Personal Info')),
      body: FutureBuilder<List<PersonalInfoModel>>(
        future: repository.getAllPersonalInfo(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No data available.'));
          } else {
            final data = snapshot.data!;
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
        },
      ),
    );
  }
}
