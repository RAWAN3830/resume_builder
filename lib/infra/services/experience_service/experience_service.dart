import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../domain/experience_model.dart';


class ExperienceService {
  final FirebaseFirestore _firestore;
  final List<ExperienceModel> experienceList = [];

  ExperienceService(this._firestore);

  // Save experience data to Firestore
  Future<void> saveExperienceData(String userId, List<Map<String, dynamic>> experienceData) async {
    try {
      await _firestore.collection('users').doc(userId).set({
        'experience': experienceData,
      }, SetOptions(merge: true));
      print('Experience details saved successfully!');
    } catch (e) {
      print('Error saving experience details: $e');
      throw e;
    }
  }

  // Get experience data from Firestore
  Future<List<ExperienceModel>> getExperienceData(String userId) async {
    try {
      final docSnapshot = await _firestore.collection('users').doc(userId).get();
      if (docSnapshot.exists && docSnapshot.data()!.containsKey('experience')) {
        final List<dynamic> data = docSnapshot.data()!['experience'];
        return data.map((item) => ExperienceModel.fromMap(item)).toList();
      }
      return [];
    } catch (e) {
      print('Error getting experience details: $e');
      throw e;
    }
  }

  // Local operations
  void addExperience(ExperienceModel experienceModel) {
    experienceList.add(experienceModel);
  }

  void updateExperience(int index, ExperienceModel updatedExperience) {
    if (index >= 0 && index < experienceList.length) {
      experienceList[index] = updatedExperience;
    }
  }

  void deleteExperience(int index) {
    if (index >= 0 && index < experienceList.length) {
      experienceList.removeAt(index);
    }
  }

  void resetExperience() {
    experienceList.clear();
  }
}