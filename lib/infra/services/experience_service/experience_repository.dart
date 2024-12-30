import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../domain/experience_model.dart';
import 'experience_service.dart';

class ExperienceRepository {
  final ExperienceService _experienceService;

  ExperienceRepository(FirebaseFirestore firestore)
      : _experienceService = ExperienceService(firestore);

  Future<void> saveExperience(String userId, List<ExperienceModel> experiences) async {
    final experienceData = experiences.map((exp) => exp.toMap()).toList();
    await _experienceService.saveExperienceData(userId, experienceData);
  }

  Future<List<ExperienceModel>> getExperience(String userId) async {
    return await _experienceService.getExperienceData(userId);
  }

  // Local operations delegated to service
  void addExperience(ExperienceModel experience) {
    _experienceService.addExperience(experience);
  }

  void updateExperience(int index, ExperienceModel experience) {
    _experienceService.updateExperience(index, experience);
  }

  void deleteExperience(int index) {
    _experienceService.deleteExperience(index);
  }

  void resetExperience() {
    _experienceService.resetExperience();
  }
}