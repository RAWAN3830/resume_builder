import 'package:cloud_firestore/cloud_firestore.dart';

class SkillsRepository {
  final FirebaseFirestore _firestore;

  SkillsRepository({FirebaseFirestore? firestore})
      : _firestore = firestore ?? FirebaseFirestore.instance;

  Future<Map<String, List<String>>> getSkillCategories() async {
    final snapshot = await _firestore.collection('skills_categories').get();
    final Map<String, List<String>> categories = {};

    for (var doc in snapshot.docs) {
      categories[doc.id] = List<String>.from(doc.data()['skills'] ?? []);
    }

    return categories;
  }

  Future<void> updateSkillCategory(String category, List<String> skills) async {
    await _firestore
        .collection('skills_categories')
        .doc(category)
        .set({'skills': skills});
  }
}