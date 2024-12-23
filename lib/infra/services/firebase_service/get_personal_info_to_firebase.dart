import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:resume/domain/personal_info.dart';

class GetPersonalInfoToFirebase {
  final CollectionReference _personalInfoCollection =
      FirebaseFirestore.instance.collection('personalInfo');

  Future<List<PersonalInfoModel>> getAllPersonalInfo() async {
    try {
      final querySnapshot = await _personalInfoCollection.get();
      return querySnapshot.docs.map((doc) {
        return PersonalInfoModel.fromMap(doc.data() as Map<String, dynamic>);
      }).toList();
    } catch (e) {
      print('Error fetching all personal info: $e');
      return [];
    }
  }
}
