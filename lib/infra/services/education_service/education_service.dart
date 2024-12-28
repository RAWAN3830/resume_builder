import 'package:cloud_firestore/cloud_firestore.dart';

class EducationService {
  final FirebaseFirestore _firestore;

  EducationService(this._firestore);

  // Method to save education data to Firestore
  Future<void> saveEducationData(String userId, List<Map<String, dynamic>> educationData) async {
    try {
      await _firestore.collection('users').doc(userId).set({
        'education': educationData,
      });
      print('Education details saved successfully!');
    } catch (e) {
      print('Error saving education details: $e');
    }
  }
}