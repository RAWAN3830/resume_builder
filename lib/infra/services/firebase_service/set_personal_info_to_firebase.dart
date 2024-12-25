import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:resume/domain/personal_info.dart';

class PersonalInfoRepository {
  static Future<dynamic> addPersonInfoToFirebase(
      PersonalInfoModel personalInfoModel, BuildContext context) async {
    final CollectionReference personalInfoCollection =
        FirebaseFirestore.instance.collection('personalInfo');

    try {
      await personalInfoCollection.add({
        'firstname': personalInfoModel.firstname,
        'lastname': personalInfoModel.lastname,
        'email': personalInfoModel.email,
        'phone': personalInfoModel.phone,
        'jobTitle': personalInfoModel.jobTitle,
        'address': personalInfoModel.address,
        'links': personalInfoModel.links
            .map((link) => {'name': link.name, 'link': link.link})
            .toList(),
      });

      const snackBar =
          SnackBar(content: Text('Data submitted successfully to Firestore.'));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } catch (e) {
      final snackBar = SnackBar(content: Text('Error saving data: $e'));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }
}
