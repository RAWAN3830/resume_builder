
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:resume/domain/personal_info.dart';

class PersonalInfoRepository {
  final CollectionReference _personalInfoCollection =
  FirebaseFirestore.instance.collection('personalInfo');

  Future<void> savePersonalInfo(PersonalInfoModel personalInfo) async {
    await _personalInfoCollection.add({
      'firstname': personalInfo.firstname,
      'lastname': personalInfo.lastname,
      'email': personalInfo.email,
      'phone': personalInfo.phone,
      'jobTitle': personalInfo.jobTitle,
      'address': personalInfo.address,
      'links': personalInfo.links
          .map((link) => {'name': link.name, 'link': link.link})
          .toList(),
    });
  }
}
